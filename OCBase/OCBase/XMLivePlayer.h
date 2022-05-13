//
//  XMLivePlayer.h
//  OCBase
//
//  Created by xmly on 2022/2/23.
//

#import <Foundation/Foundation.h>
#import "XMLiveRoomInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface XMLivePlayer : NSObject

@property (nonatomic, strong) XMLiveRoomInfo *roomInfo;
@property (nonatomic, copy) NSString *property1;
@property (nonatomic, assign) NSInteger property2;

+ (instancetype)livePlayer:(int)roomId roomName:(NSString *)roomName property1:(NSString *)property1 property2:(NSInteger)property2;

@end

NS_ASSUME_NONNULL_END
