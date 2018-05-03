//
//  LXLogManager.h
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const k_LXLogDefault = @"k_LXLogDefault";

static NSString * const n_LXLogChanged = @"n_LXLogChanged";


@interface LXLogManager : NSObject

/**
 保存当前log
 */
+(void)saveLXLog:(id)data;

+ (id)loadLXLog;

+ (void)clearLXLog;

@end
