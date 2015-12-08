//
//  InterestingImageViewModel.h
//  BaseProject
//
//  Created by ios－31 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "InterestingImageNetManager.h"
@interface InterestingImageViewModel : BaseViewModel

-(NSString *)wbodyForRow:(NSInteger)row;//照片标题

-(NSString *)LikesForRow:(NSInteger)row;//喜欢个数

-(NSString *)commentsForRow:(NSInteger)row;//评论数

-(NSURL *)iconForRow:(NSInteger)row;//图片
-(NSString *)widthForRow:(NSInteger)row;//图片的宽
-(NSString *)heightForRow:(NSInteger)row;//图片的高
@property (nonatomic,assign)NSInteger rowNumber ;

@property (nonatomic)NSInteger page;
@property (nonatomic)NSInteger size;
@property (nonatomic,strong)NSString * PathNSString;



@end
