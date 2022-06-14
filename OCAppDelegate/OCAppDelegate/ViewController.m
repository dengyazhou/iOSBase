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

    NSLog(@"%s",__func__);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touch 开始");
    for (NSString *name in @[UIApplicationDidBecomeActiveNotification,
                             UIApplicationDidEnterBackgroundNotification,
                             UIApplicationDidFinishLaunchingNotification,
                             UIApplicationWillResignActiveNotification,
                             UIApplicationWillEnterForegroundNotification]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleAppStateDidChange:) name:name object:nil];
    }
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
