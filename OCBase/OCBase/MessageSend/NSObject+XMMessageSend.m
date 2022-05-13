//
//  NSObject+XMMessageSend.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/1.
//

#import "NSObject+XMMessageSend.h"

@implementation NSObject (XMMessageSend)

#pragma mark 不能这样操作，直接都崩溃了
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
//    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
//}
//
//- (void)forwardInvocation:(NSInvocation *)invocation {
//    void *null = NULL;
//    [invocation setReturnValue:&null];
//}

@end
