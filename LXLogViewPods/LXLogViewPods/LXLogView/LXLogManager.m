//
//  LXLogManager.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLogManager.h"

@implementation LXLogManager

+(void)saveLXLog:(id)data {
    
    NSMutableArray * beforeArr = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] valueForKey:k_LXLogDefault]];
    
    if (beforeArr.count > 0) {
        [beforeArr addObject:data];
    }else{
        beforeArr = [[NSMutableArray alloc]initWithCapacity:5];
        [beforeArr addObject:data];
    }
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSKeyedArchiver archivedDataWithRootObject:beforeArr] forKey:k_LXLogDefault];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    // 创建通知
    NSNotification *notification = [NSNotification notificationWithName:n_LXLogChanged object:nil];
    // 通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

+ (id)loadLXLog {
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] valueForKey:k_LXLogDefault]];
}

+ (void)clearLXLog {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:k_LXLogDefault];
    
    // 创建通知
    NSNotification *notification = [NSNotification notificationWithName:n_LXLogChanged object:nil];
    // 通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

@end
