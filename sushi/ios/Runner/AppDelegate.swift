import Flutter
import UIKit
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Keep Google Maps place labels in English (independent of Flutter UI language).
    UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
    // Same key used on Android / web — required before any GoogleMap widget opens.
    GMSServices.provideAPIKey("AIzaSyBvc7de2dYkdFnQkjJ2_pmC4kxIcMVkiH4")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}
