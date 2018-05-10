//
//  NSString+LXLogDeviceInfo.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/10.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "NSString+LXLogDeviceInfo.h"

#import <UIKit/UIKit.h>

@implementation NSString (LXLogDeviceInfo)

// 屏幕尺寸
+(NSString *)getDeviceScreenSize {
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    
    return [NSString stringWithFormat:@"%.0f * %.0f",w,h];
}

@end
