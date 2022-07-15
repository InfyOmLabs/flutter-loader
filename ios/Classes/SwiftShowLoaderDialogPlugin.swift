import Flutter
import UIKit

public class SwiftShowLoaderDialogPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "infyom.com/flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftShowLoaderDialogPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if(call.method == "showLoader") {

         guard let args = call.arguments else {
            return
         }

         let myArgs = args as? [String: Any]
         let isDialogShow = myArgs?["loaderShow"] as? Bool
         let alert = UIAlertController(title: nil, message: "Please Wait...", preferredStyle: .alert);

         let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x:10, y:5, width:50, height:50))
         loadingIndicator.style = UIActivityIndicatorView.Style.gray
         loadingIndicator.startAnimating();
         alert.view.addSubview(loadingIndicator)

         if(isDialogShow == true) {
              UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
         }
         else{
              UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil);
         }
      }
    }
}
