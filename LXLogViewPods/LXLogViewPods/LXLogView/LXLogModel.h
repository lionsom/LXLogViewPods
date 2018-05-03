//
//  LXLogModel.h
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXLogModel : NSObject <NSCoding>

/**
 当前线程名
 */
@property (nonatomic, strong) NSString * CurrentThread;

/**
 当前时间
 */
@property (nonatomic, strong) NSString * CurrentTime;

/**
 log具体的文件名、函数名、行
 */
@property (nonatomic, strong) NSString * Details;

/**
 log具体的内容
 */
@property (nonatomic, strong) NSString * Content;

@end
