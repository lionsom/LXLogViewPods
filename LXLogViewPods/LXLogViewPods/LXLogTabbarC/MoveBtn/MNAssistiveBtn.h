//
//  MNAssistiveBtn.h
//  LevitationButtonDemo
//
//  Created by 梁宇航 on 2018/3/8.
//  Copyright © 2018年 xmhccf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MNAssistiveTouchType)
{
    MNAssistiveTouchTypeNone = 0,         //没可以随便移动
    MNAssistiveTouchTypeVerticalScroll,   //只能垂直移动
    MNAssistiveTouchTypeHorizontalScroll, //只能水平移动
};

typedef NS_ENUM(NSInteger, LXLogShowPFSAndMemoryType)
{
    LXLogShowPFSAndMemoryTypeNone = 0,  // 两个都显示
    LXLogShowPFSAndMemoryTypeFPS,       // 只显示PFS
    LXLogShowPFSAndMemoryTypeMemory,    // 只显示Memory
};



typedef void(^BtnCallBackBlock)(void);



@interface MNAssistiveBtn : UIButton

///简单创建一个普通按钮
+ (instancetype)mn_touchWithFrame:(CGRect)frame;


@property (nonatomic,copy)BtnCallBackBlock btncallbackblock;

/**
 创建一个可拖动按钮

 @param type 滑动类型
 @param frame 按钮的frame
 @param title 按钮的标题内容
 @param titleColor 按钮的标题颜色
 @param titleFont 按钮的标题文字大小
 @param backgroundColor 按钮的背景色
 @param backgroundImage 按钮的背景图片
 @return 可拖动按钮
 */
+ (instancetype)mn_touchWithType:(MNAssistiveTouchType)type
                           Frame:(CGRect)frame
                           title:(NSString *)title
                      titleColor:(UIColor *)titleColor
                       titleFont:(UIFont *)titleFont
                 backgroundColor:(UIColor *)backgroundColor
                 backgroundImage:(UIImage *)backgroundImage;


+(instancetype)LX_initWithMoveType:(MNAssistiveTouchType)movetype
                          showType:(LXLogShowPFSAndMemoryType)showtype
                    widthAndHeight:(float)widthAndHeight
                   backgroundColor:(UIColor *)backgroundColor
                   backgroundImage:(UIImage *)backgroundImage;

@end
