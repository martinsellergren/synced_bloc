package dev.masel.synced_bloc

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

internal class SyncMaster(
    binaryMessenger: BinaryMessenger,
    val masterId: String
) {
    private val channel = MethodChannel(binaryMessenger, "dev.masel.synced_bloc.master.$masterId")

    fun getState(onSuccess: (res: Any?) -> Unit, onError: () -> Unit) {
        channel.invokeMethod(
            "getState",
            null,
            object : MethodChannel.Result {
                override fun success(res: Any?) = onSuccess(res)

                override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) =
                    onError()

                override fun notImplemented() = onError()
            })
    }

    fun addEvent(event: String) =
        channel.invokeMethod("addEvent", event)
}