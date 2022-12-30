package dev.masel.synced_bloc_example

import android.util.Log
import dev.masel.synced_bloc.NativeSyncSlave
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity(), NativeSyncSlave.ChangeListener {
    private lateinit var authRepo: NativeSyncSlave


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        authRepo = NativeSyncSlave.withMasterId("AuthBloc")
        authRepo.addChangeListener(this)
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        authRepo.removeChangeListener(this)
        super.cleanUpFlutterEngine(flutterEngine)
    }

    override fun onResume() {
        super.onResume()
        NativeSyncSlave.withMasterId("AuthBloc")
            .addEvent("""{"username":"masel","runtimeType":"logIn"}""")
    }

    override fun onSyncedBlocStateChange() {
        Log.wtf("<ME>", "AuthBloc change: ${authRepo.state}")
    }
}
