//
//  ApplyView.h
//  playtext
//
//  Created by 宋朝阳 on 2017/5/5.
//  Copyright © 2017年 song. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "ApplyButton.h"

@interface ApplyView : UIView <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *loadUserName;
@property (strong, nonatomic) UITextField *passWord;
@property (strong, nonatomic) UITextField *verificationCode;
@property (strong, nonatomic) UIButton *applyButton;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) ApplyButton *applyBtn;
@property (strong, nonatomic) UIButton *loadButton;

@end
