//
//  AppDelegate.m
//  OCAppDelegate
//
//  Created by xmly on 2022/6/10.
//

#import "AppDelegate.h"
#import "ViewController.h"

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
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
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

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"%s",__func__);
}


@end
