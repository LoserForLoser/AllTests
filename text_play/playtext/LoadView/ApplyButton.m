//
//  ApplyButton.m
//  playtext
//
//  Created by 宋朝阳 on 2017/5/11.
//  Copyright © 2017年 song. All rights reserved.
//

#import "ApplyButton.h"

@interface ApplyButton ()

@property (nonatomic ,assign) NSInteger secondsCountDown;//倒计时的总时间
@property (nonatomic ,strong) NSTimer *countDownTimer;//定时器

@end

@implementation ApplyButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType frame:(CGRect)frame titleColor:(UIColor *)titleColor titleFont:(CGFloat)font backgroundColor:(UIColor *)backgroundColor{
    
    ApplyButton *applyBtn = [super buttonWithType:buttonType];
    applyBtn.frame = frame;
    [applyBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    applyBtn.titleLabel.textColor = titleColor;
    applyBtn.titleLabel.font = [UIFont systemFontOfSize:font];
    applyBtn.backgroundColor = backgroundColor;
    [applyBtn addTarget:applyBtn action:@selector(startTime:) forControlEvents:UIControlEventTouchUpInside];
    
    return applyBtn;
}

- (void) startTime:(UIButton *)sender {
    
//    self.userInteractionEnabled = NO;
//    [self startTimeO:sender];   //反应及时性不如GCD
    
    [self startTimeT:sender];
    
    self.requestApply();
}

//使用NSTimer实现倒计时功能
- (void)startTimeO:(UIButton *)sender {
    //设置倒计时总时长
    self.secondsCountDown = 5;
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startTimeNSTimer) userInfo:nil repeats:YES];
}

- (void)startTimeNSTimer {
    self.secondsCountDown -- ;
    self.userInteractionEnabled = NO;
    [self setTitle:[NSString stringWithFormat:@"%ld秒后重新发送",(long)self.secondsCountDown] forState:UIControlStateNormal];
    if (self.secondsCountDown == 0) {
        [self.countDownTimer invalidate];
        self.userInteractionEnabled = YES;
        [self setTitle:@"重新发送验证码" forState:UIControlStateNormal];
    }
}

//使用GCD实现倒计时
-(void)startTimeT:(UIButton *)sender {
    __block int timeout = 5; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:@"重新发送验证码" forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            timeout--;
            
        }
    });
    dispatch_resume(_timer);
}

@end
