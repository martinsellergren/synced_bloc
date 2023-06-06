package dev.masel.host_native_android_view

import com.beust.klaxon.Klaxon
import dev.masel.synced_bloc.NativeSyncSubscriber

private val klaxon = Klaxon()

class CompassBloc {
    val syncSubscriber = NativeSyncSubscriber.withMasterId("compass")
    val state: CompassState?
        get() = if (syncSubscriber.jsonState == null) null else CompassState.fromJson(syncSubscriber.jsonState!!)

    fun setDegrees(degrees: Double) {
        syncSubscriber.addEvent(CompassEventSetDegrees(degrees).toJson())
    }
}

data class CompassState (
    val degrees: Double,
    val fps: Long,
    val showMarker: Boolean
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<CompassState>(json)
    }
}

data class CompassEventSetDegrees (
    val degrees: Double,
    val runtimeType: String = "setCompassDegrees"
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<CompassEventSetDegrees>(json)
    }
}
