//
//  HtmlViewController.h
//  BaseProject
//
//  Created by ios－32 on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HtmlViewController : UIViewController
- (id)initWithURL:(NSURL *)url;
@property(nonatomic,strong) NSURL *url;
@end
