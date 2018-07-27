//
//  GCDViewController.m
//  playtext
//
//  Created by 宋朝阳 on 2017/6/27.
//  Copyright © 2017年 song. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
//    dispatch_queue_t queue1 = dispatch_queue_create("queue test 串行", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue2 = dispatch_queue_create("queue test 并行", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(queue1, <#^(void)block#>)
//    dispatch_group_async(queue2, <#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)//线程组
//    dispatch_get_main_queue()主线程队列
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
