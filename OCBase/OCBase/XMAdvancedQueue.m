//
//  XMAdvancedQueue.m
//
//
//  Created by mengminduan on 2021/7/5.
//

#import "XMAdvancedQueue.h"
#import <stdatomic.h>

@interface XMAdvancedQueue ()
{
    dispatch_queue_t _ioQueue;
    void *_ioQueueTag;
}
@property (atomic, assign) atomic_int sentinel;

@end

@implementation XMAdvancedQueue

- (instancetype)init:(NSString *)label seriesFlag:(BOOL)seriesFlag
{
    self = [super init];
    if (self) {
        
        _ioQueueTag = &_ioQueueTag;
        void *nonNullUnusedPointer = (__bridge void *)self;
        dispatch_queue_attr_t attr = seriesFlag ? DISPATCH_QUEUE_SERIAL : DISPATCH_QUEUE_CONCURRENT;
        _ioQueue = dispatch_queue_create([label UTF8String], attr);
        dispatch_queue_set_specific(_ioQueue, _ioQueueTag, nonNullUnusedPointer, NULL);
    }
    return self;
}


- (void)runAsync:(dispatch_block_t)block
{
    atomic_int sentinel = self.sentinel;
    BOOL (^isCancelled)(void) = ^BOOL() {
        return sentinel != self.sentinel;
    };
    
    dispatch_block_t queueBlock = ^{
        if (isCancelled()) {
            return;
        };
        
        block();
    };
    
    if (dispatch_get_specific(_ioQueueTag))
        queueBlock();
    else
        dispatch_async(_ioQueue, queueBlock);
}

- (void)runSync:(dispatch_block_t)block
{
    atomic_int sentinel = self.sentinel;
    BOOL (^isCancelled)(void) = ^BOOL() {
        return sentinel != self.sentinel;
    };
    
    dispatch_block_t queueBlock = ^{
        if (isCancelled()) {
            return;
        };
        
        block();
    };
    
    if (dispatch_get_specific(_ioQueueTag))
        queueBlock();
    else
        dispatch_sync(_ioQueue, queueBlock);
}

- (void)cancel
{
    atomic_fetch_add(&_sentinel, 1);
}

- (dispatch_queue_t)underlyingQueue
{
    return _ioQueue;
}

- (BOOL)isCurrentQueueContext
{
    if (dispatch_get_specific(_ioQueueTag))
        return YES;
    else
        return NO;
}

@end
