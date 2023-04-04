//
//  EnumerationViewController.m
//  OCBase
//
//  Created by yazhoudeng on 2023/4/4.
//

#import "EnumerationViewController.h"

typedef NS_OPTIONS(NSUInteger, YLOptions) {
    YLOptionsNULL          =  0,
    YLOptionsTop           =  1 << 0,   // 0000 0001
    YLOptionsBottom        =  1 << 1,   // 0000 0010
    YLOptionsLeft          =  1 << 2,   // 0000 0100
    YLOptionsRight         =  1 << 3,   // 0000 1000
    YLOptionsALL           =  0xFF,
};

@interface EnumerationViewController ()

@end

@implementation EnumerationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Enumeration";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self optionsDemo:YLOptionsTop|YLOptionsRight];
//    [self optionsDemo:YLOptionsNULL];
}

- (void)optionsDemo:(YLOptions)type{
    if (type & YLOptionsTop) {
        NSLog(@"上  %ld",type & YLOptionsTop);
    }
    if (type & YLOptionsBottom) {
        NSLog(@"下  %ld",type & YLOptionsBottom);
    }
    if (type & YLOptionsLeft) {
        NSLog(@"左  %ld",type & YLOptionsLeft);
    }
    if (type & YLOptionsRight) {
        NSLog(@"右  %ld",type & YLOptionsRight);
    }
    if (type & YLOptionsNULL) {
        NSLog(@"NULL  %ld",type & YLOptionsNULL);
    }
    if (type & YLOptionsALL) {
        NSLog(@"ALL  %ld",type & YLOptionsALL);
    }
    NSLog(@"%s 结束",__func__);
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
