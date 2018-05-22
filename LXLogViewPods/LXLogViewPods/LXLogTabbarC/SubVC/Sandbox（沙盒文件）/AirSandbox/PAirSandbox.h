//
//  PAirSandbox.h
//  AirSandboxDemo
//
//  Created by gao feng on 2017/7/18.
//  Copyright © 2017年 music4kid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PAirSandbox : NSObject

+ (instancetype)sharedInstance;

- (void)enableSwipe;
- (void)showSandboxBrowser;


/**
 我的单独
 */
- (UIViewController *)getASViewController;

@end
