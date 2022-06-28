//
//  AppDelegate.m
//  OCAppDelegate
//
//  Created by xmly on 2022/6/10.
//

#import "AppDelegate.h"
#import "ViewController.h"

#import <ThinkingSDK/ThinkingSDK.h>

static NSString *APP_ID = @"af6861d085e14b5c948662e1fcdce6ef";
static NSString *SERVER_URL = @"https://receiver-ta-demo.thinkingdata.cn";

@interface AppDelegate ()

@end

@implementation AppDelegate

// 删除SceneDelegate
// 1、Info.plist文件中Application Scene Manifest删除
// 2、SceneDelegate文件删除
// 3、AppDelegate文件中函数application(_:configurationForConnecting:options:)和application(_:didDiscardSceneSessions:)删除
// 已上三步都执行完毕项目 才可以正常运行。如果只执行第1步，ViewController加载不出来
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%s",__func__);
    [ThinkingAnalyticsSDK setLogLevel:TDLoggingLevelDebug];
    
    ThinkingAnalyticsSDK *instance = [ThinkingAnalyticsSDK startWithAppId:APP_ID withUrl:SERVER_URL];
    [instance enableAutoTrack:ThinkingAnalyticsEventTypeAll];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"%s",__func__);
    if (url) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你被唤醒了" message:@"你好" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];
        [alertController addAction:action];
        [app.windows.firstObject.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    return YES;
}


@end
