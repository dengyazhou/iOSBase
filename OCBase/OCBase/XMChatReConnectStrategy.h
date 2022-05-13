//
//  XMChatReConnectStrategy.h
//  OCBase
//
//  Created by xmly on 2021/10/20.
//

#import <Foundation/Foundation.h>

typedef  enum : NSUInteger {
  XMBaseReConnectStateSuccess, // 重连成功
  XMBaseReConnectStateFailed   // 重连失败
} XMBaseReConnectState;

NS_ASSUME_NONNULL_BEGIN

@protocol XMChatReConnectStrategy <NSObject>

//@property(nonatomic, assign) XMBaseReConnectState state;
//@property(nonatomic, assign) BOOL stopRetry;

@end

NS_ASSUME_NONNULL_END
