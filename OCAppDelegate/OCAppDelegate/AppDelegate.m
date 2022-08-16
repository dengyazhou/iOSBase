//
//  AppDelegate.m
//  OCAppDelegate
//
//  Created by xmly on 2022/6/10.
//

#import "AppDelegate.h"
#import "ViewController.h"

// https://www.jianshu.com/p/4c0c38d67521
#import <Usernotifications/UserNotifications.h> //引入头文件

#import <ThinkingSDK/ThinkingSDK.h>

static NSString *APP_ID = @"af6861d085e14b5c948662e1fcdce6ef";
static NSString *SERVER_URL = @"https://receiver-ta-demo.thinkingdata.cn";

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@property (nonatomic, strong) ThinkingAnalyticsSDK *instance;

@end

@implementation AppDelegate

// 删除SceneDelegate
// 1、Info.plist文件中Application Scene Manifest删除
// 2、SceneDelegate文件删除
// 3、AppDelegate文件中函数application(_:configurationForConnecting:options:)和application(_:didDiscardSceneSessions:)删除
// 已上三步都执行完毕项目 才可以正常运行。如果只执行第1步，ViewController加载不出来
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];

    
    [notificationCenter addObserver:self
                           selector:@selector(applicationDidEnterBackground123:)
                               name:UIApplicationDidEnterBackgroundNotification
                             object:nil];


    [ThinkingAnalyticsSDK setLogLevel:TDLoggingLevelDebug];
//    
    _instance = [ThinkingAnalyticsSDK startWithAppId:APP_ID withUrl:SERVER_URL];
    [_instance enableAutoTrack:ThinkingAnalyticsEventTypeAll];
    
    
#pragma mark 注册通知
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (nil == error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [application registerForRemoteNotifications];
                });
            }
        }];
    }
    
    
    
    return YES;
}

- (void)applicationDidEnterBackground123:(NSNotification *)notification {
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.001*NSEC_PER_SEC), dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"=========>>>>>>>>>>>>>>> ");
//        [self->_instance track:@"event2222"];
//    });
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
//    [_instance track:@"event1111"];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"====>>>>OCApp:%s",__func__);
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"====>>>>OCApp:%s",__func__);
    if (url) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你被唤醒了" message:@"你好" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];
        [alertController addAction:action];
        [app.windows.firstObject.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"====>>>>OCApp:%s",__FUNCTION__);
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
    
    NSLog(@"====>>>>OCApp: deviceToken == %@",token);
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"====>>>>OCApp:%s",__FUNCTION__);
}

#pragma mark - UNUserNotificationCenterDelegate
// App在前台时候回调：用户正在使用状态
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler API_AVAILABLE(macos(10.14), ios(10.0), watchos(3.0), tvos(10.0)) {
    NSLog(@"====>>>>OCApp:%s",__func__);
    completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionAlert);
}

// 推送消息回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    NSLog(@"====>>>>OCApp:%s",__FUNCTION__);
    if ([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        // 远程推送消息处理
        NSLog(@"====>>>>OCApp: 远程推送消息处理");
    } else {
        // 本地消息处理
        NSLog(@"====>>>>OCApp: 本地消息处理");
    }
    completionHandler();
}

@end
