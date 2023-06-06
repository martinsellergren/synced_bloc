import Flutter

internal struct SyncSlave: Equatable {
    private let channel: FlutterMethodChannel
    let masterId: String
    let slaveId: String

    init(binaryMessenger: FlutterBinaryMessenger, masterId: String, slaveId: String) {
        self.channel = FlutterMethodChannel(name: "dev.masel.synced_bloc.slave.\(masterId).\(slaveId)", binaryMessenger: binaryMessenger)
        self.masterId = masterId
        self.slaveId = slaveId
    }

    func notifyMasterChange() {
        channel.invokeMethod("notifyMasterChange", arguments: nil)
    }

    static func == (lhs: SyncSlave, rhs: SyncSlave) -> Bool {
        return lhs.masterId == rhs.masterId && lhs.slaveId == rhs.slaveId
    }
}
