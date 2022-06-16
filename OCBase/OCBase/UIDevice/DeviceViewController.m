//
//  DeviceViewController.m
//  OCBase
//
//  Created by xmly on 2022/6/16.
//

#import "DeviceViewController.h"

@interface DeviceViewController ()

@end

@implementation DeviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIDevice";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"===>>> name:%@",[device name]);
    NSLog(@"===>>> model:%@",[device model]);
    NSLog(@"===>>> localizedModel:%@",[device localizedModel]);
    NSLog(@"===>>> systemName:%@",[device systemName]);
    NSLog(@"===>>> systemVersion:%@",[device systemVersion]);
    [device orientation];//UIDeviceOrientation
    NSLog(@"===>>> identifierForVendor:%@",[device identifierForVendor]);
    
//    @property(nonatomic,readonly,getter=isGeneratingDeviceOrientationNotifications) BOOL generatesDeviceOrientationNotifications API_UNAVAILABLE(tvos);
//    - (void)beginGeneratingDeviceOrientationNotifications API_UNAVAILABLE(tvos);      // nestable
//    - (void)endGeneratingDeviceOrientationNotifications API_UNAVAILABLE(tvos);
//
//    @property(nonatomic,getter=isBatteryMonitoringEnabled) BOOL batteryMonitoringEnabled API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(tvos);  // default is NO

    [device batteryState]; //UIDeviceBatteryState
    NSLog(@"===>>> batteryLevel:%f",[device batteryLevel]);
    
//    @property(nonatomic,getter=isProximityMonitoringEnabled) BOOL proximityMonitoringEnabled API_AVAILABLE(ios(3.0)); // default is NO
//    @property(nonatomic,readonly)                            BOOL proximityState API_AVAILABLE(ios(3.0));  // always returns NO if no proximity detector
//
//    @property(nonatomic,readonly,getter=isMultitaskingSupported) BOOL multitaskingSupported API_AVAILABLE(ios(4.0));
    
    [device userInterfaceIdiom]; //UIUserInterfaceIdiom
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
