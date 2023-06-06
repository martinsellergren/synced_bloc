import Flutter
import UIKit

public class SwiftSyncedBlocPlugin: NSObject, FlutterPlugin {
    static var masters: [SyncMaster] = []
    static var subscribers: [SyncSubscriber] = []

    static func getSubscribersOfMaster(masterId: String) -> [SyncSubscriber] {
        return subscribers.filter { $0.masterId == masterId }
    }

    static func getMasterWithId(masterId: String) -> SyncMaster? {
        return masters.first { $0.masterId == masterId }
    }

    static func getSubscriberWithId(masterId: String, subscriberId: String) -> SyncSubscriber? {
        return subscribers.first { $0.masterId == masterId && $0.subscriberId == subscriberId }
    }

    private var binaryMessenger: FlutterBinaryMessenger?
    private var methodChannel: FlutterMethodChannel?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = SwiftSyncedBlocPlugin()
        instance.binaryMessenger = registrar.messenger()
        instance.methodChannel = FlutterMethodChannel(name: "dev.masel.synced_bloc.delegator", binaryMessenger: registrar.messenger())
        registrar.addMethodCallDelegate(instance, channel: instance.methodChannel!)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let arguments = call.arguments as! [String: Any]
        let binaryMessenger = self.binaryMessenger!

        switch call.method {
        case "registerMaster":
            let masterId = arguments["masterId"] as! String
            let syncMaster = SyncMaster(binaryMessenger: binaryMessenger, masterId: masterId)
            SwiftSyncedBlocPlugin.masters.append(syncMaster)
            NativeSyncSubscriber.onRegisterMaster(master: syncMaster)
            result(nil)
            break
        case "unregisterMaster":
            let masterId = arguments["masterId"] as! String
            let subscribers = SwiftSyncedBlocPlugin.getSubscribersOfMaster(masterId: masterId)
            subscribers.forEach { SwiftSyncedBlocPlugin.subscribers.remove(at: SwiftSyncedBlocPlugin.subscribers.firstIndex(of: $0)!) }
            SwiftSyncedBlocPlugin.masters.removeAll { $0.masterId == masterId }
            NativeSyncSubscriber.onUnregisterMaster(masterId: masterId)
            result(nil)
            break
        case "registerSubscriber":
            let masterId = arguments["masterId"] as! String
            let subscriberId = arguments["subscriberId"] as! String
            if SwiftSyncedBlocPlugin.getMasterWithId(masterId: masterId) == nil {
                result(FlutterError(code: "master_not_found", message: "Master not found", details: nil))
                return
            }
            let syncSubscriber = SyncSubscriber(binaryMessenger: binaryMessenger, masterId: masterId, subscriberId: subscriberId)
            SwiftSyncedBlocPlugin.subscribers.append(syncSubscriber)
            result(nil)
            break
        case "unregisterSubscriber":
            let masterId = arguments["masterId"] as! String
            let subscriberId = arguments["subscriberId"] as! String
            SwiftSyncedBlocPlugin.subscribers.removeAll { $0.masterId == masterId && $0.subscriberId == subscriberId }
            result(nil)
            break
        case "notifyChange":
            let masterId = arguments["masterId"] as! String
            let subscribers = SwiftSyncedBlocPlugin.getSubscribersOfMaster(masterId: masterId)
            subscribers.forEach { $0.notifyMasterChange() }
            NativeSyncSubscriber.onMasterChange(masterId: masterId)
            result(nil)
            break
        case "getState":
            let masterId = arguments["masterId"] as! String
            guard let master = SwiftSyncedBlocPlugin.getMasterWithId(masterId: masterId) else {
                result(FlutterError(code: "master_not_found", message: "Master not found", details: nil))
                return
            }
            master.getState(onSuccess: { res in
                result(res)
            }, onError: {
                result(FlutterError(code: "get_state_error", message: "Error getting state", details: nil))
            })
            break
        case "addEvent":
            let masterId = arguments["masterId"] as! String
            let event = arguments["event"] as! String
            guard let master = SwiftSyncedBlocPlugin.getMasterWithId(masterId: masterId) else {
                result(FlutterError(code: "master_not_found", message: "Master not found", details: nil))
                return
            }
            master.addEvent(event: event)
            result(nil)
            break
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
