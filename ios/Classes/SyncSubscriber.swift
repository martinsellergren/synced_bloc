import Flutter

internal struct SyncSubscriber: Equatable {
    private let channel: FlutterMethodChannel
    let masterId: String
    let subscriberId: String

    init(binaryMessenger: FlutterBinaryMessenger, masterId: String, subscriberId: String) {
        self.channel = FlutterMethodChannel(name: "dev.masel.synced_bloc.subscriber.\(masterId).\(subscriberId)", binaryMessenger: binaryMessenger)
        self.masterId = masterId
        self.subscriberId = subscriberId
    }

    func notifyMasterChange() {
        channel.invokeMethod("notifyMasterChange", arguments: nil)
    }

    static func == (lhs: SyncSubscriber, rhs: SyncSubscriber) -> Bool {
        return lhs.masterId == rhs.masterId && lhs.subscriberId == rhs.subscriberId
    }
}
