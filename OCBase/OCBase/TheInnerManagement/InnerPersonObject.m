//
//  InnerPersonObject.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/28.
//

#import "InnerPersonObject.h"

@implementation InnerPersonObject


+ (instancetype)object {
    InnerPersonObject *obj = [[InnerPersonObject alloc] init];
    return obj;//方法返回，为了保证obj不被释放，所以会自动调用autorelease，[obj autorelease]，使其变成autorelease对象。这种情况产生的autorelease对象，必须在有__weak 被调用的之后 才会加入到自动释放池
}

+ (instancetype)allocObject {
    InnerPersonObject *obj = [[InnerPersonObject alloc] init];
    return obj;//alloc/init/new/copy/mutableCopy开头的方法, 方法返回不会自动调用autorelease，所以不是autorelease对象
}


- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
