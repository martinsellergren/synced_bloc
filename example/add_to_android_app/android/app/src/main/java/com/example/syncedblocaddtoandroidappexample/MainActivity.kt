package com.example.syncedblocaddtoandroidappexample

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.viewpager2.adapter.FragmentStateAdapter
import androidx.viewpager2.widget.ViewPager2
import androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
import com.example.syncedblocaddtoandroidappexample.databinding.ActivityMainBinding
import com.example.syncedblocaddtoandroidappexample.ui.account.AccountFragment
import com.example.syncedblocaddtoandroidappexample.ui.theme.ThemeFragment
import com.google.android.material.navigation.NavigationBarView
import io.flutter.embedding.android.FlutterFragment

class MainActivity : AppCompatActivity(), NavigationBarView.OnItemSelectedListener {

    private lateinit var binding: ActivityMainBinding
    private var flutterFragment: FlutterFragment? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.myToolbar)

        binding.navView.setOnItemSelectedListener(this)
        binding.viewPager.registerOnPageChangeCallback(onPageChangeCallback)

        binding.viewPager.offscreenPageLimit = 2
        binding.viewPager.adapter = pagerAdapter
    }

    private val onPageChangeCallback = object : OnPageChangeCallback() {
        override fun onPageSelected(position: Int) {
            R.menu.bottom_nav_menu
            supportActionBar?.title = when (menuPosToId(position)) {
                R.id.navigation_home -> "Home"
                R.id.navigation_account -> "Account"
                R.id.navigation_theme -> "Theme"
                else -> throw Error()
            }
            binding.navView.menu.findItem(menuPosToId(position)).isChecked = true
        }
    }

    override fun onNavigationItemSelected(item: MenuItem): Boolean {
        binding.viewPager.currentItem =
            mutableListOf(0, 1, 2).map { menuPosToId(it) }.indexOf(item.itemId)
        return true
    }

    private val pagerAdapter = object : FragmentStateAdapter(this) {
        override fun getItemCount(): Int = 3
        override fun createFragment(position: Int): Fragment {
            return when (menuPosToId(position)) {
                R.id.navigation_home -> FlutterModules.HomePage.createFragment() // Replaced HomeFragment() with flutter module
                R.id.navigation_account -> FlutterModules.AccountPage.createFragment() // Replaced AccountFragment()
                R.id.navigation_theme -> ThemeFragment() // Not yet migrated
                else -> throw Error()
            }
        }
    }

    fun menuPosToId(pos: Int): Int {
        return when (pos) {
            0 -> R.id.navigation_home
            1 -> R.id.navigation_account
            2 -> R.id.navigation_theme
            else -> throw Error()
        }
    }

    // region Forward OS signals
    // (https://docs.flutter.dev/development/add-to-app/android/add-flutter-fragment?tab=add-fragment-kotlin-tab#add-a-flutterfragment-to-an-activity-with-a-new-flutterengine)

    override fun onPostResume() {
        super.onPostResume()
        flutterFragment?.onPostResume()
    }

    @SuppressLint("MissingSuperCall")
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        flutterFragment?.onNewIntent(intent)
    }

    override fun onBackPressed() {
        flutterFragment?.onBackPressed()
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String?>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        flutterFragment?.onRequestPermissionsResult(
            requestCode,
            permissions,
            grantResults
        )
    }

    override fun onUserLeaveHint() {
        flutterFragment?.onUserLeaveHint()
    }

    @SuppressLint("MissingSuperCall")
    override fun onTrimMemory(level: Int) {
        super.onTrimMemory(level)
        flutterFragment?.onTrimMemory(level)
    }

    // endregion
}