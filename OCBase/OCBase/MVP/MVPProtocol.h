//
//  MVPProtocol.h
//  架构思路
//
//  Created by 邓亚洲 on 2020/6/17.
//  Copyright © 2020 DYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MVPProtocol <NSObject>

@optional
- (void)didClickCellNum:(NSString *)num indexPath:(NSIndexPath *)indexPath;

- (void)reloadUI;

@end

NS_ASSUME_NONNULL_END
