//
//  XMLiveBlockQueue.h
//  XMLiveCore
//
//  Created by Michael on 2021/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMLiveBlockQueue : NSObject

@property NSInteger maxConcurrentOperationCount;
@property (getter=isSuspended) BOOL suspended;
@property (nullable, copy) NSString *name;
@property NSQualityOfService qualityOfService;
@property (nullable, assign /* actually retain */) dispatch_queue_t underlyingQueue;

// 已执行的task block可自行根据当前operation状态随时取消
- (void)addOperationWithBlock:(void (^)(NSBlockOperation *operation))block;
// 注意：不支持取消已执行的barrier task
- (void)addBarrierBlock:(void (^)(void))barrier API_AVAILABLE(macos(10.15), ios(13.0), tvos(13.0), watchos(6.0));

// 已执行的task block无法取消，自行根据当前operation状态取消
- (void)cancelAllOperations;
- (void)waitUntilAllOperationsAreFinished;

//cancelAllOperations & waitUntilAllOperationsAreFinished
- (void)cancelAllOperationsAndWaitFinished;

@end

NS_ASSUME_NONNULL_END
