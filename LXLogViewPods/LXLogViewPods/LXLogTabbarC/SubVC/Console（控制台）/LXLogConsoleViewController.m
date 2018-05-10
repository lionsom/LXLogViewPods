//
//  LXLogConsoleViewController.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/9.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLogConsoleViewController.h"
// view
#import "LXLogConsoleTVCell.h"

// Category
#import "NSString+StringSize.h"

#import "LXLogGlobalConst.h"
#import "LXLogStoreManager.h"
#import "LXLogMarco.h"



@interface LXLogConsoleViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation LXLogConsoleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // back btn
    UIBarButtonItem *backitem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(closeCallBack)];
    [self.navigationItem setLeftBarButtonItem:backitem];
    
    // 创建页面
    [self CreateView];
    
    // 初始化参数
    _dataSource = [[LXLogStoreManager shared].defaultLogArr mutableCopy];
    
    
    
    // 监听通知 刷新页面
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresheTableView) name:KNotification_RefreshLXLog object:nil];
    
    
//    UIView * a = [[UIView alloc]init];
//    a.backgroundColor = [UIColor redColor];
//    [self.view addSubview:a];
//
//    [a mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.top.equalTo(self.view).offset(10);
//        make.right.and.bottom.equalTo(self.view).offset(-10);
//    }];
    
}


-(void)CreateView {
    
    NSLog(@"screen H = %f", screenH);
    
    NSLog(@"self.view H = %f",self.view.frame.size.height);
    
    // (statusbar)
    CGRect rectOfStatusbar = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"statusbar height: %f", rectOfStatusbar.size.height);   // 高度
    float statusH = rectOfStatusbar.size.height;
    
    // navigationbar height
    CGRect rectOfNavigationbar = self.navigationController.navigationBar.frame;
    NSLog(@"navigationbar height: %f", rectOfNavigationbar.size.height);   // 高度
    float naviBarH = rectOfNavigationbar.size.height;
    
    // tabbar height
    NSLog(@"tabBar height: %f", self.tabBarController.tabBar.frame.size.height);   // 高度
    float tabbarH = self.tabBarController.tabBar.frame.size.height;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenH - statusH - naviBarH - tabbarH) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor lightGrayColor];
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
    [self.view addSubview:_tableView];
    
    [self refresheTableView];
}

-(void)closeCallBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/**
 通知回调，刷新页面
 */
-(void)refresheTableView {
    // 数据更新
    _dataSource = [[LXLogStoreManager shared].defaultLogArr mutableCopy];
    
    [_tableView reloadData];
    
    //获取最后一行
    if (_dataSource.count > 0) {
        NSIndexPath *lastIndex = [NSIndexPath indexPathForRow:_dataSource.count-1 inSection:0];
        [self.tableView scrollToRowAtIndexPath:lastIndex atScrollPosition:UITableViewScrollPositionBottom animated:YES];
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
    LXLogConsoleTVCell * cell = [LXLogConsoleTVCell cellWithTableView:tableView];
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
    
    CGFloat statusHeight =  [model.Content sizeWithLabelWidth:screenW/5*4 font:LXLogConsoleTableViewCell_DeFaultFont].height;
    
    return (25+25+10+10+20+statusHeight);
}




-(void)dealloc {
    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
