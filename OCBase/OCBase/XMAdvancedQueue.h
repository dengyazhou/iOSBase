//
//  XMAdvancedQueue.h
//  
//
//  Created by mengminduan on 2021/7/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMAdvancedQueue : NSObject

- (instancetype)init:(NSString *_Nullable)label seriesFlag:(BOOL)seriesFlag;

- (void)runAsync:(dispatch_block_t)block;

- (void)runSync:(dispatch_block_t)block;

- (void)cancel;

- (dispatch_queue_t)underlyingQueue;

- (BOOL)isCurrentQueueContext;

@end

NS_ASSUME_NONNULL_END
