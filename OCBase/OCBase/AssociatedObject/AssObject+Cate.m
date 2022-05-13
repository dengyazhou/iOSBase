//
//  AssObject+Cate.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "AssObject+Cate.h"
#import <objc/runtime.h>

@implementation AssObject (Cate)

@dynamic car;

- (NSString *)car {
    return objc_getAssociatedObject(self, @selector(car));
}

- (void)setCar:(NSString *)car {
    objc_setAssociatedObject(self, @selector(car), car, OBJC_ASSOCIATION_COPY);
}

@end
