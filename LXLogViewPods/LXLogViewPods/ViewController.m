//
//  ViewController.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"

#import "LXLog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    float W = [UIScreen mainScreen].bounds.size.width/2;
    float H = 50;
    [self createBtn:CGRectMake(0, H, W, H) :1 :@"save"];
    
    [self createBtn:CGRectMake(W, H, W, H) :2 :@"load"];
    
    [self createBtn:CGRectMake(0, H*2, W, H) :3 :@"clear"];

    [self createBtn:CGRectMake(W, H*2, W, H) :4 :@"Tabbar"];


    NSString * b = @"sdfdsadsaf";
    LXLog(@"%@",b);
    
    NSArray *a = @[@1,@2,@3,@4,@5];
    LXLog(@"DD == %@",a);

    LXLog(@"A = %@",@"sdafasdfaafasdfasddsaffasdfdssadfasdasdfadsdfasdasfafasdfasddsaffasdfdssadfasdasdfadsdfasdasffadsdfasdasf");

    NSDictionary * dict = @{@"A":@"123",
                            @"B":@"456",
                            @"C":@"678",
                            @"D":@"999"
                            };
    LXLog(@"NSDictionary = %@",dict);
    
    NSDate * date = [NSDate date];
    LXLog(@"%@",date);
    
    
    // 第三种：最常用
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LXLog(@"NSDictionary = %@",dict);
    });//定制了延时执行的任务，不会阻塞线程，效率较高（推荐使用）
    
}


-(void)btnCallBack:(id)sender {
    UIButton * btn = (UIButton *)sender;
    
    if (btn.tag == 1) {
        //1.AFNetworking
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
        NSURL *URL = [NSURL URLWithString:@"https://httpbin.org/get"];
        NSURLRequest *request = [NSURLRequest requestWithURL:URL];
        NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            if (error) {
                LXLog(@"%@",error.localizedDescription);
            } else {
                LXLog(@"%@",response);
                LXLog(@"%@",responseObject);
            }
        }];
        [dataTask resume];
    }
    if (btn.tag == 2) {
        if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {
            LXLog(@"main Thread");
        }
    }
    if (btn.tag == 3) {

        
    }
    if (btn.tag == 4) {
        
        LXLogTabBarController * tabbarC = [[LXLogTabBarController alloc]init];
        
        [self presentViewController:tabbarC animated:YES completion:nil];
    }
    
}

#pragma mark -- CraeteView
-(void)createBtn:(CGRect)frame :(NSInteger)tag :(NSString *)title {
    UIButton * btn = [[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor = [UIColor greenColor];
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnCallBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


/**
 获取当前时间点的具体时间 此处时区为系统时区
 
 @return @"2011-01-26 17:40:50"
 */
- (NSString *)getCurrentTime {
    //1.获取时间戳
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timeSp = [date timeIntervalSince1970];
    
    //2.格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];   // 手机系统时区，不可改变
    
    //3.毫秒值转化为秒
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeSp];
    
    //4.直接转换
    NSString *dateString = [formatter stringFromDate:confromTimesp];
    
    return dateString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
