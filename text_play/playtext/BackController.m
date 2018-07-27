//
//  BackController.m
//  playtext
//
//  Created by 宋朝阳 on 2017/5/21.
//  Copyright © 2017年 song. All rights reserved.
//

#import "BackController.h"

#import "AppDelegate.h"
#import "ViewController.h"

@interface BackController ()<UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIImageView *headPortraitImage;

@property (strong, nonatomic) UITapGestureRecognizer *headPortraitTapGesture;

@property (strong, nonatomic) UIActionSheet *actionSheet;

@property (strong ,nonatomic) UIButton *logOutBtn;

@end

@implementation BackController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.headPortraitImage = [[UIImageView alloc] init];
    [self.headPortraitImage setFrame:CGRectMake(SCREEN_View_Width_Frame(42.4), SCREEN_View_Height_Frame(32.4), SCREEN_View_Width_Frame(200), SCREEN_View_Width_Frame(200))];
    // 通过Layer将位于Layer之下的盖住
    [self.headPortraitImage.layer setMasksToBounds:YES];
    [self.headPortraitImage.layer setCornerRadius:SCREEN_View_Width_Frame(100)];
    [self.headPortraitImage setImage:[UIImage imageNamed:@"touxiang"]];
    [self.headPortraitImage setUserInteractionEnabled:YES];
    self.headPortraitImage.center = self.view.center;
    [self.view addSubview:self.headPortraitImage];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callActionSheetFunc)];
    [self.headPortraitImage addGestureRecognizer:tapGesture];
    
    // 退出登录
    self.logOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.logOutBtn setFrame:CGRectMake(viewWidthFrame(80), SCREEN_HEIGHT - viewHeightFrame(180), SCREEN_WIDTH - viewWidthFrame(160), viewWidthFrame(60))];
    [self.logOutBtn setBackgroundColor:[UIColor redColor]];
    [self.logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.logOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.logOutBtn.layer.cornerRadius = viewWidthFrame(20);
    [self.logOutBtn addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.logOutBtn];
}

/**
 @ 调用ActionSheet
 */
- (void)callActionSheetFunc{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
    }else{
        self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"从相册选择", nil];
    }
    
    self.actionSheet.tag = 1000;
    [self.actionSheet showInView:self.view];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 1000) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    //来源:相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 1:
                    //来源:相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                case 2:
                    return;
            }
        }
        else {
            if (buttonIndex == 2) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{
            
        }];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    self.headPortraitImage.image = image;
}

- (void)logOut {
    AppDelegate *appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    ViewController *viewController = [[ViewController alloc] init];
    appdelegate.window.rootViewController = viewController;
}

@end
