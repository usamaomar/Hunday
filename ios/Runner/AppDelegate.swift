import UIKit

import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  var _result : FlutterResult!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let paymentChannel = FlutterMethodChannel(name:"com.comc.hyundai/paymentMethod", binaryMessenger: controller.binaryMessenger)
      
      paymentChannel.setMethodCallHandler({
          (call: FlutterMethodCall,result : @escaping FlutterResult) -> Void in
          self._result = result
          guard let method = call.method else {
          result(FlutterMethodNotImplemented)
          return
          }
          
          switch method {
              case "getPaymentMetod":
                  self.recivePayment(result: result, call: call)
              case "getPaymentLive":
                  self.recivePaymentLive(result: result, call: call)
              default:
                  result(FlutterMethodNotImplemented)
              }
          
      })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }


    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool{
        self.window?.rootViewController?.dismiss(animated: true)
        self._result(url.absoluteString)
        return true
    }
    
    
    
    private func recivePayment(result: @escaping FlutterResult,  call: FlutterMethodCall){
        let provider = OPPPaymentProvider (mode: OPPProviderMode.test)
        let checkoutSettings = OPPCheckoutSettings()
        checkoutSettings.paymentBrands = ["VISA","MASTER"]
        checkoutSettings.shopperResultURL = "com.comc.hyundai.payments://result"
        let args = call.arguments as? Dictionary<String, Any>
        let checkoutId = (args?["checkoutId"] as? String)!
        
        let checkoutProvider = OPPCheckoutProvider(paymentProvider: provider, checkoutID: checkoutId, settings: checkoutSettings)
        checkoutProvider?.presentCheckout(forSubmittingTransactionCompletionHandler: { (transaction, error) in
            guard let transaction = transaction else{
             result(FlutterError(code: "UNAVALIBLE ELSE", message: "PAYMENT UN AVALIBLE", details: nil))
                return
            }
            if transaction.type == .synchronous {
                result(transaction.resourcePath)
            } else if transaction.type == .asynchronous {
                result(transaction.redirectURL?.absoluteString)
            }else{
                result(FlutterError(code: "Unavalibel Else", message: error.debugDescription, details: nil))
            }
        }, cancelHandler: {
            result(FlutterError(code: "Error", message: "exxced", details: nil))
        })
        
    }
    
    private func recivePaymentLive(result: @escaping FlutterResult,  call: FlutterMethodCall){
        let provider = OPPPaymentProvider (mode: OPPProviderMode.live)
        let checkoutSettings = OPPCheckoutSettings()
        checkoutSettings.paymentBrands = ["VISA","MASTER"]
        checkoutSettings.shopperResultURL = "com.comc.hyundai.payments://result"
        let args = call.arguments as? Dictionary<String, Any>
        let checkoutId = (args?["checkoutId"] as? String)!
        
        let checkoutProvider = OPPCheckoutProvider(paymentProvider: provider, checkoutID: checkoutId, settings: checkoutSettings)
        checkoutProvider?.presentCheckout(forSubmittingTransactionCompletionHandler: { (transaction, error) in
            guard let transaction = transaction else{
             result(FlutterError(code: "UNAVALIBLE ELSE", message: "PAYMENT UN AVALIBLE", details: nil))
                return
            }
            if transaction.type == .synchronous {
                result(transaction.resourcePath)
            } else if transaction.type == .asynchronous {
                result(transaction.redirectURL?.absoluteString)
            }else{
                result(FlutterError(code: "Unavalibel Else", message: error.debugDescription, details: nil))
            }
        }, cancelHandler: {
            result(FlutterError(code: "Error", message: "exxced", details: nil))
        })
        
    }
}


