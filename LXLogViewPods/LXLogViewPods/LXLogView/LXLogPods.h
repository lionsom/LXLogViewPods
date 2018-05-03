//
//  LXLogPods.h
//  LXLogViewPods
//
//  Created by 林祥 on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#ifndef LXLogPods_h
#define LXLogPods_h

#import <UIKit/UIKit.h>

// 屏幕宽度
#define screenW  [UIScreen mainScreen].bounds.size.width
#define screenH  [UIScreen mainScreen].bounds.size.height

// 状态栏高度
#define StatusHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?44:20) // 适配iPhone x 状态栏

#define ISIPAD UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad


#define LXLogTableViewCell_DeFaultFont [UIFont fontWithName:@"Arial" size:20]

// 通知name
static NSString * const n_LXLogChanged = @"n_LXLogChanged";

#import "LXLogTableViewCell.h"
#import "LXLogManager.h"
#import "NSString+StringSize.h"

#endif /* LXLogPods_h */
