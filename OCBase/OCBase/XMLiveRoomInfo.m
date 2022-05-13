//
//  XMLiveRoomInfo.m
//  OCBase
//
//  Created by xmly on 2022/2/23.
//

#import "XMLiveRoomInfo.h"

@implementation XMLiveRoomInfo

- (NSString *)description {
    return [NSString stringWithFormat:@"roomId:%d、roomName:%@",self.roomId,self.roomName];
}

@end
