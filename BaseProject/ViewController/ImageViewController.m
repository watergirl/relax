//
//  ImageViewController.m
//  BaseProject
//
//  Created by ios－31 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ImageViewController.h"
#import "InterestingImageViewModel.h"
#import <MWTapDetectingImageView.h>
@interface ImageViewCell : UITableViewCell<MWTapDetectingImageViewDelegate>
@property (nonatomic,strong)UILabel * wbodyLb;
@property (nonatomic,strong)UILabel * likesLb;
@property (nonatomic,strong)UIImageView* likesView;
@property (nonatomic,strong)UILabel * comments;
@property (nonatomic,strong)UIImageView * commentView;
@property (nonatomic)NSInteger imgHeight;
@property (nonatomic,strong)MWTapDetectingImageView * imageview;


@end

@implementation ImageViewCell



-(UILabel *)wbodyLb
{
    if(!_wbodyLb)
    {
        _wbodyLb = [UILabel new];
        _wbodyLb.font = [UIFont systemFontOfSize:18];
        _wbodyLb.numberOfLines = 0;
        [self.contentView addSubview:_wbodyLb];
        [self.wbodyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);

            
        }];
    }
    
    return _wbodyLb;
}
-(UIImageView *)imageview
{
    if(!_imageview)
    {
        _imageview = [MWTapDetectingImageView new];
        
        _imageview.tapDelegate = self;

        _imageview.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.imageview];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(self.imgHeight);
            make.top.mas_equalTo(_wbodyLb.mas_bottom).mas_equalTo(10);
            
        }];
    }
    return _imageview;
}
- (void)imageView:(UIImageView *)imageView singleTapDetected:(UITouch *)touch{
    [SJAvatarBrowser showImage:self.imageview];//调用方法
}

-(UIImageView *)likesView
{
    if (!_likesView) {
        _likesView = [UIImageView new];
        _likesView.image = [UIImage imageNamed:@"contributeDing"];
        [self.contentView addSubview:_likesView];
        [_likesView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(26, 26));
            
            
        }];
        
    }
    return _likesView;
}

-(UILabel *)likesLb
{
    if(!_likesLb)
    {
        _likesLb = [UILabel new];
        _likesLb.font = [UIFont systemFontOfSize:14];
        _likesLb.textColor  =[UIColor grayColor];
        [self.contentView addSubview:_likesLb];
        [_likesLb mas_makeConstraints:^(MASConstraintMaker *make) {
  
            make.left.mas_equalTo(self.likesView.mas_right).mas_equalTo(4);
            make.centerY.mas_equalTo(self.likesView);
            
        }];
    }
    return _likesLb;
}




-(UILabel *)comments
{
    if(!_comments)
    {
        _comments = [UILabel new];
        _comments.font = [UIFont systemFontOfSize:14];
        _comments.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.comments];
        [_comments mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.likesView);
            make.right.mas_equalTo(-20);
        }];
        
        
    }
    return _comments;
}

-(UIImageView *)commentView
{
    if (!_commentView) {
        _commentView = [UIImageView new];
        _commentView.contentMode = 2;
        [self.contentView addSubview:_commentView];
        [_commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageview.mas_bottom).mas_equalTo(11);
            make.bottom.mas_equalTo(-8);
            make.right.mas_equalTo(self.comments.mas_left).mas_equalTo(4);
            make.centerY.mas_equalTo(self.likesView);
            make.size.mas_equalTo(CGSizeMake(70, 45));
            
    
        }];
        
    }
    return _commentView;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier imgHeight:(NSInteger)imgHeight
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imgHeight = imgHeight;
        self.userInteractionEnabled = NO;
    }
    return self;
}


@end

@interface ImageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) InterestingImageViewModel * imageVM;



@end


@implementation ImageViewController
-(InterestingImageViewModel *)imageVM
{
    if(!_imageVM)
    {
        _imageVM = [InterestingImageViewModel new];
    }
    return  _imageVM;
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];

    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15, 0, 15));
    }];

    self.tableView.header = [MJRefreshNormalHeader  headerWithRefreshingBlock:^{
        [self.imageVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData ];
            
            AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            if (!appdelegate.onLine) {
                MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                progressHUD.mode = MBProgressHUDAnimationFade;
                progressHUD.labelText = @"请检查您的网络";
                [progressHUD hide:YES afterDelay:1];
                
            }
       
        }];
    }];
    self.tableView.footer  = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.imageVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView.footer endRefreshing];
           [self.tableView reloadData];
           AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
           if (!appdelegate.onLine) {
               MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
               progressHUD.mode = MBProgressHUDAnimationFade;
               progressHUD.labelText = @"请检查您的网络";
               [progressHUD hide:YES afterDelay:1];
               
           }
           
       }];
    }];
    [self.tableView.header beginRefreshing];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 15)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    self.tableView.tableHeaderView =view;
    
    
}


-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{  
    return _imageVM.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger imgHeight= [self.imageVM heightForRow:indexPath.section].doubleValue;
    
    
    ImageViewCell * cell = [[ImageViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil imgHeight:imgHeight];
    
    cell.wbodyLb.text = [self.imageVM wbodyForRow:indexPath.section];
     double pp =  [self.imageVM LikesForRow:indexPath.section].doubleValue;
    cell.likesLb.text = [NSString stringWithFormat:@"%.0lf",pp];
    cell.comments.text = [self.imageVM commentsForRow:indexPath.section];
        cell.commentView.image = [UIImage imageNamed:@"btn_comment"];
    [cell.imageview sd_setImageWithURL:[self.imageVM iconForRow:indexPath.section] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error) {
            cell.userInteractionEnabled = YES;
        }
    }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}


@end
