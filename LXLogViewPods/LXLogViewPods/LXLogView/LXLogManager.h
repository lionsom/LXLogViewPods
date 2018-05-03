//
//  LXLogManager.h
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXLogManager : NSObject

/**
 保存当前log
 */
+(void)saveLXLog:(id)data;

+ (id)loadLXLog;

+ (void)clearLXLog;

@end
