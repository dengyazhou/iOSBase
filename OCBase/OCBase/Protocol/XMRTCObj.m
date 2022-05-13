//
//  XMRTCObj.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/27.
//

#import "XMRTCObj.h"

@implementation XMRTCObj

//XMRTCObj遵守XMRTCProtocol协议，协议中有businessType属性，如果这是XMRTCObj没有这个属性，则需要使用 @synthesize businessType，否者使用businessType就会包方法找不到。
@synthesize businessType;

@end
