//
//  WelcomeViewController.m
//  欢迎界面
//
//  Created by xiaoz on 15/9/10.
//  Copyright (c) 2015年 xiaoz. All rights reserved.
//

#import "WelcomeViewController.h"
#import "UIView+Extension.h"
#define IMAGECOUNT 3

@interface WelcomeViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl *pageControl;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.创建滚动视图实例
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    // 设置滚动视图的代理
    scrollView.delegate = self;
    scrollView.frame = self.view.bounds;
    
    //2.添加滚动视图到self.view中
    [self.view addSubview:scrollView];
    
    //3.配置滚动视图
    //配置边缘不可以弹跳
    scrollView.bounces = NO;
    
    //设置整页滚动
    scrollView.pagingEnabled = YES;
    
    //设置水平滚动条不可见
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //竖直方向不想滚动则可以设置为0
    scrollView.contentSize = CGSizeMake(IMAGECOUNT*scrollView.width, 0);
    //向滚动视图内添加子视图
    for (NSInteger i=0; i<IMAGECOUNT; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        
        CGSize size = [[UIScreen mainScreen] currentMode].size;
        BOOL isIp6 =CGSizeEqualToSize(size, CGSizeMake(750, 1334));
        NSString *imageName = nil;
        if (isIp6) {
            imageName = [NSString stringWithFormat:@"cm2_guide_step%ld-ip6",i+1];
        }else{
            imageName = [NSString stringWithFormat:@"cm2_guide_step%ld",i+1];
        }
        
        imageView.image = [UIImage imageNamed:imageName];
        //imageView.frame = CGRectMake(i*scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height);
        imageView.size = scrollView.size;
        imageView.x = i*scrollView.width;
        
        
        [scrollView addSubview:imageView];
        
        //针对最后一个图片视图添加“进入应用”按钮
        if (i==(IMAGECOUNT-1)) {
            [self setupEnterButton:imageView];
        }
        
    }
    
    /* 配置UIPageControl */
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    //pageControl.frame = CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 40);
    pageControl.width = self.view.width;
    pageControl.height = 40;
    pageControl.y = self.view.height-60;
    
    //设置圆点没有选中时的颜色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    //设置圆点选中时的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    //设置一共有几个圆点
    pageControl.numberOfPages = IMAGECOUNT;
    //禁止与用户交互（用户点击后无响应）
    pageControl.userInteractionEnabled = NO;
    
    //将分页控件添加到self.view中
//    [self.view addSubview:pageControl];
}


//滚动视图协议中的方法：一滚动就执行
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    // 取 滚动的横向距离 与屏幕宽度的整数倍
    double i = offset.x/scrollView.frame.size.width;
    
    // 将这个整数倍作为被选中的小圆点的下标
    self.pageControl.currentPage = round(i);
}


//配置最后一页的 进入应用  按钮
-(void)setupEnterButton:(UIImageView *)imageView
{
    //预备：开始图片的用户交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.创建按钮
    UIButton *enterButton = [[UIButton alloc]init];
    
    // 2.配置按钮

    enterButton.size = CGSizeMake(kWindowW/640.0*140, kWindowH/1136.0*38);
    enterButton.center = CGPointMake(kWindowW/640.0*319, kWindowH/1136.0*1032);
    
    // 216 57 48

    
    
    [enterButton addTarget:self action:@selector(enterApp) forControlEvents:UIControlEventTouchUpInside];
    
    // 3.添加到imageView中
    [imageView addSubview:enterButton];
 
}

//点击按钮后进入应用
/*
默认图片是不能与用户交互的，而图片又是按钮的父视图
当用户点击屏幕时，开始查找点击的视图，由于图片视图屏蔽
了操作，所以不会找到imageview身上，所以事件也不会落到
imageView的子视图按钮身上
*/
-(void)enterApp
{
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    
//    UIViewController *mainVC = [[UIViewController alloc]init];
    //为了在进入主界面后，welcome界面从内存中被释放
    //所以需要更换window的根视图控制为mainVC
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController= appdelegate.sideMenu;
}

/*
 切换界面的三种方式:
 1.present （推出新界面后，原有界面不会被释放，还能返回）
 2.导航控制器的push（push新界面后，原有界面不会被释放，还能返回）
 3.更换掉window的根视图控制器
    *获取到UIApplication对象[UIApplication sharedApplication]
    *根据应用程序对象获取window对象  application.keyWindow
    *更换：window.rootViewController = newVC
   被更换掉的vc由于不再有对象持有，会被自动释放
*/







@end
