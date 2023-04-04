//
//  NSObject+TDUtil.h
//  OCBase
//
//  Created by yazhoudeng on 2023/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (TDUtil)

+ (id)performSelector:(SEL)selector onTarget:(id)target withArguments:(NSArray *)arguments;

@end

NS_ASSUME_NONNULL_END
