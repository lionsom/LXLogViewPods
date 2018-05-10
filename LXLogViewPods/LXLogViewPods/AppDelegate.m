//
//  AppDelegate.m
//  LXLogViewPods
//
//  Created by linxiang on 2018/5/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

#import "LXLog.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //------ 设置主页面 ------
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.window.backgroundColor = [UIColor orangeColor];
    ViewController * vc = [ViewController new];
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = baseNav;
    [self.window makeKeyAndVisible];

    
//    FPSLabel * label = [[FPSLabel alloc]initWithFrame:CGRectMake(0, 300, 100, 50)];
//    label.backgroundColor = [UIColor redColor];
//    [self.window addSubview:label];
//    
//    UIButton * touchbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 400, 100, 100)];
//    touchbtn.backgroundColor = [UIColor blackColor];
//    [touchbtn addTarget:self action:@selector(CallBack) forControlEvents:UIControlEventTouchUpInside];
//    [self.window addSubview:touchbtn];
    
    LXLogConfig * con = [LXLogConfig shared];
    con.logMaxCount = 10;
    
    
    return YES;
}

-(void)CallBack
{
    LXLogTabBarController * tabbarC = [[LXLogTabBarController alloc]init];
    
    [self.window.rootViewController presentViewController:tabbarC animated:YES completion:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
