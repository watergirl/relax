//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "InteretingStoryNetManager.h"
#import "InterestingImageNetManager.h"
#import "NeiHanListContorller.h"

#import "ImageViewController.h"
#import "BeautifulGirlViewController.h"
#import "TuWanNetManager.h"
#import "LeftViewController.h"
#import "MobClickSocialAnalytics.h"
#import "WelcomeViewController.h"
#import "MobClick.h"

#define AppKey @"5649cbb0e0f55ad58e003851"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
        NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
        NSString *key =@"CFBundleShortVersionString";
        NSString *currentVersion=infoDic[key];
        NSString *runVersion=[[NSUserDefaults standardUserDefaults] stringForKey:key];
        if (runVersion==nil || ![runVersion isEqualToString:currentVersion] ) {
        self.window.rootViewController = [[WelcomeViewController alloc]init];
        [[NSUserDefaults standardUserDefaults] setValue:currentVersion forKey:key];
        }else{

            self.window.rootViewController = self.sideMenu;
        }
    
    
    
    
    
    
    // Override point for customization after application launch.
    [self initializeWithApplication:application];

    
    [self configGlobalUIStyle]; //配置全局UI样式
    
    //注册友盟分析
    //参数2 报告的频率, BATCH默认值，每次启动发送
    [MobClick startWithAppkey:AppKey reportPolicy:BATCH channelId:nil];
    
    return YES;
   
}

/** 配置全局UI的样式 */
- (void)configGlobalUIStyle{
    /** 导航栏不透明 */
    [[UINavigationBar appearance] setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"topbarbg"] forBarMetrics:UIBarMetricsDefault];
    /** 配置导航栏题目的样式 */
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:24.0], NSForegroundColorAttributeName: [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1.0]}];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
}
-(UIWindow *)window
{
    if(!_window)
    {
        _window =  [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (RESideMenu *)sideMenu{
    if (!_sideMenu) {
        _sideMenu=[[RESideMenu alloc]initWithContentViewController:[NeiHanListContorller standardNeiHanNavi]leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为sideMenu设置背景图,图片插件KSImageName，到Github下载
        _sideMenu.backgroundImage =[UIImage imageNamed:@"IMG_0598.jpg"];
        //可以让出现菜单时不显示状态栏
        _sideMenu.menuPrefersStatusBarHidden = YES;
        //不允许菜单栏到了边缘还可以继续缩小
        _sideMenu.bouncesHorizontally = NO;
    }
    return _sideMenu;
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    
    if ([self.sideMenu.contentViewController isKindOfClass:[[NeiHanListContorller standardNeiHanNavi]class]]) {
        UINavigationController *nController = [NeiHanListContorller standardNeiHanNavi];
        NeiHanListContorller *neihanController = (NeiHanListContorller *)nController.viewControllers[0];
        [neihanController motionBegan];
    }
    
}


@end
