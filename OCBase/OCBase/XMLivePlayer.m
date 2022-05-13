//
//  XMLivePlayer.m
//  OCBase
//
//  Created by xmly on 2022/2/23.
//

#import "XMLivePlayer.h"

@implementation XMLivePlayer

+ (instancetype)livePlayer:(int)roomId roomName:(NSString *)roomName property1:(NSString *)property1 property2:(NSInteger)property2 {
    XMLiveRoomInfo *roomInfo = [[XMLiveRoomInfo alloc] init];
    roomInfo.roomId = roomId;
    roomInfo.roomName = roomName;
    
    XMLivePlayer *livePlayer = [[XMLivePlayer alloc] init];
    livePlayer.roomInfo = roomInfo;
    livePlayer.property1 = property1;
    livePlayer.property2 = property2;
    
    return livePlayer;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"roomInfo:%@、property1:%@、property2：%ld",self.roomInfo,self.property1,self.property2];
}

@end
