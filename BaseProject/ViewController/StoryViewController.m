//
//  ViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "StoryViewController.h"
#import "InteretingStoryViewModel.h"
#import "InteretingStoryModel.h"

@interface textCell : UITableViewCell
@property (nonatomic,strong)UILabel *label;//喜欢
@property (nonatomic,strong)UILabel *PingLun;//评论
@property (nonatomic,strong)UILabel *stroy;//笑话
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)UIImageView * pinglunView;

@end

@implementation textCell
-(UIImageView *)imageview
{
    if(!_imageview)
    {
        _imageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"contributeDing"] highlightedImage:[UIImage imageNamed:@"contributeDing"]];
/**按照等比例充满 */
        _imageview.contentMode = 2;
//        _imageview.image = [UIImage imageNamed:@"contributeDing"];
           }
    return _imageview;
}
-(UIImageView *)pinglunView
{
    if (!_pinglunView) {
        /**按照等比例充满 */
        _pinglunView.contentMode = 2;
        _pinglunView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"btn_comment"]];
    }
    return _pinglunView;
}
-(UILabel *)label
{
    if(!_label)
    {
        _label = [UILabel new];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor grayColor];
      
    }
    return _label;
}
-(UILabel *)PingLun
{
    if(!_PingLun)
    {
        _PingLun = [UILabel new];
        _PingLun.font = [UIFont systemFontOfSize:14];
        _PingLun.textColor = [UIColor grayColor];
        _PingLun.textAlignment = NSTextAlignmentLeft;
       
    }
    return _PingLun;
}

-(UILabel *)stroy
{
    if(!_stroy)
    {
        _stroy = [UILabel new];
        _stroy.font = [UIFont systemFontOfSize:16];
        _stroy.textColor = [UIColor blackColor];
         _stroy.numberOfLines = 0;
        
    }
    return _stroy;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:@"cell"])
    {
        self.userInteractionEnabled = NO;
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.stroy];
        [self.contentView addSubview:self.PingLun];
        [self.contentView addSubview:self.imageview];
        [self.contentView addSubview:self.pinglunView];
        [_imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(26, 26));
        }];
    

        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageview.mas_right).mas_equalTo(4);
            make.centerY.mas_equalTo(self.imageview);
            
        }];
        
        [_stroy mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(3);
            make.right.mas_equalTo(-3);
            
            make.bottom.mas_equalTo(-40);
        }];
        
        [_PingLun mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.imageview);
//            make.size.mas_equalTo(CGSizeMake(50, 15));
            make.right.mas_equalTo(-20);
        }];
        
        [_pinglunView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.imageview);
            make.size.mas_equalTo(CGSizeMake(81, 53));
            make.right.mas_equalTo(self.PingLun.mas_left).mas_equalTo(14);
        }];
        
        
    }
    return self;
}

@end

@interface StoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)InteretingStoryViewModel *StoryVM;
@end

@implementation StoryViewController


-(InteretingStoryViewModel *)StoryVM
{
    if(!_StoryVM)
    {
        _StoryVM = [InteretingStoryViewModel new];
    }
    return _StoryVM;
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource=  self;
        
    }
    return _tableView;
        
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"段子";
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.tableView];
     [self.tableView registerClass:[textCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 10, 0, 10));
    }];
   _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
    
       [self.StoryVM refreshDataCompletionHandle:^(NSError *error) {
           [_tableView.header endRefreshing];
           [_tableView reloadData];
           AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
           if (!appdelegate.onLine) {
               MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
               progressHUD.mode = MBProgressHUDAnimationFade;
               progressHUD.labelText = @"请检查您的网络";
               [progressHUD hide:YES afterDelay:1];
               
           }
       }];
   }];
    _tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.StoryVM getMoreDataCompletionHandle:^(NSError *error) {
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
            AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            if (!appdelegate.onLine) {
                MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                progressHUD.mode = MBProgressHUDAnimationFade;
                progressHUD.labelText = @"请检查您的网络";
                [progressHUD hide:YES afterDelay:1];
                
            }
        }];
    }];
    [_tableView.header beginRefreshing];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 15)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    self.tableView.tableHeaderView =view;
    
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{ return _StoryVM.dataArr.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    textCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    double b =[_StoryVM likesForRow:indexPath.section].doubleValue;
    
    cell.label.text = [NSString stringWithFormat:@"%.0lf",b];
    
    
   
    cell.stroy.text = [_StoryVM wbodyForRow:indexPath.section];
   
    cell.PingLun.text  = [_StoryVM commentsForRow:indexPath.section];
   
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}


-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGSize txtSize = [[_StoryVM wbodyForRow:indexPath.section] boundingRectWithSize:CGSizeMake(250, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;
//    
//    return txtSize.height+100;
//}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
  return  self.tableView.estimatedRowHeight;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES ];
    
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
