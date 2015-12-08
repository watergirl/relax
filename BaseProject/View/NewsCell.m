//
//  NewsCell.m
//  BaseProject
//
//  Created by iOS－30 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
- (TRImageView *)coverIV
{
    if (!_coverIV) {
        _coverIV = [TRImageView new];
 

    }
    return _coverIV;
}


- (UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:17];
        _titleLb.numberOfLines = 1;

    }
       return _titleLb;
}

- (UILabel *)descLb
{
    if (!_descLb) {
        _descLb = [UILabel new];
        _descLb.font = [UIFont systemFontOfSize:13];
        _descLb.textColor = [UIColor lightGrayColor];
        _descLb.numberOfLines = 2;
           }
    return _descLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.coverIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.descLb];
        
        [self.coverIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
        
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_coverIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_coverIV.mas_topMargin).mas_equalTo(3);
        }];
        
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(_titleLb.mas_rightMargin);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(8);        }];
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
