//
//  SJAvatarBrowser.h
//  BaseProject
//
//  Created by ios－32 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJAvatarBrowser : NSObject 
/**
 * @brief 浏览头像
 *
 * @param  oldImageView  头像所在的imageView
 */
@property (nonatomic,strong)UIImageView * iimgView;
+(void)showImage:(UIImageView*)avatarImageView;
@end
