//
//  ApplyView.m
//  playtext
//
//  Created by 宋朝阳 on 2017/5/5.
//  Copyright © 2017年 song. All rights reserved.
//

#import "ApplyView.h"

@implementation ApplyView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.loadUserName = [[UITextField alloc] initWithFrame:CGRectMake(viewWidthFrame(30), viewHeightFrame(50), viewWidthFrame(SCREEN_WIDTH-60), viewHeightFrame(50))];
        self.loadUserName.delegate = self;
        self.loadUserName.placeholder = @"请输入账号";
        self.loadUserName.borderStyle = UITextBorderStyleLine;
        self.loadUserName.keyboardType = UIKeyboardTypeDefault;
        self.loadUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:self.loadUserName];
        
        self.passWord = [[UITextField alloc] initWithFrame:CGRectMake(viewWidthFrame(30), viewHeightFrame(150), viewWidthFrame(SCREEN_WIDTH-60), viewHeightFrame(50))];
        self.passWord.placeholder = @"请输入密码";
        self.passWord.delegate = self;
        self.passWord.secureTextEntry = YES;
        self.passWord.borderStyle = UITextBorderStyleLine;
        self.passWord.keyboardType = UIKeyboardTypeDefault;
        self.passWord.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:self.passWord];
        
        self.verificationCode = [[UITextField alloc] initWithFrame:CGRectMake(viewWidthFrame(30), viewHeightFrame(250), viewWidthFrame(SCREEN_WIDTH-300), viewHeightFrame(50))];
        self.verificationCode.placeholder = @"请输入验证码";
        self.verificationCode.delegate = self;
        self.verificationCode.borderStyle = UITextBorderStyleLine;
        self.verificationCode.keyboardType = UIKeyboardTypeNumberPad;
        self.verificationCode.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:self.self.verificationCode];
        
        self.applyBtn = [ApplyButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(viewWidthFrame(SCREEN_WIDTH-220), viewHeightFrame(250), viewHeightFrame(190), viewHeightFrame(50)) titleColor:[UIColor whiteColor] titleFont:14 backgroundColor:[UIColor colorWithRed:0 green:168/255.0 blue:1 alpha:1]];
        [self addSubview:self.applyBtn];
        [self.applyBtn setRequestApply:^{
            
        }];
        
        self.loadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loadButton.frame = CGRectMake(viewWidthFrame(150), viewHeightFrame(350), viewWidthFrame(450), viewWidthFrame(100));
        self.loadButton.backgroundColor = [UIColor colorWithRed:0 green:168/255.0 blue:1 alpha:1];
        [self.loadButton setTitle:@"登  录" forState:UIControlStateNormal];
        self.loadButton.titleLabel.textColor = [UIColor whiteColor];
        self.loadButton.layer.cornerRadius = viewWidthFrame(50);
        self.loadButton.layer.borderWidth = 3.0f;
        self.loadButton.layer.borderColor = [UIColor blackColor].CGColor;
        [self addSubview:self.loadButton];
    }
    return self;
}

//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.frame.size.height - 280.0);//键盘高度
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.frame = CGRectMake(0.0f, viewHeightFrame(700)-offset, self.frame.size.width, self.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.frame =CGRectMake(0, viewHeightFrame(700), SCREEN_WIDTH, SCREEN_HEIGHT - viewHeightFrame(700));
    return YES;
}

// 重写set方法 懒加载
//- (UITextField *)loadUserName {
//    if (!self.loadUserName) {
//        self.loadUserName = [[UITextField alloc] initWithFrame:CGRectMake(viewWidthFrame(30), viewHeightFrame(50), viewWidthFrame(SCREEN_WIDTH-60), viewHeightFrame(50))];
//        self.loadUserName.delegate = self;
//    }
//    return self.loadUserName;
//}

@end
