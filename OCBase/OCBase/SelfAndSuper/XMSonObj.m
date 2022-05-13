//
//  XMSonObj.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/27.
//

#import "XMSonObj.h"
#import <objc/runtime.h>

@implementation XMSonObj

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
//        ((Class (*)(id, SEL))(void *)objc_msgSend)((id)self, sel_registerName("class"))
//        ((Class (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("XMSonObj"))}, sel_registerName("class"))
    }
    return self;
}

//- (Class)class {
////    return [super class];
//    return objc_getClass("XMSonObj");
////    return objc_getClass("XMLiveStream");
//}

@end
