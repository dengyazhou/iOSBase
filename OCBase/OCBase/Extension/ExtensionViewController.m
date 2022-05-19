//
//  ExtensionViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/19.
//

#import "ExtensionViewController.h"
#import "ExtObject.h"
#import "ExtObject+XMObject.h"

@interface ExtensionViewController ()

@end

@implementation ExtensionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Extension 扩展";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#pragma mark 扩展的使用，必须现在原来的类.m中 引入，否则声明的属性会找不到崩溃，方法会因为没有实现而崩溃
    ExtObject *obj = [[ExtObject alloc] init];
    [obj extObTest:@"name"];
    obj.name = @"ExtObject扩展的一个属性name";
    NSLog(@"%@",obj.name);
    
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
