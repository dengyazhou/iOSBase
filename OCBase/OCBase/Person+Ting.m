//
//  Person+Ting.m
//  OCBase
//
//  Created by xmly on 2021/8/6.
//

#import "Person+Ting.h"

#import <objc/runtime.h>

@implementation Person (Ting)

- (NSNumber *)beforeStartTime {
    return objc_getAssociatedObject(self, @selector(beforeStartTime));
}

- (void)setBeforeStartTime:(NSString *)beforeStartTime {
    objc_setAssociatedObject(self, @selector(beforeStartTime), beforeStartTime, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
