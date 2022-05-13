//
//  XMLiveBlockQueue.m
//  XMLiveCore
//
//  Created by Michael on 2021/9/27.
//

#import "XMLiveBlockQueue.h"

@interface XMLiveBlockQueue ()

@property (nonatomic, strong) NSOperationQueue *currentQueue;

@end

@implementation XMLiveBlockQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentQueue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (NSInteger)maxConcurrentOperationCount {
    return self.currentQueue.maxConcurrentOperationCount;
}

- (void)setMaxConcurrentOperationCount:(NSInteger)maxConcurrentOperationCount {
    [self.currentQueue setMaxConcurrentOperationCount:maxConcurrentOperationCount];
}

- (BOOL)isSuspended {
    return self.currentQueue.isSuspended;
}

- (void)setSuspended:(BOOL)suspended {
    [self.currentQueue setSuspended:suspended];
}

- (NSString *)name {
    return self.currentQueue.name;
}

- (void)setName:(NSString *)name {
    [self.currentQueue setName:name];
}

- (NSQualityOfService)qualityOfService {
    return self.currentQueue.qualityOfService;
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService {
    [self.currentQueue setQualityOfService:qualityOfService];
}

- (dispatch_queue_t)underlyingQueue {
    return self.currentQueue.underlyingQueue;
}

- (void)setUnderlyingQueue:(dispatch_queue_t)underlyingQueue {
    [self.currentQueue setUnderlyingQueue:underlyingQueue];
}

- (void)cancelAllOperations {
    [self.currentQueue cancelAllOperations];
}
- (void)waitUntilAllOperationsAreFinished {
    [self.currentQueue waitUntilAllOperationsAreFinished];
}

- (void)addOperationWithBlock:(void (^)(NSBlockOperation *operation))block {
    NSBlockOperation *operation = [[NSBlockOperation alloc] init];
    __weak NSBlockOperation *weakOperation = operation;
    [operation addExecutionBlock:^{
        if (weakOperation.isCancelled) {
            return;
        }
        
        if (block) {
            block(weakOperation);
        }
    }];
    
    [self.currentQueue addOperation:operation];
}

- (void)addBarrierBlock:(void (^)(void))barrier {
    [self.currentQueue addBarrierBlock:barrier];
}

- (void)cancelAllOperationsAndWaitFinished {
    [self.currentQueue cancelAllOperations];
    [self.currentQueue waitUntilAllOperationsAreFinished];//During this time, the current thread cannot add operations to the queue, but other threads may.
}

//- (void)addTask:(void (^)(BOOL (^isCancelled)(void)))taskBlock {
//    atomic_int sentinel = self.queueSentinel;
//    BOOL (^taskIsCancelled)(void) = ^BOOL() {
//        return sentinel != self.queueSentinel;
//    };
//
//    dispatch_block_t queueBlock = ^{
//        if (taskIsCancelled()) {
//            NSString *log = [NSString stringWithFormat:@"%@, queue is canceled", NSStringFromSelector(_cmd)];
//            [self appendLog:log];
//            return;
//        };
//
//        taskBlock(taskIsCancelled);
//    };
//
//    if (dispatch_get_specific(_ioQueueTag))
//        queueBlock();
//    else
//        dispatch_async(_ioQueue, queueBlock);
//}

@end
