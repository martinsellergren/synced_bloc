package dev.masel.synced_bloc

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class SyncedBlocPlugin : FlutterPlugin, MethodCallHandler {
    internal companion object {
        val masters: MutableList<SyncMaster> = mutableListOf()
        val subscribers: MutableList<SyncSubscriber> = mutableListOf()

        fun getSubscribersOfMaster(masterId: String): List<SyncSubscriber> {
            return subscribers.filter { subscriber -> subscriber.masterId == masterId }
        }

        fun getMasterWithId(masterId: String): SyncMaster? {
            return masters.firstOrNull { it.masterId == masterId }
        }

        fun getSubscriberWithId(masterId: String, subscriberId: String): SyncSubscriber? {
            return subscribers.firstOrNull { it.masterId == masterId && it.subscriberId == subscriberId }
        }
    }

    private lateinit var binaryMessenger: BinaryMessenger
    private lateinit var delegatorChannel: MethodChannel

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binaryMessenger = binding.binaryMessenger
        delegatorChannel = MethodChannel(binaryMessenger, "dev.masel.synced_bloc.delegator")
        delegatorChannel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        delegatorChannel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "registerMaster" -> {
                val masterId: String = call.argument("masterId")!!
                SyncMaster(binaryMessenger, masterId).let {
                    masters.add(it)
                    NativeSyncSubscriber.onRegisterMaster(it)
                }
            }
            "unregisterMaster" -> {
                val masterId: String = call.argument("masterId")!!
                getSubscribersOfMaster(masterId).forEach { subscribers.remove(it) }
                masters.remove(getMasterWithId(masterId))
                NativeSyncSubscriber.onUnregisterMaster(masterId)
            }
            "registerSubscriber" -> {
                val masterId: String = call.argument("masterId")!!
                val subscriberId: String = call.argument("subscriberId")!!
                if (getMasterWithId(masterId) == null) throw Error()
                subscribers.add(SyncSubscriber(binaryMessenger, masterId, subscriberId))
            }
            "unregisterSubscriber" -> {
                val masterId: String = call.argument("masterId")!!
                val subscriberId: String = call.argument("subscriberId")!!
                subscribers.remove(getSubscriberWithId(masterId, subscriberId))
            }
            "notifyChange" -> {
                val masterId: String = call.argument("masterId")!!
                getSubscribersOfMaster(masterId).forEach { it.notifyMasterChange() }
                NativeSyncSubscriber.onMasterChange(masterId)
            }
            "getState" -> {
                val masterId: String = call.argument("masterId")!!
                getMasterWithId(masterId)!!.getState(
                    onSuccess = { res -> result.success(res) },
                    onError = { throw Error() })
            }
            "addEvent" -> {
                val masterId: String = call.argument("masterId")!!
                val event: String = call.argument("event")!!
                getMasterWithId(masterId)!!.addEvent(event)
            }
        }
    }
}