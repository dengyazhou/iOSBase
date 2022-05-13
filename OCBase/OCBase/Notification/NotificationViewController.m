//
//  NotificationViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/4.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通知";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //添加通知接收者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCome:) name:@"XMLiveNotification" object:@"LiBai"];
}

- (void)notificationCome:(NSNotification *)noti {
    NSLog(@"%@",noti);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"XMLiveNotification" object:@"LiBai" userInfo:@{@"name":@"yazhoudeng"}];
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
