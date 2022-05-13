//
//  XMLiveStream.h
//  OCBase
//
//  Created by xmly on 2022/2/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMLiveStream : NSObject

@property (nonatomic, copy) NSString *userID;       // 用户id
@property (nonatomic, copy) NSString *userName;     // 用户昵称
@property (nonatomic, copy) NSString *streamID;     // 流id
@property (nonatomic, copy) NSString *extraInfo;    // 流附加信息

@property (nonatomic, strong) UIView *renderView;   // 用于渲染流的视图

@end

NS_ASSUME_NONNULL_END
