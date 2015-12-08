//
//  HtmlViewController.m
//  BaseProject
//
//  Created by ios－32 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HtmlViewController.h"

@interface HtmlViewController ()<UIWebViewDelegate>
@property(nonatomic,strong) UIWebView *webView;

@end

@implementation HtmlViewController

-(id)initWithURL:(NSURL *)url{
    if (self = [super init]) {
        self.url = url;
    }
    return self;
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        [_webView loadRequest:[NSURLRequest requestWithURL:_url]];
        _webView.delegate = self;
        
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (!appdelegate.onLine) {
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progressHUD.mode = MBProgressHUDAnimationFade;
        progressHUD.labelText = @"请检查您的网络";
        [progressHUD hide:YES afterDelay:1];
        
    }

    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    btn.frame = CGRectMake(0, 0, 45, 44);
    [btn bk_addEventHandler:^(id sender) {
        [self.webView goBack];
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    self.navigationItem.leftBarButtonItems = @[spaceItem,menuItem];
    
    
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"setting_update"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"setting_update"] forState:UIControlStateHighlighted];
    btn1.frame = CGRectMake(0, 0, 45, 44);
    [btn1 bk_addEventHandler:^(id sender) {
        [self.webView reload];
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem1=[[UIBarButtonItem alloc] initWithCustomView:btn1];
    //使用弹簧控件缩小菜单按钮和边缘距离
    UIBarButtonItem *spaceItem1=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -16;
    self.navigationItem.rightBarButtonItems = @[menuItem1,spaceItem1];
    
    

}
#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self showProgress]; //旋转提示
      
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self hideProgress];
 
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self hideProgress];
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
