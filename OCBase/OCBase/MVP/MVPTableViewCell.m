//
//  MVPTableViewCell.m
//  架构思路
//
//  Created by 邓亚洲 on 2020/6/17.
//  Copyright © 2020 DYZ. All rights reserved.
//

#import "MVPTableViewCell.h"
#import <Masonry.h>

@implementation MVPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(20);
    }];
    
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.mas_equalTo(-50);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.addBtn.mas_left);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    [self.subBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numLabel.mas_left);
        make.size.centerY.equalTo(self.addBtn);
    }];
}

- (void)setupUI {
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.numLabel];
    [self.contentView addSubview:self.subBtn];
    [self.contentView addSubview:self.addBtn];
    self.num = 0;
}

#pragma mark - Action

- (void)didClickSubBtn:(UIButton *)sender {
    if ([self.numLabel.text intValue]<=0) {
        return;
    }
    self.num--;
}

- (void)didClickAddBtn:(UIButton *)sender {
    if ([self.nameLabel.text intValue]>=200) {
        return;
    }
    self.num++;
}

#pragma mark - setter

- (void)setNum:(int)num {
    _num = num;
    self.numLabel.text = [NSString stringWithFormat:@"%d",self.num];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickCellNum:indexPath:)]) {
        [self.delegate didClickCellNum:self.numLabel.text indexPath:self.indexPath];
    }
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - LAZY


- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"Cooci";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.textColor = [UIColor orangeColor];
    }
    return _nameLabel;
}

- (UILabel *)numLabel {
    if (_numLabel == nil) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.text = @"0";
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.font = [UIFont systemFontOfSize:20];
        _numLabel.textColor = [UIColor redColor];
    }
    return _numLabel;
}


- (UIButton *)subBtn {
    if (_subBtn == nil) {
        _subBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_subBtn setTitle:@" - " forState:UIControlStateNormal];
        [_subBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _subBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_subBtn setBackgroundColor:[UIColor blueColor]];
        [_subBtn addTarget:self action:@selector(didClickSubBtn:) forControlEvents:UIControlEventTouchUpInside];
        _subBtn.layer.cornerRadius = 15;
        _subBtn.layer.masksToBounds = YES;
        _subBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        
    }
    return _subBtn;
}


- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBtn setTitle:@" + " forState:UIControlStateNormal];
        [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_addBtn setBackgroundColor:[UIColor blueColor]];
        [_addBtn addTarget:self action:@selector(didClickAddBtn:) forControlEvents:UIControlEventTouchUpInside];
        _addBtn.layer.cornerRadius = 15;
        _addBtn.layer.masksToBounds = YES;
        _addBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    
    return _addBtn;
}

@end
