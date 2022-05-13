//
//  XMCopySong.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/17.
//

#import "XMCopySong.h"

@interface XMCopySong () <NSCopying>

@end

@implementation XMCopySong



- (nonnull id)copyWithZone:(nullable NSZone *)zone {
//    XMCopySong *song = [[XMCopySong allocWithZone:zone] init];//可以
    XMCopySong *song = [[XMCopySong alloc] init];//也可以
    song.name = self.name;
    song.age = self.age+1;//可以修改值
    return song;
    
//    return self;//返回self 也行。
}


@end
