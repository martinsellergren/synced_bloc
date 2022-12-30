package com.example.syncedblocaddtoandroidappexample

import android.app.Application
import android.util.Log
import io.flutter.FlutterInjector
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.android.RenderMode
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor

class App : Application() {
    override fun onCreate() {
        super.onCreate()
        val engineGroup = FlutterEngineGroup(this)
        FlutterModules.values().map { module -> module.dartEntryPoint }.forEach { entrypoint ->
            val engine = engineGroup.createAndRunEngine(
                applicationContext,
                DartExecutor.DartEntrypoint(
                    FlutterInjector.instance().flutterLoader().findAppBundlePath(),
                    entrypoint
                )
            )
            FlutterEngineCache.getInstance().put(entrypoint, engine)
        }
    }
}

enum class FlutterModules {
    DependencyMaintainer,
    HomePage,
    ThemePage,
    AccountPage;

    var dartEntryPoint: String = name.replaceFirstChar(Char::lowercase)

    fun createFragment(): FlutterFragment {
        if (this == DependencyMaintainer) throw Error()
        return FlutterFragment.withCachedEngine(dartEntryPoint).renderMode(RenderMode.texture)
            .build<FlutterFragment>()
    }
}