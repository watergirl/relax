//
//  NewsController.m
//  BaseProject
//
//  Created by ios－32 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NewsController.h"
#import "NewsViewModel.h"
#import "NewsViewController.h"

@interface NewsController ()

@end

@implementation NewsController


+(UINavigationController*)standardNewsNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NewsController *vc = [[NewsController alloc] initWithViewControllerClasses:[self viewControllerClasses] andTheirTitles:[self itemNames]];
        //例如设置第一个控制器的某个属性的值, KVC
        //vc setValue:[values[0]] forKey:keys[0]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}


/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:@(i)];
    }
    return arr;
}

/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"newsType"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"热门",@"快讯",@"推荐",@"财经",@"娱乐",@"帝都",@"图文",@"动态",@"国家",@"周刊",@"评论",@"教育",@"手记",@"房产",@"传媒",@"创客",@"松鼠",@"阅车",@"染体",@"摩登",@"学习",@"健康"];
}

/** 提供每个题目对应的控制器的类型。题目和类型数量必须一致 */
+ (NSArray *)viewControllerClasses{
    NSMutableArray *arr = [NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[NewsViewController class]];
    }
    return [arr copy];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"小道消息";
    [Factory addMenuItemToVC:self];
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
