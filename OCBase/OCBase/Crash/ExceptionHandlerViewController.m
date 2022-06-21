//
//  ExceptionHandlerViewController.m
//  OCBase
//
//  Created by yazhoudeng on 2022/6/21.
//

#import "ExceptionHandlerViewController.h"

@interface ExceptionHandlerViewController ()

@end

@implementation ExceptionHandlerViewController

static void UncaughtExceptionHandler(NSException *exception) {
    NSLog(@"=====>>>>>:开始");
    NSArray *arr = [exception callStackSymbols];
//    NSArray *arr1 = [exception callStackReturnAddresses];
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    NSLog(@"\nname:\n%@\nreason:\n%@\ncallStackSymbols:\n%@",name,reason,arr);

    NSLog(@"=====>>>>>:结束");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"异常收集";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //收集异常
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"=====>>>>>:began 开始");
    
    // 1、崩溃抛出异常
    NSArray *array = @[@"11",@"22"];
    array[3];
    
    // 2、直接抛出异常
//    @throw [NSException exceptionWithName:@"a崩溃" reason:@"a > 3 所以崩溃" userInfo:nil];
    
    NSLog(@"=====>>>>>:began 结束");
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
