//
//  Target_A.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "Target_A.h"

@implementation Target_A

//- (void)Action_OCBase {
//    NSLog(@"%s",__func__);
//}

- (void)Action_OCBase:(id)sender {
    NSLog(@"%s",__func__);
    NSDictionary *dic = sender;
    void(^block)(int a) = dic[@"block"];
    if (block) {
        block(100);
    }    
}

//- (NSString *)Action_testTwo:(id)sender {
//    NSLog(@"%s",__func__);
//    return @"嘿嘿";
//}

//- (NSInteger)Action_testThree:(id)sender {
//    NSLog(@"%s",__func__);
//    return 33;
//}

@end
