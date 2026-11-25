package com.example.sushi

import android.content.res.Configuration
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import java.util.Locale

class MainActivity : FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    // Prefer English labels on Google Maps tiles.
    val config = Configuration(resources.configuration)
    config.setLocale(Locale.ENGLISH)
    resources.updateConfiguration(config, resources.displayMetrics)
    super.onCreate(savedInstanceState)
  }
}
