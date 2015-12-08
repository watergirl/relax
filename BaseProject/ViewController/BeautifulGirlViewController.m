//
//  BeautifulGirlViewController.m
//  BaseProject
//
//  Created by ios－32 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BeautifulGirlViewController.h"
#import "TuWanViewModel.h"
#import "TuWanPicViewModel.h"
#import "iCarousel.h"

@interface BeautifulGirlViewController ()<iCarouselDelegate,iCarouselDataSource,MWPhotoBrowserDelegate>
@property (nonatomic,strong)TuWanViewModel * tuwanVM;
@property (nonatomic,strong)TuWanPicViewModel * picVM;
@property (nonatomic,strong)UIButton * phtotBackBtn;
@property (nonatomic,strong)NSMutableArray * beautifulAID;
@property (nonatomic,strong)FBShimmeringView * SV;
@property (nonatomic)NSInteger p;
@property (nonatomic,strong)iCarousel *ic;
@property (nonatomic,strong)UIImageView * yaoView;
@end

@implementation BeautifulGirlViewController

+ (BeautifulGirlViewController *)standardBeautiVC
{
    static BeautifulGirlViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      
        vc = [[BeautifulGirlViewController alloc]init];
    });
    return vc;
}

-(NSMutableArray *)beautifulAID
{
    if (!_beautifulAID) {
        _beautifulAID = [NSMutableArray new];
    }
    return _beautifulAID;
}

-(iCarousel *)ic
{
    if (!_ic) {
        _ic = [iCarousel new];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.type = 1;
        _ic.autoscroll = 1;
        _ic.scrollSpeed =0.5;
        
        
    }
    return _ic;
}

-(TuWanViewModel *)tuwanVM
{
    if (!_tuwanVM) {
        _tuwanVM = [TuWanViewModel new];
    }
    return _tuwanVM;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor blackColor];

    self.p = -1;
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    UILabel *label = [UILabel new];
    label.text = @"美图摇一摇";
    label.font = [UIFont boldSystemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    UIImageView *imgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MoreShake"]];
    self.yaoView = imgview;
    
   
    
//    建立闪光区域，所有在闪光区域内的控件都会闪
    FBShimmeringView *sv = [FBShimmeringView new];
    self.SV = sv;
    [self.view addSubview:sv];
    [self.view addSubview:imgview];
    
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
    [imgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.centerX.mas_equalTo(sv.mas_centerX);
        make.bottom.mas_equalTo(sv.mas_top).mas_equalTo(-5);
    }];
    
    sv.contentView = label;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    label.textColor = [UIColor yellowColor];
    sv.shimmering = YES;
    
    
    [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
        if (!error) {
        for (int i=0; i<self.tuwanVM.rowNumber; i++) {
            if ([self.tuwanVM isPicInListForRow:i]) {
                [self.beautifulAID addObject:[self.tuwanVM aidInListForRow:i]];
            }
            NSLog(@"self.beautifulAID.number:%ld",self.beautifulAID.count);
            
        }
        }


    }];
    
    
    
}

//摇一摇功能
-(void)motionBegan{
    NSLog(@"!!!self.beautifulAID.number:%ld",self.beautifulAID.count);
   
    //检查是否有网
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (!appdelegate.onLine) {
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        progressHUD.mode = MBProgressHUDAnimationFade;
        progressHUD.labelText = @"请检查您的网络";
        [progressHUD hide:YES afterDelay:3];
        return;
    }
          MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
          progressHUD.labelText = @"loading...";

        [self.SV setHidden:YES];
    [self.yaoView setHidden:YES];
       
 
  //如果图片aid数组为空，则加载更多
        if (self.beautifulAID.count==0){
            [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
                if (!error) {
                for (int i=0; i<self.tuwanVM.rowNumber; i++) {
                    if ([self.tuwanVM isPicInListForRow:i]) {
                        [self.beautifulAID addObject:[self.tuwanVM aidInListForRow:i]];
                    }
                    NSLog(@"self.beautifulAID.number:%ld",self.beautifulAID.count);
                }
                    if (self.beautifulAID.count>0) {
                        self.p = 0;
                        self.picVM = [[TuWanPicViewModel alloc]initWithAid:self.beautifulAID[self.p]];
                        [self.picVM getDataFromNetCompleteHandle:^(NSError *error) {
                            if (!error) {
                                [self.ic reloadData];
                            }
                            
                        }];
                        return ;
                    }
                    else
                    {
                        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        progressHUD.mode = MBProgressHUDModeText;
                        progressHUD.labelText = @"用力!!!";
                        [progressHUD hide:YES afterDelay:2];
                        return ;
                    }
                    
                }
                else
                {
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    return ;
                }
                
            }];
        }
        
        //如果当前指针已指向最后一组图片aid，则加载更多
      
        if (self.p >= (NSInteger)(self.beautifulAID.count-1)) {
            [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
                if (!error) {
                    for (int i=0; i<self.tuwanVM.rowNumber; i++) {
                        if ([self.tuwanVM isPicInListForRow:i]) {
                            [self.beautifulAID addObject:[self.tuwanVM aidInListForRow:i]];
                        }
                        NSLog(@"self.beautifulAID.number:%ld",self.beautifulAID.count);
                    }
                    if (self.p >= (NSInteger)(self.beautifulAID.count-1)) {
                        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                        progressHUD.mode = MBProgressHUDModeText;
                        progressHUD.labelText = @"用力!!!";
                        [progressHUD hide:YES afterDelay:2];
                        return ;
                    }
                    else
                    {
                        self.p ++;
                        self.picVM = [[TuWanPicViewModel alloc]initWithAid:self.beautifulAID[self.p]];
                        [self.picVM getDataFromNetCompleteHandle:^(NSError *error) {
                            if (!error) {
                                [self.ic reloadData];
                            };
                        }];
                        return;

                    }
                    
                }
                else
                {
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                    return;
                }
            }];
        }else
        {
            self.p++;
            self.picVM = [[TuWanPicViewModel alloc]initWithAid:self.beautifulAID[self.p]];
            [self.picVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (!error) {
                    [self.ic reloadData];
                };
            }];
        }
        
    
}



#pragma mark - iCarousel
//添加循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES; //type0的默认循环滚动模式是否
    }
    // 修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    // 取消后背的显示
    if (option == iCarouselOptionShowBackfaces) {
        return NO;
    }
    
    return value;
}


//问：有多少个Cell
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.picVM.rowNumber;
    
}
//问：每个Cell什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        //这里x.y 是无作用的, 图片的宽高 300*500
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW/3*2, kWindowH/3*2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
     

        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];


    [imageView sd_setImageWithURL:[self.picVM picURLForRow:index] placeholderImage:[UIImage imageNamed:@"adwo_progress"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        
    }];

    NSLog(@"%ld",self.p);
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"选择了第%ld张", index);
    MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc] initWithDelegate:self];

    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:photoB];

    [self presentViewController:navi animated:YES completion:nil];
    
    [photoB setCurrentPhotoIndex:index];
    
}

#pragma mark - MWPhotoBrowserDelegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.picVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.picVM picURLForRow:index]];
    return photo;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
