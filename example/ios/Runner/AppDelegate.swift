import UIKit
import Flutter
import smile_identity_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController;
        
      let smileIdentityPlugin = SwiftSmilePlugin(binaryMessenger: controller.binaryMessenger);
      smileIdentityPlugin.init()
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
