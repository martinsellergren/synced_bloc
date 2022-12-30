package com.example.syncedblocaddtoandroidappexample.ui.theme

import android.graphics.Color
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import com.example.syncedblocaddtoandroidappexample.databinding.FragmentThemeBinding

class ThemeFragment : Fragment() {
    private var _binding: FragmentThemeBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        val themeViewModel =
            ViewModelProvider(this)[ThemeViewModel::class.java]
        _binding = FragmentThemeBinding.inflate(inflater, container, false)

        themeViewModel.text.observe(viewLifecycleOwner) {
            binding.textTheme.text = it
        }

        themeViewModel.isDarkTheme.observe(viewLifecycleOwner) {
            binding.root.setBackgroundColor(if (it) Color.BLACK else Color.WHITE)
            binding.textTheme.setTextColor(if (it) Color.WHITE else Color.BLACK)
        }

        binding.toggleButton.setOnClickListener {
            themeViewModel.toggleTheme()
        }

        return binding.root
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}