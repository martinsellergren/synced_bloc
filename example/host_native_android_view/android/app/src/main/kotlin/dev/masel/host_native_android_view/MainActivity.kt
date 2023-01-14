package dev.masel.host_native_android_view

import android.content.Context
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(
                "native-compass",
                object : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
                    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
                        val creationParams = args as Map<String?, Any?>?
                        return NativeCompass(context, viewId, creationParams)
                    }
                })
    }
}
