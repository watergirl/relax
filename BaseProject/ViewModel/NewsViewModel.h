//
//  NewsViewModel.h
//  BaseProject
//
//  Created by iOS－30 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "NewsNetModel.h"
#import "NewsModel.h"
@interface NewsViewModel : BaseViewModel

- (instancetype)initWithNewsType:(NewsType )type;
@property (nonatomic,assign)NewsType type;


- (instancetype)initWithNewsModel:(NewsModel *)model;
@property (nonatomic,strong)NewsModel *model;



@property (nonatomic,assign)NSInteger rowNumber;
/** 某行的图片 */
-(NSURL *)coverImgURLForRow:(NSInteger)row;
/** 某行的标题 */
- (NSString *)titleForRow:(NSInteger)row;
/** 某行的详情 */
- (NSString *)descForRow:(NSInteger)row;

/** 头部滚动视图的图片数组 */
@property (nonatomic,strong)NSMutableArray *headImgUrl;
/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property(nonatomic,assign) NSInteger indexPicNumber;

- (NSURL *)htmlURLForRowInIndexPic:(NSInteger)row;
-(NSURL *)htmlURLForRowIndata:(NSInteger)row;


///** 头部视图详情  */
//- (NSString *)captionForRow:(NSInteger)row;

@end
