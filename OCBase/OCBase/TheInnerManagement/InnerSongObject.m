//
//  InnerSongObject.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/15.
//

#import "InnerSongObject.h"
#import <objc/runtime.h>

@interface InnerSongObject () <NSCopying>

@end

@implementation InnerSongObject

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
//    InnerSongObject *obj = [[InnerSongObject alloc] init];
//    return obj;
    return self;
}


- (NSString *)car {
    return objc_getAssociatedObject(self, @selector(car));
}

- (void)setCar:(NSString *)car {
    objc_setAssociatedObject(self, @selector(car), car, OBJC_ASSOCIATION_COPY);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}




@end
