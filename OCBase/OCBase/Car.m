//
//  Car.m
//  OCBase
//
//  Created by xmly on 2022/1/9.
//

#import "Car.h"

void dispatch_async_on_main_queue_dyz(void (^block)(void)) {
    NSLog(@"Car 开始");
    block();
    NSLog(@"Car 结束");
}

void funcTest(int a) {
    NSLog(@"==== >>> %d",a);
}
@implementation Car

+ (NSMutableArray *)getCarElement {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    for (NSInteger i=0; i<10; i++) {
        Car *car = [self initModel:i high:[NSNumber numberWithInteger:i]];
        [array addObject:car];
    }
    return array;
}

+ (instancetype)initModel:(NSInteger)age high:(NSNumber *)high {
    Car *car = [[Car alloc] init];
    car.age = age;
    car.high = high;
    return car;
}

@end
