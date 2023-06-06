import Flutter
import UIKit

public class SwiftSyncedBlocPlugin: NSObject, FlutterPlugin {
    static var masters: [SyncMaster] = []
    static var slaves: [SyncSlave] = []
    
    static func getSlavesOfMaster(masterId: String) -> [SyncSlave] {
        return slaves.filter { $0.masterId == masterId }
    }
    
    static func getMasterWithId(masterId: String) -> SyncMaster? {
        return masters.first { $0.masterId == masterId }
    }
    
    static func getSlaveWithId(masterId: String, slaveId: String) -> SyncSlave? {
        return slaves.first { $0.masterId == masterId && $0.slaveId == slaveId }
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
            NativeSyncSlave.onRegisterMaster(master: syncMaster)
            result(nil)
            break
        case "unregisterMaster":
            let masterId = arguments["masterId"] as! String
            let slaves = SwiftSyncedBlocPlugin.getSlavesOfMaster(masterId: masterId)
            slaves.forEach { SwiftSyncedBlocPlugin.slaves.remove(at: SwiftSyncedBlocPlugin.slaves.firstIndex(of: $0)!) }
            SwiftSyncedBlocPlugin.masters.removeAll { $0.masterId == masterId }
            NativeSyncSlave.onUnregisterMaster(masterId: masterId)
            result(nil)
            break
        case "registerSlave":
            let masterId = arguments["masterId"] as! String
            let slaveId = arguments["slaveId"] as! String
            if SwiftSyncedBlocPlugin.getMasterWithId(masterId: masterId) == nil {
                result(FlutterError(code: "master_not_found", message: "Master not found", details: nil))
                return
            }
            let syncSlave = SyncSlave(binaryMessenger: binaryMessenger, masterId: masterId, slaveId: slaveId)
            SwiftSyncedBlocPlugin.slaves.append(syncSlave)
            result(nil)
            break
        case "unregisterSlave":
            let masterId = arguments["masterId"] as! String
            let slaveId = arguments["slaveId"] as! String
            SwiftSyncedBlocPlugin.slaves.removeAll { $0.masterId == masterId && $0.slaveId == slaveId }
            result(nil)
            break
        case "notifyChange":
            let masterId = arguments["masterId"] as! String
            let slaves = SwiftSyncedBlocPlugin.getSlavesOfMaster(masterId: masterId)
            slaves.forEach { $0.notifyMasterChange() }
            NativeSyncSlave.onMasterChange(masterId: masterId)
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
