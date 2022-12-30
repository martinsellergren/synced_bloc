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
        val slaves: MutableList<SyncSlave> = mutableListOf()

        fun getSlavesOfMaster(masterId: String): List<SyncSlave> {
            return slaves.filter { slave -> slave.masterId == masterId }
        }

        fun getMasterWithId(masterId: String): SyncMaster? {
            return masters.firstOrNull { it.masterId == masterId }
        }

        fun getSlaveWithId(masterId: String, slaveId: String): SyncSlave? {
            return slaves.firstOrNull { it.masterId == masterId && it.slaveId == slaveId }
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
                    NativeSyncSlave.onRegisterMaster(it)
                }
            }
            "unregisterMaster" -> {
                val masterId: String = call.argument("masterId")!!
                getSlavesOfMaster(masterId).forEach { slaves.remove(it) }
                masters.remove(getMasterWithId(masterId))
                NativeSyncSlave.onUnregisterMaster(masterId)
            }
            "registerSlave" -> {
                val masterId: String = call.argument("masterId")!!
                val slaveId: String = call.argument("slaveId")!!
                if (getMasterWithId(masterId) == null) throw Error()
                slaves.add(SyncSlave(binaryMessenger, masterId, slaveId))
            }
            "unregisterSlave" -> {
                val masterId: String = call.argument("masterId")!!
                val slaveId: String = call.argument("slaveId")!!
                slaves.remove(getSlaveWithId(masterId, slaveId))
            }
            "notifyChange" -> {
                val masterId: String = call.argument("masterId")!!
                getSlavesOfMaster(masterId).forEach { it.notifyMasterChange() }
                NativeSyncSlave.onMasterChange(masterId)
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