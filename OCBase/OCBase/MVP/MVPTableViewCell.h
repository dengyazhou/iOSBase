//
//  MVPTableViewCell.h
//  架构思路
//
//  Created by 邓亚洲 on 2020/6/17.
//  Copyright © 2020 DYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVPTableViewCell : UITableViewCell


@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id <MVPProtocol> delegate;


@end

NS_ASSUME_NONNULL_END
