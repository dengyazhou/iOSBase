//
//  AppDelegate.swift
//  SwiftAppDelegate
//
//  Created by yazhoudeng on 2022/11/17.
//

import UIKit

//import ThinkingSDK




let APP_ID = "af6861d085e14b5c948662e1fcdce6ef"
let SERVER_URL = "https://receiver-ta-demo.thinkingdata.cn"

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate,XGPushDelegate {

    var window: UIWindow?
    var trackAppid: String?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let str = OCTest.test("嘿嘿")
        print("\(str)")
        
        
//        XGPush.defaultManager().isEnableDebug = true
        
        XGPush.defaultManager().configureClusterDomainName("tpns.sh.tencent.com")
        XGPush.defaultManager().startXG(withAccessID:1680013952, accessKey:"ISECZWQC16RG", delegate:self)

        let tokenString = XGPushTokenManager.default().xgTokenString
        print("xg=====>>>xgTokenString:\(tokenString!)")

        // Override point for customization after application launch.
        
//        ThinkingAnalyticsSDK.setLogLevel(.debug)
//
//        trackAppid = APP_ID
//
//        let config: TDConfig = .init(appId: trackAppid ?? "", serverUrl: SERVER_URL)
//        let instance = ThinkingAnalyticsSDK.start(with: config)
//        instance.track("eventV2")

        // MARK: 注册通知
//        let center = UNUserNotificationCenter.current()
//        center.delegate = self
//        center.requestAuthorization(options: [UNAuthorizationOptions.alert, .sound, .badge]) { granted, error in
//            if error == nil {
//                print("====>>>>OCApp:没错")
//                DispatchQueue.main.async {
//                    application.registerForRemoteNotifications()
//                }
//            }
//        }
        
        
        

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("====>>>>OCApp: open url")
        let alertController = UIAlertController.init(title: "你被唤醒了", message: "你好", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel) { action in
            
        }
        alertController.addAction(action)
        app.windows.first?.rootViewController?.present(alertController, animated: true, completion: nil)
        
        return false
    }
    
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("====>>>>OCApp: didRegisterForRemoteNotificationsWithDeviceToken")
        let str = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("====>>>>OCApp:deviceToken:\(str)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("====>>>>OCApp: didFailToRegisterForRemoteNotificationsWithError")
        
    }
    
    // MARK: XGPushDelegate
    func xgPushDidReceiveRemoteNotification(_ notification: Any, withCompletionHandler completionHandler: ((UInt) -> Void)? = nil) {
        print("====>>>>OCApp: xgPushDidReceiveRemoteNotification")
        
        if notification as? UNNotification != nil {
            completionHandler!(UNNotificationPresentationOptions.alert.rawValue)
        }
    }
    
    func xgPushDidReceiveNotificationResponse(_ response: Any, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("====>>>>OCApp: xgPushDidReceiveNotificationResponse")
    }
    
    // MARK: UNUserNotificationCenterDelegate
    // App在前台时候回调：用户正在使用状态
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("====>>>>OCApp: willPresent")
        completionHandler([.alert, .sound, .badge])
    }
    
    // 推送消息回调
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("====>>>>OCApp: didReceive")
        if response.notification.request.trigger?.isKind(of: UNPushNotificationTrigger.classForCoder()) != nil {
            print("====>>>>OCApp: 远程推送消息处理")
        } else {
            print("====>>>>OCApp: 本地消息处理")
        }
        completionHandler()
    }
    

}


