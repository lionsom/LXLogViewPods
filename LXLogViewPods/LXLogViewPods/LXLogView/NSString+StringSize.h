//
//  NSString+StringSize.h
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringSize)

/**
 *  简单计算textsize
 *
 *  @param width 传入特定的宽度
 *  @param font  字体
 */
- (CGSize)sizeWithLabelWidth:(CGFloat)width font:(UIFont *)font;

@end
