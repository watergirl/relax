//
//  TuWanImageCell.h
//  BaseProject
//
//  Created by tarena-ZeRO on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView1.h"
@interface TuWanImageCell1 : UITableViewCell
/** 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
/** 点击数标签 */
@property(nonatomic,strong)UILabel *clicksNumLb;
/** 图片1 */
@property(nonatomic,strong)TRImageView1 *iconIV0;
/** 图片2 */
@property(nonatomic,strong)TRImageView1 *iconIV1;
/** 图片3 */
@property(nonatomic,strong)TRImageView1 *iconIV2;

@end
