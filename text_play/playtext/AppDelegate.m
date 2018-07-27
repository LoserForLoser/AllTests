//
//  AppDelegate.m
//  playtext
//
//  Created by 宋朝阳 on 2017/3/31.
//  Copyright © 2017年 song. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ControlTest.h"

@interface AppDelegate () <EMClientDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *rootVC = [[ViewController alloc] init];
    self.window.rootViewController = rootVC;
    
    ControlTest *rootCT = [[ControlTest alloc] init];
    self.rootNav = [[UINavigationController alloc] initWithRootViewController:rootCT];
//    self.window.rootViewController = self.rootNav;
    
    [self.window makeKeyWindow];
    
    // 环信
    EMOptions *options = [EMOptions optionsWithAppkey:@"1153180131178639#playtest"];
//    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    
    // 注册（有自己后台可忽略）
    EMError *error = [[EMClient sharedClient] registerWithUsername:@"8001" password:@"111111"];
    if (error==nil) {
        NSLog(@"注册成功");
    }
    
    // 登陆（用户ID密码）
    BOOL isAutoLogin = [EMClient sharedClient].options.isAutoLogin;
    if (!isAutoLogin) {
        error = [[EMClient sharedClient] loginWithUsername:@"8001" password:@"111111"];
        if (!error) {
            NSLog(@"登录成功");
            // 自动登录
            [[EMClient sharedClient].options setIsAutoLogin:YES];
        }
    }
    
    return YES;
}

/*!
 *  自动登录返回结果
 *
 *  @param error 错误信息
 */
- (void)autoLoginDidCompleteWithError:(EMError *)error {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [[EMClient sharedClient] applicationWillEnterForeground:application]; 
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
