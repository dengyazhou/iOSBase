//
//  MethodSwizzlingTool.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MethodSwizzlingTool : NSObject

+ (void)xm_methodSwizzlingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzled:(SEL)swizzledSEL;
+ (void)xm_methodSwizzlingWithClass_V1:(Class)cls oriSEL:(SEL)oriSEL swizzled:(SEL)swizzledSEL;

+ (void)xm_methodSwizzlingWithClass:(Class)cls oriSEL:(SEL)oriSEL swizzled:(Class)swizzledCls swizzled:(SEL)swizzledSEL;

@end

NS_ASSUME_NONNULL_END
