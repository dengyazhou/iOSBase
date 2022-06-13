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
            
        }];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
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
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler API_AVAILABLE(macos(10.14), ios(10.0), watchos(3.0)) API_UNAVAILABLE(tvos) {
    NSLog(@"%s",__func__);
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        // 远程推送消息处理
    } else {
        // 本地消息处理
    }
    completionHandler();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification API_AVAILABLE(macos(10.14), ios(12.0)) API_UNAVAILABLE(watchos, tvos) {
    NSLog(@"%s",__func__);
}

@end
