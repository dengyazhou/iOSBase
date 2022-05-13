//
//  XMMicCancelableQueue.h
//  XMLiveMic
//
//  Created by mengminduan on 2021/7/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMMicCancelableQueue : NSObject

- (instancetype)init:(const char *_Nullable)label attr:(dispatch_queue_attr_t _Nullable)attr;

- (void)runAsync:(dispatch_block_t)block;

- (void)runSync:(dispatch_block_t)block;

- (void)cancel;

@end

NS_ASSUME_NONNULL_END
