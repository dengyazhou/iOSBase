//
//  UUIDViewController.m
//  OCBase
//
//  Created by xmly on 2022/5/28.
//

#import "UUIDViewController.h"

@interface UUIDViewController ()

@end

@implementation UUIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"identifierForVendor & UUID";
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"UUID touchesBegan 开始");
    //例如对于xmly.OCBase,xmly.OCBase1这两个BundleID来说，就属于同一个Vender，共享同一个idfv的值。
    //例如对于xmly.OCBase,xmly1.OCBase这两个BundleID来说，就属于不同一个Vender，所以idfv的值不一样。
    //和厂商有关，如果用户将属于此Vender的所有App卸载，则idfv的值会被重置，即再重装此Vender的App，idfv的值和之前不同。
    //idfv变化的条件是，所有Vender下的App全部卸载，然后重装此Vender的App。
    NSString *idfv = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSLog(@"idfv:%@",idfv);//0D470B6A-54D7-45B8-BBF6-21BE8421D6B8
    NSLog(@"uuid:%@",uuid);//每时每刻都不一样
    
    NSLog(@"UUID touchesBegan 结束");
    
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
