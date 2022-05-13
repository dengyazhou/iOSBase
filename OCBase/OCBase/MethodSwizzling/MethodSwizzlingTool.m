//
//  MethodSwizzlingTool.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/19.
//

#import "MethodSwizzlingTool.h"
#import <objc/runtime.h>

#import "MethSwiObjSon.h"

@implementation MethodSwizzlingTool

#pragma mark 1、只适用：本类的方法A（本类实现了方法A）和本来的方法B（本类实现了方法B）交换
+ (void)xm_methodSwizzlingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzled:(SEL)swizzledSEL {
    if (!cls) NSLog(@"传入的交换类不能为空");
    Method oriMethod = class_getInstanceMethod(cls, oriSEL);
    Method swiMethod = class_getInstanceMethod(cls, swizzledSEL);
    method_exchangeImplementations(oriMethod, swiMethod);
}

+ (void)xm_methodSwizzlingWithClass_V1:(Class)cls oriSEL:(SEL)oriSEL swizzled:(SEL)swizzledSEL {
    if (!cls) NSLog(@"传入的交换类不能为空");
    Method oriMethod = class_getInstanceMethod(cls, oriSEL);
    Method swiMethod = class_getInstanceMethod(cls, swizzledSEL);
    if (swiMethod) {
        NSLog(@"swiMethod:存在");
    } else {
        NSLog(@"swiMethod:不存在");
    }
    BOOL success = class_addMethod(cls, oriSEL, method_getImplementation(swiMethod), method_getTypeEncoding(oriMethod));
//    MethSwiObjSon *son = [[MethSwiObjSon alloc] init];
//    [son OCBase];
//    [son testSon];
    if (success) {
        class_replaceMethod(cls, swizzledSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
//        [son OCBase];
//        [son testSon];
    } else {
        method_exchangeImplementations(oriMethod, swiMethod);
    }
}

+ (void)xm_methodSwizzlingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzled:(Class)swizzledCls swizzled:(SEL)swizzledSEL {
    Method oriMethod = class_getInstanceMethod(cls, oriSEL);
    Method swiMethod = class_getInstanceMethod(swizzledCls, swizzledSEL);
    method_exchangeImplementations(oriMethod, swiMethod);
}

@end
