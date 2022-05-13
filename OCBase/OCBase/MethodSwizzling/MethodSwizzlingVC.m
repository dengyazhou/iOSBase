//
//  MethodSwizzlingVC.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/19.
//

#import "MethodSwizzlingVC.h"

#import "MethodSwizzlingTool.h"
#import "MethSwiObj.h"
#import "MethSwiObjSon.h"

#import <Masonry/Masonry.h>

@interface MethodSwizzlingVC ()

@end

@implementation MethodSwizzlingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"方法交换";
    
    
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn0.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn0];
    [btn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.offset(15);
        make.height.mas_equalTo(50);
    }];
    [btn0 addTarget:self action:@selector(buttonClick0:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btn1];
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btn0);
        make.left.equalTo(btn0.mas_right).offset(10);
        make.size.equalTo(btn0);
    }];
    [btn1 addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btn0);
        make.left.equalTo(btn1.mas_right).offset(10);
        make.size.equalTo(btn0);
    }];
    [btn2 addTarget:self action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:btn3];
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(btn0);
        make.left.equalTo(btn2.mas_right).offset(10);
        make.right.offset(-15);
        make.size.equalTo(btn0);
    }];
    [btn3 addTarget:self action:@selector(buttonClick3:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"方法交换开始");
#pragma mark 1、交换
    //1、本类的方法A（本类实现了方法A）和本类的方法B（本类实现了方法B）交换。交换成功
//    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObj.class oriSEL:@selector(OCBase) swizzled:@selector(testTwo)];
    
    //2、父类方法A和子类方法B(子类没有在本类实现方法A)，在交换父类交换。交换失败
//    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObj.class oriSEL:@selector(OCBase) swizzled:@selector(testSon)];
    
    //3、父类方法A和子类方法B(子类没有在本类实现方法A)，在交换子类交换。交换成功
//    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObjSon.class oriSEL:@selector(OCBase) swizzled:@selector(testSon)];
    
    //4、父类方法A和子类方法B(子类在本类实现方法A)，在交换子类交换。交换成功
    //a、父类调用OCBase，还是调用父类的OCBase
    //b、子类调用OCBase，代用子类的testSon
    //c、子类调用testSon，调用子类自己实现的OCBase
//    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObjSon.class oriSEL:@selector(OCBase) swizzled:@selector(testSon)];
    
#pragma mark 2、
    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObj.class oriSEL:@selector(OCBase) swizzled:@selector(testTwo)];
    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObj.class oriSEL:@selector(OCBase) swizzled:@selector(testThree)];
    
#pragma mark
//    [MethodSwizzlingTool xm_methodSwizzlingWithClass:MethSwiObj.class oriSEL:@selector(OCBase) swizzled:MethSwiObjSon.class swizzled:@selector(testSon)];
    
    
    NSLog(@"方法交换结束");
}

- (void)buttonClick0:(UIButton *)sender {
    MethSwiObj *obj = [[MethSwiObj alloc] init];
    [obj OCBase];
}

- (void)buttonClick1:(UIButton *)sender {
    MethSwiObj *obj = [[MethSwiObj alloc] init];
    [obj testTwo];
}

- (void)buttonClick2:(UIButton *)sender {
//    MethSwiObjSon *obj = [[MethSwiObjSon alloc] init];
//    [obj OCBase];
    MethSwiObj *obj = [[MethSwiObj alloc] init];
    [obj testThree];
}

- (void)buttonClick3:(UIButton *)sender {
    MethSwiObjSon *obj = [[MethSwiObjSon alloc] init];
    [obj testSon];
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
