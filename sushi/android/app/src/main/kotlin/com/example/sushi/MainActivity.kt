package com.example.sushi

import android.content.res.Configuration
import android.os.Bundle
import android.view.View
import androidx.core.view.ViewCompat
import androidx.core.view.WindowCompat
import androidx.core.view.WindowInsetsCompat
import io.flutter.embedding.android.FlutterActivity
import java.util.Locale

class MainActivity : FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    // Prefer English labels on Google Maps tiles.
    val config = Configuration(resources.configuration)
    config.setLocale(Locale.ENGLISH)
    @Suppress("DEPRECATION")
    resources.updateConfiguration(config, resources.displayMetrics)

    // Keep content above the system navigation bar on Android 15+/API 36
    super.onCreate(null)
    WindowCompat.setDecorFitsSystemWindows(window, false)
    val rootView = findViewById<View>(android.R.id.content)
    ViewCompat.setOnApplyWindowInsetsListener(rootView) { view, insets ->
      val navigationBars = insets.getInsets(WindowInsetsCompat.Type.navigationBars())
      view.setPadding(0, 0, 0, navigationBars.bottom)
      insets
    }
    ViewCompat.requestApplyInsets(rootView)
  }
}
