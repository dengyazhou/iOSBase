//
//  RunTimeViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "RunTimeViewController.h"
//#import <objc/runtime.h>
//#import <malloc/malloc.h>
#import "IMEObject.h"

@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunTime";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"开始");
    
#pragma mark 3、isa
//    IMEObject *obj = [[IMEObject alloc] init];
//    NSLog(@"%@",obj);

    
#pragma mark 2、获取 Obj-C 指针所指向的内存的大小，实际上是 16 字节
    //#import <malloc/malloc.h>
//    IMEObject *obj = [[IMEObject alloc] init];
//    size_t size = malloc_size((__bridge const void *)(obj));
//    NSLog(@"%zu",size);
    
//    int a = 10;
//    int *p = &a;
//    size_t size = malloc_size(p);
//    NSLog(@"%zu",size);
    
#pragma mark 1、一个 NSObject 实例对象成员变量所占的大小，实际上是 8 字节
    //#import <objc/runtime.h>
//    size_t size = class_getInstanceSize(IMEObject.class);
//    NSLog(@"%zu",size);
    
    NSLog(@"结束");
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
