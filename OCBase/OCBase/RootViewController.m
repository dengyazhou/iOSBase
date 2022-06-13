//
//  RootViewController.m
//  OCBase
//
//  Created by xmly on 2021/12/3.
//

#import "RootViewController.h"
#import "ViewController.h"

#import <Usernotifications/UserNotifications.h>

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第一页";
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:true];
    
//    NSLog(@"RootViewController touchesBegan 开始");
//
//    [self checkNotificationAuth:^(BOOL granted) {
//        if (granted) {
//            [self sendLocalNotifiaction];
//        }
//    }];
//
//    NSLog(@"RootViewController touchesBegan 结束");
}

#pragma mark 检查通知权限
- (void)checkNotificationAuth:(void(^)(BOOL granted))block {
    if (@available(iOS 10.0, *)) {
        [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
            if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
                block(YES);
            } else {
                block(NO);
            }
        }];
    } else {
        if ([[UIApplication sharedApplication] currentUserNotificationSettings].types == UIUserNotificationTypeNone) {
            block(NO);
        } else {
            block(YES);
        }
    }
}

#pragma mark 发送本地通知
- (void)sendLocalNotifiaction {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"title_1";
        content.body = @"body_2";
        content.badge = @3;
        content.userInfo = @{@"age":@4};
        NSTimeInterval timeInterval = [[NSDate dateWithTimeIntervalSinceNow:1] timeIntervalSinceNow];
//        NSTimeInterval timeInterval = [[NSDate dateWithTimeIntervalSinceNow:1] timeIntervalSince1970];
        NSLog(@"=====>>>:%d",timeInterval);
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:timeInterval repeats:NO];
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"noticeIdentifier123" content:content trigger:trigger];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (error) {
                NSLog(@"=====>>>:error");
            }
        }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
