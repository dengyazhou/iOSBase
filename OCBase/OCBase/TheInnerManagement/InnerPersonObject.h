//
//  InnerPersonObject.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InnerPersonObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *nickName;


+ (instancetype)object;

+ (instancetype)allocObject;

@end

NS_ASSUME_NONNULL_END
