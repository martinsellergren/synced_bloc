package dev.masel.synced_bloc

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

internal class SyncSubscriber(
    binaryMessenger: BinaryMessenger,
    val masterId: String,
    val subscriberId: String
) {
    private val channel = MethodChannel(binaryMessenger, "dev.masel.synced_bloc.subscriber.$masterId.$subscriberId")

    fun notifyMasterChange() =
        channel.invokeMethod("notifyMasterChange", null)
}