//
//  SJAvatarBrowser.m
//  BaseProject
//
//  Created by ios－32 on 15/11/15.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SJAvatarBrowser.h"
static CGRect oldframe;



@implementation SJAvatarBrowser


+(void)showImage:(UIImageView *)avatarImageView{
    UIImage *image=avatarImageView.image;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    oldframe=[avatarImageView convertRect:avatarImageView.bounds toView:window];
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    
    
    UIScrollView *sv = [[UIScrollView alloc]init];
    sv.frame = [UIScreen mainScreen].bounds;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = [UIColor redColor];
    [btn setImage:[UIImage imageNamed:@"icon_down"] forState:UIControlStateNormal];
    btn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-90, [UIScreen mainScreen].bounds.size.height-70, 80, 60);
    
    
    [btn bk_addEventHandler:^(id sender) {
        
        UIImageWriteToSavedPhotosAlbum(imageView.image, self,nil, nil);
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:sv animated:YES];
        progressHUD.mode = MBProgressHUDModeText;
        progressHUD.labelText = @"保存成功";
        [progressHUD hide:YES afterDelay:1];
        
    } forControlEvents:UIControlEventTouchUpInside];

    
    
    sv.bounces = YES;
    sv.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
    [sv addSubview:imageView];
    
    /* 缩放有关的设置 */
    sv.maximumZoomScale = 1;
    CGFloat xScale = sv.frame.size.width/imageView.frame.size.width;
    CGFloat yScale = sv.frame.size.height/imageView.frame.size.height;
    sv.minimumZoomScale = MIN(xScale, yScale);

    
    
    
    [backgroundView addSubview:sv];
    [backgroundView addSubview:btn];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{

        imageView.frame=CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        if (imageView.frame.size.height<=[UIScreen mainScreen].bounds.size.height) {
            imageView.center = sv.center;
        }
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
    
 
    
    
}



+(void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}

@end
