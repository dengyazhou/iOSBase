//
//  CTMediator+CTMediatorModuleAActions.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "CTMediator+CTMediatorModuleAActions.h"

NSString * const kCTMediatorTargetA = @"A";

NSString * const kCTMediatorActionOCBase = @"OCBase";
NSString * const kCTMediatorActionTestTwo = @"testTwo";
NSString * const kCTMediatorActionTestThree = @"testThree";

@implementation CTMediator (CTMediatorModuleAActions)

- (void)CTMediator_OCBase {
    void(^block)(int a) = ^(int a) {
        
        NSLog(@"block :%d",a);
    };
    [self performTarget:kCTMediatorTargetA action:kCTMediatorActionOCBase params:@{@"block":block} shouldCacheTarget:NO];
}

- (NSString *)CTMediator_TestTwo {
    return [self performTarget:kCTMediatorTargetA action:kCTMediatorActionTestTwo params:@{} shouldCacheTarget:NO];
}

- (NSInteger)CTMediator_TestThree {
    //类型为NSNumber，是@()，这样返回的
    id num = [self performTarget:kCTMediatorTargetA action:kCTMediatorActionTestThree params:@{} shouldCacheTarget:NO];
    return ((NSNumber *)num).integerValue;
}

@end
