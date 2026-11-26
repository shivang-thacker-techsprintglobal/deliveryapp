package com.example.sushi

import android.content.res.Configuration
import android.os.Bundle
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import java.util.Locale

class MainActivity : FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    // Prefer English labels on Google Maps tiles.
    val config = Configuration(resources.configuration)
    config.setLocale(Locale.ENGLISH)
    @Suppress("DEPRECATION")
    resources.updateConfiguration(config, resources.displayMetrics)

    super.onCreate(savedInstanceState)
    applySystemBarInsets()
  }

  override fun onPostResume() {
    super.onPostResume()
    // Flutter may re-enable edge-to-edge after resume — keep content above nav bar.
    applySystemBarInsets()
  }

  private fun applySystemBarInsets() {
    WindowCompat.setDecorFitsSystemWindows(window, true)
  }
}
