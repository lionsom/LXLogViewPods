//
//  LXLogHelper.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/9.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLogHelper.h"

#import "LXLogModel.h"

#import "LXLogCompat.h"
#import "LXLogGlobalConst.h"

#import "LXLogStoreManager.h"

@implementation LXLogHelper


+(void)handleLog:(NSString *)file :(NSString *)function :(NSString *)line :(NSString *)format, ...{
    
    NSString * fileinfo = [NSString stringWithFormat:@"[%@] [%@] [Line:%@]",file,function,line];
    
    // 此段代码参考自CocoaLumberjack框架
    va_list args;
    
    if (format) {
        va_start(args, format);
        
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        
        LXLogModel * model = [[LXLogModel alloc]initWithFileInfo:fileinfo Content:message];
        // 添加到store中
        [[LXLogStoreManager shared] addLXLog:model];
        
        va_end(args);
    }
    
    // 主线程发送通知，刷新界面
    dispatch_main_async_safe(^{
        // 创建通知
        NSNotification *notification = [NSNotification notificationWithName:KNotification_RefreshLXLog object:nil userInfo:nil];
        // 通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    });
}






@end
