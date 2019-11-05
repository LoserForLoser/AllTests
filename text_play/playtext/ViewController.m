//
//  ViewController.m
//  playtext
//
//  Created by 宋朝阳 on 2017/3/31.
//  Copyright © 2017年 song. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"
#import "ApplyView.h"
#import "BackController.h"
#import "ControlTest.h"
#import "FirstView.h"
#import "ScrollView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) ApplyView *applyView;
@property (strong, nonatomic) ScrollView *scroll;

@property (strong, nonatomic) UITapGestureRecognizer *tapGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"-----");
    __weak ViewController *weakSelf = self;

    NSArray *arr1 = [[NSArray alloc] initWithObjects:@"IMG_1",@"IMG_2",@"IMG_3", nil];
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithArray:arr1];

    self.scroll = [[ScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, viewHeightFrame(700))];
    [self.scroll setImageViewAry:mutableArr];
    [self.view addSubview:self.scroll];

    [self.scroll tapScroll:^{
        [weakSelf tapScroll];
    }];

    self.applyView = [[ApplyView alloc] initWithFrame:CGRectMake(0, viewHeightFrame(700), SCREEN_WIDTH, SCREEN_HEIGHT - viewHeightFrame(700))];
    self.applyView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.applyView setViewController:self];
    [self.view addSubview:self.applyView];
    [self.applyView.loadButton addTarget:self action:@selector(jumpView) forControlEvents:UIControlEventTouchUpInside];

    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToPackUpkeyboard:)];
    [self.view addGestureRecognizer:self.tapGesture];
}

- (void) jumpView {
//    if (self.applyView.loadUserName.text.length == 0 ) {
//        NSLog(@"账号不能为空！");
//    } else if (self.applyView.passWord.text.length == 0) {
//        NSLog(@"密码不能为空！");
//    } else if (self.applyView.verificationCode.text.length == 0) {
//        NSLog(@"验证码不能为空！");
//    } else {
//        NSLog(@"NetWorking:~~~");
//        NSString *errorNum;
//        if ([errorNum isEqualToString:@"0"]) {
            AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
            FirstView *firstView = [[FirstView alloc] init];
            ControlTest *testControl = [[ControlTest alloc] init];
            BackController *backControl = [[BackController alloc] init];
    
            UITabBarController *tabbar = [[UITabBarController alloc] init];
            [firstView setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]]];
            [testControl setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"逻辑测试" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]]];
            [backControl setTabBarItem:[[UITabBarItem alloc] initWithTitle:@"返回🔙" image:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]]];
            tabbar.viewControllers = @[firstView, testControl, backControl];
    
            appDelegate.rootNav = [[UINavigationController alloc] initWithRootViewController:tabbar];
            appDelegate.window.rootViewController = appDelegate.rootNav;
//        } else if ([errorNum isEqualToString:@"1"]) {
//            NSLog(@"账号错误！");
//        } else if ([errorNum isEqualToString:@"2"]) {
//            NSLog(@"密码错误！");
//        } else if ([errorNum isEqualToString:@"3"]) {
//            NSLog(@"验证码错误！");
//        }
//    }
}

//输入框编辑完成以后，将视图恢复到原始状态
- (void)tapToPackUpkeyboard:(UITapGestureRecognizer *)tapGestureRecognizer {
    [self.applyView endEditing:YES];
    self.applyView.frame =CGRectMake(0, viewHeightFrame(700), SCREEN_WIDTH, SCREEN_HEIGHT - viewHeightFrame(700));
}

//点击scoroll
- (void) tapScroll {
    NSLog(@"点击Scroll第%ld张",self.scroll.currentPage + 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
