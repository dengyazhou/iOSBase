//
//  CTTNViewController.m
//  OCBase
//
//  Created by xmly on 2022/6/14.
//

#import "CTTNViewController.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>



@interface CTTNViewController ()

@end

@implementation CTTNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CTTelephonyNetworkInfo";
    self.view.backgroundColor = [UIColor whiteColor];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"CTTelephonyNetworkInfo touch 开始");
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
//    NSString *currentStatus = info.currentRadioAccessTechnology;
//    if (@available(iOS 12.0, *)){
//        NSDictionary *dic = info.serviceSubscriberCellularProviders;
//    }
    if (@available(iOS 12.0, *)){
        
    }
    
#ifdef __IPHONE_12_0
    NSDictionary *dic = info.serviceSubscriberCellularProviders;
#endif
    
    CTCarrier *carrier = info.subscriberCellularProvider;
    NSLog(@"===>>> carrierName:%@",carrier.carrierName);
    
    
//    NSLog(@"===>>>:%@",currentStatus);
    
    
    NSLog(@"CTTelephonyNetworkInfo touch 结束");
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
