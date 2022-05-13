//
//  MessageSendObject.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/13.
//

#import "MessageSendObject.h"
#import <objc/runtime.h>
//#import <objc/message.h>

#import "MSObject.h"

@implementation MessageSendObject

- (void)OCBase {
    NSLog(@"%s",__func__);
}

#pragma mark 1、动态方法决议
////动态方法决议
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s",__func__);
//    if (sel == @selector(testTwo)) {
//        //1、添加本类的方法
//        IMP imp = class_getMethodImplementation(self, @selector(sayHello));
//        Method sayMethod = class_getClassMethod(self, @selector(sayHello));
//        const char *type = method_getTypeEncoding(sayMethod);
//        class_addMethod(self, sel, imp, type);
//
//        //2、添加其他类的方法
////        IMP imp = class_getMethodImplementation(MSObject.class, @selector(sayHello));
////        Method sayMethod = class_getClassMethod(MSObject.class, @selector(sayHello));
////        const char *type = method_getTypeEncoding(sayMethod);
//        class_addMethod(self, sel, imp, type);
//
////        return NO;//这里返回YES或NO，好像都没啥作用
//    }
//    return [super resolveInstanceMethod:sel];
//}
//
//- (void)sayHello {
//    NSLog(@"%s",__func__);
//}


#pragma mark 2、快速转发
////动态方法决议
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s",__func__);
//    return [super resolveInstanceMethod:sel];
//}
//
////快速转发
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"%s",__func__);
//    if (aSelector == @selector(testTwo)) {
//        //1、返回其他类
//        return [[MSObject alloc] init];
//
//        //2、返回本类对象
////        IMP imp = class_getMethodImplementation(MessageSendObject.class, @selector(sayHello));
////        Method sayMethod = class_getClassMethod(MessageSendObject.class, @selector(sayHello));
////        const char *type = method_getTypeEncoding(sayMethod);
////        class_addMethod(MessageSendObject.class, aSelector, imp, type);
////        return [[MessageSendObject alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//- (void)sayHello {
//    NSLog(@"%s",__func__);
//}

#pragma mark 3、慢速转发
////动态方法决议
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s",__func__);
//    return [super resolveInstanceMethod:sel];
//}
//
////快速转发
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSLog(@"%s",__func__);
//    return [super forwardingTargetForSelector:aSelector];
//}
//
////慢速转发
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    NSLog(@"%s",__func__);
//    if (aSelector == @selector(testTwo)) {
////        return [NSMethodSignature methodSignatureForSelector:@selector(sayHello)];// ❌
//        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
////        return nil;//会来到doesNotRecognizeSelector
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"%s",__func__);
//    anInvocation.selector = @selector(sayHello);
////    anInvocation.target = [[MSObject alloc] init];// ❌
//    [anInvocation invoke];
//}
//
//// 当methodSignatureForSelector 返回为nil时，会来到这里
//- (void)doesNotRecognizeSelector:(SEL)aSelector {
//    NSLog(@"%s",__func__);
//}

#pragma mark YYWeakProxy
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
//    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation {
//    void *null = NULL;
//    [invocation setReturnValue:&null];
//}

- (void)sayHello {
    NSLog(@"%s",__func__);
}
@end
