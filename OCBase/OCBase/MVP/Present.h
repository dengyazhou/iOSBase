//
//  Present.h
//  架构思路
//
//  Created by 邓亚洲 on 2020/6/17.
//  Copyright © 2020 DYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MVPProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Present : NSObject <MVPProtocol>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) id<MVPProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
