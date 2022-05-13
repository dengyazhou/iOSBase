//
//  Present.m
//  架构思路
//
//  Created by 邓亚洲 on 2020/6/17.
//  Copyright © 2020 DYZ. All rights reserved.
//

#import "Present.h"
#import "MVPModel.h"
#import <YYModel/YYModel.h>

@implementation Present

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
    }
    return self;
}

- (void)loadData {
    NSArray *temArray =
    @[
      @{@"name":@"Hank",@"imageUrl":@"http://Hank",@"num":@"99"},
      @{@"name":@"Cooci",@"imageUrl":@"http://Cooci",@"num":@"99"},
      @{@"name":@"Kody",@"imageUrl":@"http://Kody",@"num":@"99"},
      @{@"name":@"Willian",@"imageUrl":@"http://Willian",@"num":@"59"},
      @{@"name":@"Andy",@"imageUrl":@"http://Andy",@"num":@"49"},
      @{@"name":@"随风",@"imageUrl":@"http://随风",@"num":@"29"},
      @{@"name":@"小雁子",@"imageUrl":@"http://小雁子",@"num":@"99"},
      @{@"name":@"Lina",@"imageUrl":@"http://Lina",@"num":@"98"}];
    for (int i = 0; i<temArray.count; i++) {
        MVPModel *m = [MVPModel yy_modelWithDictionary:temArray[i]];
        [self.dataArray addObject:m];
    }
}


#pragma mark - MVPProtocol
- (void)didClickCellNum:(NSString *)num indexPath:(NSIndexPath *)indexPath {
    @synchronized (self) {
        if (indexPath.row < self.dataArray.count) {
            MVPModel *model = self.dataArray[indexPath.row];
            model.num = num;
        }
        
        if ([num integerValue] > 5) {
            [self.dataArray removeAllObjects];
            NSArray *temArray =
            @[
              @{@"name":@"Hank",@"imageUrl":@"http://Hank",@"num":@"99"},
              @{@"name":@"Cooci",@"imageUrl":@"http://Cooci",@"num":@"99"}];
            for (int i = 0; i<temArray.count; i++) {
                MVPModel *m = [MVPModel yy_modelWithDictionary:temArray[i]];
                [self.dataArray addObject:m];
            }
            if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUI)]) {
                [self.delegate reloadUI];
            }
        }
        
    }
    
    
}

#pragma mark - LAZY

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


@end
