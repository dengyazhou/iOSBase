//
//  Person.h
//  OCBase
//
//  Created by xmly on 2021/7/21.
//

#import <Foundation/Foundation.h>

//typedef  enum : NSUInteger {
//  XMBaseReConnectStateSuccess, // 重连成功
//  XMBaseReConnectStateFailed   // 重连失败
//} XMBaseReConnectState;

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject {
    BOOL age123;
}

//@property(nonatomic, assign) XMBaseReConnectState state;
//@property(nonatomic, assign) BOOL stopRetry;

//@property (nonatomic, copy) NSString *abc;
//
//- (void)OCBase;

@end

NS_ASSUME_NONNULL_END
