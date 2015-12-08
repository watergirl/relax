//
//  NewsViewController.m
//  BaseProject
//
//  Created by iOS－30 on 15/11/14.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewModel.h"
#import "NewsCell.h"
#import "iCarousel.h"
#import "NewsHtmlViewController.h"
@interface NewsViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)NewsViewModel *newsVM;


@end

@implementation NewsViewController
{
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}

-(UIView *)headerView{
    
    [_timer invalidate];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750*500)];
      //添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
       
    }];
    UIView *bView = [UIView new];
    bView.backgroundColor = [UIColor blackColor];
    [headView addSubview:bView];
    [bView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(17.5);

    }];
    UIView *botoomView = [UIView new];
    botoomView.backgroundColor = [UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:0.5];
    [headView addSubview:botoomView];
    [botoomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
        make.bottom.mas_equalTo(-17.5);
    }];
    _titleLb = [UILabel new];
    [botoomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.newsVM.indexPicNumber;
    [botoomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.textColor = [UIColor whiteColor];
    _titleLb.text = [self.newsVM titleForRowInIndexPic:0];

    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    //如果只有一张图,则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    //如果只有一张图,则不可以滚动
    _ic.scrollEnabled = self.newsVM.indexPicNumber != 1;
//    _pageControl.pageIndicatorTintColor = [UIColor redColor];
//    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    if (self.newsVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    //小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
    
    
}
#pragma mark - iCarousel Delegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.newsVM.indexPicNumber;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.newsVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}

/** 滚动栏中被选中后触发 */
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{

    NewsHtmlViewController *vc = [[NewsHtmlViewController alloc]initWithURL:[self.newsVM htmlURLForRowInIndexPic:index]];
    [self.navigationController pushViewController:vc animated:YES];
    
}

/** 允许循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}

/** 监控当前滚到到第几个 */
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    //NSLog(@"%ld", carousel.currentItemIndex);
    _titleLb.text = [self.newsVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}


- (NewsViewModel *)newsVM
{
    if (!_newsVM) {
        _newsVM = [[NewsViewModel alloc]initWithNewsType:_newsType.integerValue];
    }
    return _newsVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[NewsCell class] forCellReuseIdentifier:@"newCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.newsVM getDataFromNetCompleteHandle:^(NSError *error) {
            self.tableView.tableHeaderView = [self headerView];
            [self.tableView.header endRefreshing];
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
    
    self.title = @"新闻";
   
}
#pragma mark TableViewDetegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsVM.rowNumber;
}
kRemoveCellSeparator;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newCell"];
    [cell.coverIV.imageView setImageWithURL:[self.newsVM coverImgURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell"]];
    cell.titleLb.text = [self.newsVM titleForRow:indexPath.row];
    cell.descLb.text = [self.newsVM descForRow:indexPath.row];
    
    
    return cell;
}
//- (void)addItem
//{
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
//    btn.frame = CGRectMake(0, 0, 30, 30);
//    [btn bk_addEventHandler:^(id sender) {
//        [self.sideMenuViewController presentLeftMenuViewController];
//    } forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
//    //使用弹簧控件缩小菜单按钮和边缘距离
//    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    spaceItem.width = -10;
//    self.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
//
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsHtmlViewController *vc=[[NewsHtmlViewController alloc] initWithURL:[self.newsVM htmlURLForRowIndata:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
