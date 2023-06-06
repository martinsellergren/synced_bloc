public class NativeSyncSlave {
    class ChangeListener {
        let onSyncedBlocStateChange: () -> Void

        init(onSyncedBlocStateChange: @escaping () -> Void) {
            self.onSyncedBlocStateChange = onSyncedBlocStateChange
        }
    }

    let masterId: String
    private static var nativeSyncSlaves: [NativeSyncSlave] = []
    private var changeListeners: [ChangeListener] = []
    private var jsonState: String? = nil
    private var syncMaster: SyncMaster? = nil

    private init(masterId: String) {
        self.masterId = masterId
    }

    static func withMasterId(masterId: String) -> NativeSyncSlave {
        if let existing = nativeSyncSlaves.first(where: { $0.masterId == masterId }) {
            existing.sync() // So always trigger change listeners
            return existing
        } else {
            let new = NativeSyncSlave(masterId: masterId)
            if let master = SwiftSyncedBlocPlugin.getMasterWithId(masterId: masterId) {
                new.setup(syncMaster: master)
            }
            nativeSyncSlaves.append(new)
            return new
        }
    }

    internal static func onRegisterMaster(master: SyncMaster) {
        if let slave = nativeSyncSlaves.first(where: { $0.masterId == master.masterId }) {
            slave.setup(syncMaster: master)
        }
    }

    internal static func onUnregisterMaster(masterId: String) {
        if let slave = nativeSyncSlaves.first(where: { $0.masterId == masterId }) {
            slave.syncMaster = nil
        }
    }

    internal static func onMasterChange(masterId: String) {
        if let slave = nativeSyncSlaves.first(where: { $0.masterId == masterId }) {
            slave.sync()
        }
    }

    func addChangeListener(listener: ChangeListener) {
        changeListeners.append(listener)
    }

    func removeChangeListener(listener: ChangeListener) {
        if let index = changeListeners.firstIndex(where: { $0 === listener }) {
            changeListeners.remove(at: index)
        }
    }

    private func setup(syncMaster: SyncMaster) {
        self.syncMaster = syncMaster
        sync()
    }

    private func sync() {
        syncMaster?.getState(
            onSuccess: { [weak self] res in
                self?.jsonState = res as? String
                self?.changeListeners.forEach { $0.onSyncedBlocStateChange() }
            },
            onError: {
                fatalError("Error")
            }
        )
    }

    func addEvent(event: String) {
        syncMaster?.addEvent(event: event)
    }
}
