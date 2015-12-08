//
//  TuWanNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
#import "TuWanPicModel.h"



@interface TuWanNetManager : BaseNetManager


+ (id)getBeautifulGirlWithstart:(NSInteger)start kCompletionHandle;


+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle;

@end











