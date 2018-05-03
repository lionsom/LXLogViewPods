//
//  LXLogView.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLogView.h"

#import "LXLogPods.h"

@interface LXLogView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, strong) UIButton * showLXLogBtn;

@property (nonatomic, assign) BOOL isShow;

@end

@implementation LXLogView


-(instancetype)init {
    self = [super init];
    if (self) {
        // 初始化
        _isShow = YES;

        _dataSource = [[LXLogManager loadLXLog] mutableCopy];
        
        [self CreateView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCallBack:) name:n_LXLogChanged object:nil];
    }
    return self;
}


#pragma mark - 通知处理
- (void)notificationCallBack:(NSNotification *)notification{
    
    // NSDictionary * dict = [notification userInfo];
    
    // 数据更新
    _dataSource = [[LXLogManager loadLXLog] mutableCopy];
    
    [_tableView reloadData];
    
    //获取最后一行
    if (_dataSource.count > 0) {
        NSIndexPath *lastIndex = [NSIndexPath indexPathForRow:_dataSource.count-1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:lastIndex atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }

}


-(void)CreateView {

    self.frame = CGRectMake(0, 0, screenW, screenH);
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.15];
    
    _tableView = [[UITableView alloc]initWithFrame:self.frame style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    //代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.bounces = YES;  // 弹动
    //设置不显示分割线
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    //推测高度，必须有，可以随便写多少 否则：iOS11底部刷新错乱
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    _tableView.delaysContentTouches = NO;
    [self addSubview:_tableView];
    
    _showLXLogBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, StatusHeight, screenW/5, 30)];
    _showLXLogBtn.backgroundColor = [UIColor clearColor];
    [_showLXLogBtn setTitle:@"隐藏日志" forState:UIControlStateNormal];
    [_showLXLogBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _showLXLogBtn.layer.cornerRadius = 15;
    _showLXLogBtn.layer.borderWidth = 2.0f;
    _showLXLogBtn.layer.borderColor = [UIColor blueColor].CGColor;
    [_showLXLogBtn addTarget:self action:@selector(ShowLog) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_showLXLogBtn];
}

-(void)ShowLog {

    if (_isShow) {
        // 当前属于显示状态， 点击隐藏log
        _isShow = NO;
        [_showLXLogBtn setTitle:@"显示日志" forState:UIControlStateNormal];
        _tableView.hidden = YES;
        self.frame = CGRectMake(0, 0, screenW/5, 30 + StatusHeight);
    }else {
        // 当前属于隐藏状态， 点击显示log
        _isShow = YES;
        [_showLXLogBtn setTitle:@"隐藏日志" forState:UIControlStateNormal];
        _tableView.hidden = NO;
        self.frame = CGRectMake(0, 0, screenW, screenH);
    }
}


#pragma mark - tableView 数据源代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


/**
 加载Cell数据
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LXLogTableViewCell * cell = [LXLogTableViewCell cellWithTableView:tableView];\
    LXLogModel * model = _dataSource[indexPath.row];
    cell.model = model;
    //（这种是没有点击后的阴影效果)
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}


/**
 每一个cell的高度  暂时定高
 */
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LXLogModel * model = _dataSource[indexPath.row];
    
    CGFloat statusHeight =  [model.Content sizeWithLabelWidth:screenW/5*4 font:LXLogTableViewCell_DeFaultFont].height;
    
    
    return (25+25+10+10+20+statusHeight);
}

    
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
