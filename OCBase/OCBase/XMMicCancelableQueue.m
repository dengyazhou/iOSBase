//
//  XMMicCancelableQueue.m
//  XMLiveMic
//
//  Created by mengminduan on 2021/7/5.
//

#import "XMMicCancelableQueue.h"
#import <stdatomic.h>

@interface XMMicCancelableQueue ()
{
    dispatch_queue_t _ioQueue;
    void *_ioQueueTag;
}
@property (atomic, assign) atomic_int sentinel;

@end

@implementation XMMicCancelableQueue

- (instancetype)init:(const char *_Nullable)label attr:(dispatch_queue_attr_t _Nullable)attr
{
    self = [super init];
    if (self) {
        
        _ioQueueTag = &_ioQueueTag;
        void *nonNullUnusedPointer = (__bridge void *)self;
        _ioQueue = dispatch_queue_create(label, attr);
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

@end
