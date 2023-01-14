package dev.masel.host_native_android_view

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import com.redinput.compassview.CompassView
import dev.masel.host_native_android_view.databinding.CompassViewBinding
import dev.masel.synced_bloc.NativeSyncSlave
import io.flutter.plugin.platform.PlatformView

internal class NativeCompass(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
    PlatformView, Compass.CompassListener, NativeSyncSlave.ChangeListener {
    private val compassView: CompassView
    private val compass: Compass
    private val compassBloc: CompassBloc

    override fun getView(): View {
        return compassView
    }

    init {
        val binding =
            CompassViewBinding.inflate(context.getSystemService(Context.LAYOUT_INFLATER_SERVICE) as LayoutInflater)
        compassView = binding.compass
        compass = Compass(context)
        compass.setListener(this)
        compass.start()

        compassBloc = CompassBloc()
        compassBloc.syncSlave.addChangeListener(this)
    }

    override fun dispose() {
        compass.setListener(null)
        compass.stop()
        compassBloc.syncSlave.removeChangeListener(this)
    }

    var lastUpdateTime = System.currentTimeMillis()

    override fun onNewAlpha(alpha: Float) {
        if (compassBloc.state == null) return
        val t = System.currentTimeMillis()
        if (t - lastUpdateTime > 1000 / compassBloc.state!!.fps) {
            compassBloc.setDegrees(alpha.toDouble())
            lastUpdateTime = t
        }
    }

    override fun onSyncedBlocStateChange() {
        if (compassBloc.state == null) return
        compassView.degrees = compassBloc.state!!.degrees.toFloat()
        compassView.setShowMarker(compassBloc.state!!.showMarker)
    }
}