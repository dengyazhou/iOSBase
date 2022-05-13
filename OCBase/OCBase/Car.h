//
//  Car.h
//  OCBase
//
//  Created by xmly on 2022/1/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Car : NSObject

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) NSNumber *high;

void dispatch_async_on_main_queue_dyz(void (^block)(void));

void funcTest(int a);

+ (NSMutableArray *)getCarElement;

+ (instancetype)initModel:(NSInteger)age high:(NSNumber *)high;

@end

NS_ASSUME_NONNULL_END
