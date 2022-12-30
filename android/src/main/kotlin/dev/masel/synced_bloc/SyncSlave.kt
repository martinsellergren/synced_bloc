package dev.masel.synced_bloc

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

internal class SyncSlave(
    binaryMessenger: BinaryMessenger,
    val masterId: String,
    val slaveId: String
) {
    private val channel = MethodChannel(binaryMessenger, "dev.masel.synced_bloc.slave.$masterId.$slaveId")

    fun notifyMasterChange() =
        channel.invokeMethod("notifyMasterChange", null)
}