//
//  KVOSumObject.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOSumObject : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, copy) NSString *nick;
@property (nonatomic, assign) NSInteger length;

+ (NSArray *)personArray;

+ (NSArray *)personArray1;

+ (NSSet *)personSet;
+ (NSSet *)personSet1;

@end

NS_ASSUME_NONNULL_END
