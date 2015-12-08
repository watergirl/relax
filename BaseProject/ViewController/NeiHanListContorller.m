//
//  NeiHanListContorller.m
//  BaseProject
//
//  Created by ios－32 on 15/11/13.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NeiHanListContorller.h"
#import "StoryViewController.h"
#import "ImageViewController.h"
#import "BeautifulGirlViewController.h"

@interface NeiHanListContorller ()
@property (nonatomic,strong)UIView * conView;
@property (nonatomic,strong)UISegmentedControl * segContorl;
@property (nonatomic,strong)BeautifulGirlViewController * beautiController;
@end


@implementation NeiHanListContorller


//-(UIView *)conView
//{
//    if (!_conView) {
//        _conView = [[UIView alloc]init];
//    }
//    return _conView;
//}

+ (UINavigationController *)standardNeiHanNavi
{
    
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NeiHanListContorller *vc = [[NeiHanListContorller alloc]init];
       
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    UISegmentedControl *segControl = [[UISegmentedControl alloc]initWithItems:@[@"段子",@"趣图",@"美女"]];
    self.segContorl = segControl;
    [segControl setWidth:60 forSegmentAtIndex:0];
    [segControl setWidth:60 forSegmentAtIndex:1];
    [segControl setWidth:60 forSegmentAtIndex:2];
    [segControl setTintColor:[UIColor whiteColor]];
    [segControl setBackgroundColor:[UIColor colorWithRed:41/255.0 green:45/255.0 blue:48/255.0 alpha:1]];
    [segControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segControl;
    
    [segControl setSelectedSegmentIndex:0];
    
 

    StoryViewController *storyVC = [[StoryViewController alloc]init];
    
    
   
    [self.view addSubview:storyVC.view];
 
  
//    [self.conView addSubview:storyVC.view];
    
    
    
}

-(void)motionBegan
{
    if (self.segContorl.selectedSegmentIndex ==2) {
        [self.beautiController motionBegan];
    }
}


-(void)change:(UISegmentedControl *)segment
{
    NSInteger index = segment.selectedSegmentIndex;

    [[self.view subviews][0] removeFromSuperview];
    
    
    
    switch (index) {
        case 0:
        {
            StoryViewController *storyVC =[StoryViewController new];
            [self.view addSubview:storyVC.view];

        }
            break;
        case 1:
        {
            ImageViewController *imgVC = [ImageViewController new];
            [self.view addSubview:imgVC.view];
            
        }
            break;
        case 2:
        {
            BeautifulGirlViewController *storyVC =[BeautifulGirlViewController standardBeautiVC];
            self.beautiController = storyVC;
            [self.view addSubview:storyVC.view];
            
        }
            break;
            
        default:
            break;
    }


   
    
}


@end
