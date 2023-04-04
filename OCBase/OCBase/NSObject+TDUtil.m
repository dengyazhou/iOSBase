//
//  NSObject+TDUtil.m
//  OCBase
//
//  Created by yazhoudeng on 2023/4/3.
//

#import "NSObject+TDUtil.h"

@implementation NSObject (TDUtil)

+ (id)performSelector:(SEL)selector onTarget:(id)target withArguments:(NSArray *)arguments {
    if ([target respondsToSelector:selector]) {
        id returnObject = nil;
        
        return returnObject;
    }
    
    return nil;
}

@end
