package com.example.syncedblocaddtoandroidappexample.ui.theme

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import dev.masel.synced_bloc.NativeSyncSlave
import org.json.JSONObject

class ThemeViewModel : ViewModel(), NativeSyncSlave.ChangeListener {

    private val _text = MutableLiveData<String>().apply {
        value = ""
    }
    val text: LiveData<String> = _text

    private val _useDarkTheme = MutableLiveData<Boolean>().apply {
        value = false
    }
    val isDarkTheme: LiveData<Boolean> = _useDarkTheme

    private var themeBloc: NativeSyncSlave = NativeSyncSlave.withMasterId("ThemeBloc")

    init {
        themeBloc.addChangeListener(this)
    }

    override fun onCleared() {
        themeBloc.removeChangeListener(this)
    }

    override fun onSyncedBlocStateChange() {
        if (themeBloc.jsonState == null) return
        val jsonObj = JSONObject(themeBloc.jsonState!!)
        val isDark = jsonObj.getBoolean("isDark")
        _useDarkTheme.value = isDark
        _text.value = "Is using ${if (isDark) "dark" else "light"} theme"
    }

    fun toggleTheme() {
        themeBloc.addEvent("{}") //Json str of the event (in this case empty toggle event)
    }
}