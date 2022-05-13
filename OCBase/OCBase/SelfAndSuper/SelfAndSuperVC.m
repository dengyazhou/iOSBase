//
//  SelfAndSuperVC.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/27.
//

#import "SelfAndSuperVC.h"
#import "XMSonObj.h"

@interface SelfAndSuperVC ()

@end

@implementation SelfAndSuperVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"self & super";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    ((Class (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("class"))
//    ((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("XMSonObj"))}, sel_registerName("class"))
    
    XMSonObj *obj = [[XMSonObj alloc] init];
//    XMFatherObj *obj = [[XMFatherObj alloc] init];
    
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
