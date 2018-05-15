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
    [self createBtn:CGRectMake(0, 50+H, W, H) :1 :@" Add Log by HTTP"];
    
    [self createBtn:CGRectMake(0, 100+H*2, W, H) :2 :@" Add Log in Main Thread"];
    
    [self createBtn:CGRectMake(0, 150+H*3, W, H) :3 :@" Add Log in Sub Thread"];

    [self createBtn:CGRectMake(0, 200+H*4, W, H) :4 :@"Show LXLog"];
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
            LXLog(@"<<%@>>",@"main Thread");
        }
    }
    if (btn.tag == 3) {
        //创建一个并发队列
        dispatch_queue_t queue = dispatch_queue_create("myueue", DISPATCH_QUEUE_CONCURRENT);
        
        //创建异步任务
        dispatch_async(queue, ^{
            for (int i = 0; i < 3; i++) {
                LXLog(@"--1--%@",[NSThread currentThread]);
            }
        });
    }
    if (btn.tag == 4) {
        
        LXLogTabBarController * tabbarC = [[LXLogTabBarController alloc]init];
        
        [self presentViewController:tabbarC animated:YES completion:nil];
    }
    
}

#pragma mark -- CraeteView
-(void)createBtn:(CGRect)frame :(NSInteger)tag :(NSString *)title {
    UIButton * btn = [[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor = [UIColor blackColor];
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:30];
    [btn addTarget:self action:@selector(btnCallBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
