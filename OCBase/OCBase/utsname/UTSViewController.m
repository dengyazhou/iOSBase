//
//  UTSViewController.m
//  OCBase
//
//  Created by xmly on 2022/6/16.
//

#import "UTSViewController.h"
#import <sys/utsname.h>

@interface UTSViewController ()

@end

@implementation UTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"utsname";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"====>>>:touchesBegan 开始");
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *sysname = [NSString stringWithCString:systemInfo.sysname encoding:NSASCIIStringEncoding];
    NSLog(@"===>>> sysname:%@",sysname);
    
    NSString *nodename = [NSString stringWithCString:systemInfo.nodename encoding:NSASCIIStringEncoding];
    NSLog(@"===>>> nodename:%@",nodename);
    
    NSString *release = [NSString stringWithCString:systemInfo.release encoding:NSASCIIStringEncoding];
    NSLog(@"===>>> release:%@",release);
    
    NSString *version = [NSString stringWithCString:systemInfo.version encoding:NSASCIIStringEncoding];
    NSLog(@"===>>> version:%@",version);
    
    NSString *machine = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    NSLog(@"===>>> machine:%@",machine);// iPhone10,3
    
    NSLog(@"====>>>:touchesBegan 结束");
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
