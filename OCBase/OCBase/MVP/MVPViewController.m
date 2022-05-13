//
//  MVPViewController.m
//  架构思路
//
//  Created by 邓亚洲 on 2020/6/17.
//  Copyright © 2020 DYZ. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPTableViewCell.h"

#import "Present.h"
#import "MVPModel.h"

@interface MVPViewController () <UITableViewDataSource,MVPProtocol>


@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) Present *pt;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVP";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.pt = [[Present alloc] init];
    
    
    [self.view addSubview:self.tableView];
    
    self.pt.delegate = self;
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *array = @[@"1",@"2",@"3"];
    NSString *str = array[4];
}

#pragma mark - MVPProtocol
- (void)reloadUI {
    [self.tableView reloadData];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pt.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mVPTableViewCell" forIndexPath:indexPath];
    
    MVPModel *model = self.pt.dataArray[indexPath.row];
    
    
    cell.nameLabel.text = model.name;
    cell.numLabel.text = model.num;
    cell.indexPath = indexPath;
    
    cell.delegate = self.pt;
    
    return cell;
}


- (UITableView *)tableView{
    if (!_tableView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height-200) style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor redColor];
        
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:@"mVPTableViewCell"];
        _tableView.dataSource = self;
    
    }
    return _tableView;
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
