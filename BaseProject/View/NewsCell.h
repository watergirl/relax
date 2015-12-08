//
//  NewsCell.h
//  BaseProject
//
//  Created by iOS－30 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface NewsCell : UITableViewCell
@property (nonatomic,strong)TRImageView *coverIV;
@property (nonatomic,strong)UILabel *titleLb;
@property (nonatomic,strong)UILabel *descLb;



@end
