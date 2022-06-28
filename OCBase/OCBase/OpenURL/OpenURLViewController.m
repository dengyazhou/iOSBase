//
//  OpenURLViewController.m
//  OCBase
//
//  Created by yazhoudeng on 2022/6/28.
//

#import "OpenURLViewController.h"

@interface OpenURLViewController ()

@end

@implementation OpenURLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"打开其他应用";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    
    //打开其他应用
    //1、在info中添加白名单，LSApplicationQueriesSchemes，TATestiOS123
    //2、代码打开 [[UIApplication sharedApplication] openURL:url options:@{@"name":@"dengyazhou"} completionHandler:nil];
    
    
//    sleep(8);
    
    // OCSceneDelegate123
    NSString *urlStr = @"OCSceneDelegate123://index?a=11&b=21";//@"OCAppDelegate://";//@"TATestiOS123://";//@"weixin://"
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if (@available(iOS 10.0, *)) {//iOS 10之后
            [[UIApplication sharedApplication] openURL:url options:@{@"name":@"dengyazhou"} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    } else {
        NSLog(@"尚未安装该应用");
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
