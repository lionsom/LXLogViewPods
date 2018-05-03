//
//  LXLogTableViewCell.h
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LXLogModel.h"

@interface LXLogTableViewCell : UITableViewCell

/**
 cell的数据模型
 */
@property (nonatomic, strong) LXLogModel * model;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
