//
//  MTThinkingAnalyticsSDK.m
//  OCBase
//
//  Created by xmly on 2022/6/10.
//

#import "MTThinkingAnalyticsSDK.h"


static MTThinkingAnalyticsSDK *instance;

@implementation MTThinkingAnalyticsSDK

+ (instancetype)shareSDK {
    static dispatch_once_t onceToken;
    NSLog(@"===>>>once_start:%@",[NSThread currentThread]);
    dispatch_once(&onceToken, ^{
        NSLog(@"===>>>start:%@",[NSThread currentThread]);
        instance = [[MTThinkingAnalyticsSDK alloc] init];
        
        for (NSInteger i = 0; i < 5; i++) {
            NSLog(@"===>>>i:%ld",i);
        }
        sleep(2);
        
        NSLog(@"===>>>end:%@",[NSThread currentThread]);
    });
    NSLog(@"===>>>once_end:%@",[NSThread currentThread]);
    return instance;
}

+ (instancetype)shareSDK1 {
    @synchronized (@"TA") {
        NSLog(@"===>>>once_start:%@",[NSThread currentThread]);
        if (!instance) {
            NSLog(@"===>>>start:%@",[NSThread currentThread]);
            instance = [[MTThinkingAnalyticsSDK alloc] init];
            
            for (NSInteger i = 0; i < 5; i++) {
                NSLog(@"===>>>i:%ld",i);
            }
            sleep(2);
            
            NSLog(@"===>>>end:%@",[NSThread currentThread]);
        }
        NSLog(@"===>>>once_end:%@",[NSThread currentThread]);
        return instance;
    }
}

@end
