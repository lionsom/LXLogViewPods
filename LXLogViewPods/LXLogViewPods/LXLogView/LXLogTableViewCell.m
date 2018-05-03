//
//  LXLogTableViewCell.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLogTableViewCell.h"

#define screenW  [UIScreen mainScreen].bounds.size.width
#define screenH  [UIScreen mainScreen].bounds.size.height

static NSString * reuseIdentifier = @"LXLogTableViewCell_ID";

@interface LXLogTableViewCell () {
    UILabel * timeLabel;
    UILabel * threadLabel;
    UILabel * detailLabel;
    UILabel * contentLabel;
    UILabel * fengexianLabel;
}
@end

@implementation LXLogTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    LXLogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (cell == nil) {
        cell = [[LXLogTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //创建UI
        [self CreateUI];
    }
    return self;
}

/**
 创建UI见面
 */
-(void)CreateUI {
    
    self.backgroundColor = [UIColor clearColor];
    
    //适配
    UIFont * LXLogTableViewCell_DeFaultFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        LXLogTableViewCell_DeFaultFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:40];
    }

    // timelabel 设置
    timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, screenW/5, 50)];
    timeLabel.text = @"20154523652";
    timeLabel.font = LXLogTableViewCell_DeFaultFont;
    timeLabel.adjustsFontSizeToFitWidth = YES;
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:timeLabel];
    
    threadLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenW/5, 0, screenW/5 * 4, 50)];
    threadLabel.text = @"threadLabel";
    threadLabel.font = LXLogTableViewCell_DeFaultFont;
    threadLabel.adjustsFontSizeToFitWidth = YES;
    threadLabel.textColor = [UIColor whiteColor];
    threadLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:threadLabel];
    
    detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(screenW/5, 50, screenW/5* 4, 50)];
    detailLabel.text = @"detailLabel";
    detailLabel.font = LXLogTableViewCell_DeFaultFont;
    detailLabel.adjustsFontSizeToFitWidth = YES;    // 自适应缩小
    detailLabel.textColor = [UIColor whiteColor];
    detailLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:detailLabel];
    
    contentLabel = [[UILabel alloc]init];
    contentLabel.text = @"contentLabel";
    contentLabel.font = LXLogTableViewCell_DeFaultFont;
    contentLabel.numberOfLines = 0;   //多行
    contentLabel.textColor = [UIColor whiteColor];
    contentLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:contentLabel];
    
    NSLog(@"AAAA = %f",self.frame.size.height - 20);
    
    fengexianLabel = [[UILabel alloc]init];
    fengexianLabel.text = @"==============================================================================================================";
    fengexianLabel.lineBreakMode = NSLineBreakByWordWrapping;
    fengexianLabel.backgroundColor = [UIColor clearColor];
    fengexianLabel.textColor = [UIColor whiteColor];
    [self addSubview:fengexianLabel];
    
}

-(void)setModel:(LXLogModel *)model {
    timeLabel.text = model.CurrentTime;
    
    threadLabel.text = model.CurrentThread;
    
    detailLabel.text = model.Details;
    
    contentLabel.text = model.Content;
}

//  自绘分割线 重写即可
- (void)drawRect:(CGRect)rect {
    NSLog(@"BVBBBB");
    fengexianLabel.frame = CGRectMake(0, rect.size.height - 20, rect.size.width, 20);
    
    contentLabel.frame = CGRectMake(screenW/5, 100, screenW/5* 4, rect.size.height - 50-50-20);
}

@end
