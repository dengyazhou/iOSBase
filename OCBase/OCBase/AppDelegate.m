//
//  AppDelegate.m
//  OCBase
//
//  Created by xmly on 2021/7/1.
//

#import "AppDelegate.h"

#pragma mark 引入头文件
// https://www.jianshu.com/p/4c0c38d67521
#import <Usernotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSLog(@"=====>>>>width:%@",@(size.width));
    
    NSLog(@"%s",__func__);
    // WatchDog iOS看门狗
//    sleep(25);
//    NSLog(@"%s",__func__);
    
#pragma mark 注册通知
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
            if (!granted) {
                NSLog(@"======>>>>:!granted");
            } else {
                NSLog(@"======>>>>:granted");
            }
            
            if (nil == error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [application registerForRemoteNotifications];
                });
            }
        }];
        
    }
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    NSLog(@"%s",__func__);
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    NSLog(@"%s",__func__);
}


#pragma mark - UNUserNotificationCenterDelegate
// App在前台时候回调：用户正在使用状态
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler API_AVAILABLE(macos(10.14), ios(10.0), watchos(3.0), tvos(10.0)) {
    NSLog(@"%s",__func__);
    completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionAlert);
}

// 推送消息回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    NSLog(@"%s",__func__);
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        // 远程推送消息处理
    } else {
        // 本地消息处理
    }
    completionHandler();
}

//- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification API_AVAILABLE(macos(10.14), ios(12.0)) API_UNAVAILABLE(watchos, tvos) {
//    NSLog(@"%s",__func__);
//}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *token;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13.0) {
        const unsigned *tokenBytes = [deviceToken bytes];
        token = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                 ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                 ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                 ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
    }else{
        token = [[deviceToken description] stringByReplacingOccurrencesOfString:@"<" withString:@""];
        token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
        token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    
    NSLog(@"deviceToken == %@",token);

//    NSArray *params = @[@{@"key" : @"SomeAdditionalID", @"value" : @4711},
//                            @{@"key" : @"OtherID", @"value" : @"randomValue"}];
//
//    DTPushNotification *tpns = [DTPushNotification sharedInstance];
//    if(tpns.isRegistered) {
//        //Already registered no need to register again
//        return;
//    }
//
//    [tpns registerWithURL:[NSURL URLWithString:@"TPNS Endpoint"] //The different endpoints are defined in the TPNS_iOS.h file
//                   appKey:@"APPKEY"
//                pushToken:token
//     additionalParameters:params
//                  sandbox:YES
//               completion:^(NSString * _Nullable deviceID, NSError * _Nullable error) {
//                       if (error) {
//                           //handle error
//                           return;
//                       }
//                       //save the deviceID
//                   }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"%s",__FUNCTION__);
}

@end
