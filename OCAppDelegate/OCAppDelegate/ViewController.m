//
//  ViewController.m
//  OCAppDelegate
//
//  Created by xmly on 2022/6/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSLog(@"====>>>>OCApp:%s",__func__);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch 开始");
    
#pragma mark 3、
#if __IPHONE_13_0
    NSLog(@"====>>>>:IPHONE 13_0");
#endif
    
#pragma mark 2、@available 多少到多少可用
    if (@available(iOS 12.0, *)){
        NSLog(@"====>>>>:iOS 12.0");
    }
    
#pragma mark 1、UIApplication状态通知
//    for (NSString *name in @[UIApplicationDidBecomeActiveNotification,
//                             UIApplicationDidEnterBackgroundNotification,
//                             UIApplicationDidFinishLaunchingNotification,
//                             UIApplicationWillResignActiveNotification,
//                             UIApplicationWillEnterForegroundNotification]) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleAppStateDidChange:) name:name object:nil];
//    }
    NSLog(@"touch 结束");
}

- (void)handleAppStateDidChange:(NSNotification *)notification {
    NSLog(@"====>>>>:%@",notification.name);
    UIApplicationState state = [UIApplication sharedApplication].applicationState;
    if (state == UIApplicationStateActive) {
        NSLog(@"====>>>>>>>:UIApplicationStateActive");
    } else if (state == UIApplicationStateInactive) {
        NSLog(@"====>>>>>>>:UIApplicationStateInactive");
    } else if (state == UIApplicationStateBackground) {
        NSLog(@"====>>>>>>>:UIApplicationStateBackground");
    }
}

@end
