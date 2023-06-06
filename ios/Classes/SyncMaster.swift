import Flutter

internal class SyncMaster {
    private let channel: FlutterMethodChannel
    let masterId: String

    init(binaryMessenger: FlutterBinaryMessenger, masterId: String) {
        self.channel = FlutterMethodChannel(name: "dev.masel.synced_bloc.master.\(masterId)", binaryMessenger: binaryMessenger)
        self.masterId = masterId
    }

    func getState(onSuccess: @escaping (Any?) -> Void, onError: @escaping () -> Void) {
        channel.invokeMethod("getState", arguments: nil) { result in
            if let res = result {
                onSuccess(res)
            } else {
                onError()
            }
        }
    }

    func addEvent(event: String) {
        channel.invokeMethod("addEvent", arguments: event)
    }
}
