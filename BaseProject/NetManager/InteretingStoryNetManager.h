//
//  InteretingStoryNetManager.h
//  BaseProject
//
//  Created by ios－31 on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "InteretingStoryModel.h"
@interface InteretingStoryNetManager : BaseNetManager
+(id)getPage:(NSInteger)page size:(NSInteger)size NSString:(NSString *)NSString completetionHandle:(void(^)(InteretingStoryModel * model,NSError * error))compleretionHandle;
@end
