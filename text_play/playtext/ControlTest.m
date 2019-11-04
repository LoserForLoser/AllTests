//
//  ControlTest.m
//  playtext
//
//  Created by 宋朝阳 on 2017/5/11.
//  Copyright © 2017年 song. All rights reserved.
//

#import "ControlTest.h"
#import "GCDViewController.h"
#import "ImageGIFController.h"

#import <Masonry/Masonry.h>

@interface ControlTest () <NSCopying>

@property (nonatomic, strong) NSMutableArray *basicNumberArr;
@property (nonatomic, strong) NSMutableArray *arrElementOne;
@property (nonatomic, strong) NSMutableArray *arrElementTwo;
@property (nonatomic, strong) NSMutableArray *arrElementFour;
@property (nonatomic, strong) NSMutableArray *arrElementEight;
@property (nonatomic, strong) NSMutableArray *arrElementSixteen;
@property (nonatomic, strong) NSMutableArray *arrElementThirtyTwo;
@property (nonatomic, strong) NSMutableArray *arrElementSixtyFour;
@property (nonatomic, strong) NSMutableArray *moreHigherNumber;
@property (nonatomic, weak)   NSTimer *addTimer;
@property (nonatomic, assign) int timeNum;

@property (nonatomic, strong) UIButton *GCDBtn;

@end

@implementation ControlTest

@synthesize GCDBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *aabcad = [UIButton buttonWithType:UIButtonTypeCustom];
    [aabcad setFrame:CGRectMake(viewWidthFrame(80), 64 + viewWidthFrame(20), viewWidthFrame(590), viewWidthFrame(60))];
    [aabcad.layer setCornerRadius:viewWidthFrame(20)];
    [aabcad setTitle:@"aabcad" forState:UIControlStateNormal];
    [aabcad setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [aabcad setBackgroundColor:[UIColor colorWithRed:135.0/255.0 green:206.0/255.0 blue:235.0/255.0 alpha:1]];
    [aabcad addTarget:self action:@selector(aabcad) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aabcad];
    
    UIButton *onePLusOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [onePLusOne setFrame:CGRectMake(viewWidthFrame(80), 64 + viewWidthFrame(100), viewWidthFrame(590), viewWidthFrame(60))];
    [onePLusOne.layer setCornerRadius:viewWidthFrame(20)];
    [onePLusOne setTitle:@"指数加" forState:UIControlStateNormal];
    [onePLusOne setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [onePLusOne setBackgroundColor:[UIColor colorWithRed:0 green:191.0/255.0 blue:1 alpha:1]];
    [onePLusOne addTarget:self action:@selector(plusSame) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:onePLusOne];
    
    GCDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [GCDBtn setFrame:CGRectMake(viewWidthFrame(80), 64 + viewHeightFrame(180), viewWidthFrame(590), viewHeightFrame(60))];
    [GCDBtn.layer setCornerRadius:viewHeightFrame(10)];
    [GCDBtn setTitle:@"GCD" forState:UIControlStateNormal];
    [GCDBtn setBackgroundColor:[UIColor colorWithRed:51/255.0 green:143/255.0 blue:252/255.0 alpha:1]];
    [GCDBtn addTarget:self action:@selector(jumpToGCD) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:GCDBtn];
    
    UIButton *imageGIF = [UIButton buttonWithType:UIButtonTypeCustom];
    [imageGIF setFrame:CGRectMake(viewWidthFrame(80), 64 + viewWidthFrame(250), viewWidthFrame(590), viewWidthFrame(60))];
    [imageGIF.layer setCornerRadius:viewWidthFrame(20)];
    [imageGIF setTitle:@"Image-GIF" forState:UIControlStateNormal];
    [imageGIF setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [imageGIF setBackgroundColor:[UIColor colorWithRed:0 green:191.0/255.0 blue:1 alpha:1]];
    [imageGIF addTarget:self action:@selector(imageGIF) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:imageGIF];
    
    [self aotulayoutMasonry];
}

// aabcad
- (void) aabcad {
    NSString *str = @"aabcad";
    NSMutableArray *marr = [[NSMutableArray alloc] initWithCapacity:10];
    for (int i = 0; i < str.length; i++) {
        [marr addObject:[str substringWithRange:NSMakeRange(i, 1)]];
    }
    NSLog(@"- %@", marr);
    [self compareNum:marr];
    NSLog(@"%@",marr);
}

-(NSMutableArray *)compareNum:(NSMutableArray *)mArr {
    long count = mArr.count;//重新定义了,count不会减一
    for (int j = 0; j < count - 1; j++) {
        for (int i = j; i < count - 1-1-1; i++) {
//            NSLog(@" %@  %@",[mArr objectAtIndex:j],[mArr objectAtIndex:i + 2]);
            NSString *a = [mArr objectAtIndex:j];
            NSString *b = [mArr objectAtIndex:i+2];
            if ([a isEqualToString:b]) {
                 [mArr replaceObjectAtIndex:i + 2 withObject:@" "];
            }
        }
    }
    return mArr;
}

// add same number
- (void)plusSame {
    self.basicNumberArr = [NSMutableArray arrayWithCapacity:16];
    self.arrElementOne = [NSMutableArray arrayWithCapacity:16];
    self.arrElementTwo = [NSMutableArray arrayWithCapacity:16];
    self.arrElementFour = [NSMutableArray arrayWithCapacity:16];
    self.arrElementEight = [NSMutableArray arrayWithCapacity:16];
    self.arrElementSixteen = [NSMutableArray arrayWithCapacity:16];
    self.arrElementThirtyTwo = [NSMutableArray arrayWithCapacity:16];
    self.arrElementSixtyFour = [NSMutableArray arrayWithCapacity:16];
    
    self.addTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(addElementOne) userInfo:nil repeats:YES];
    [self.addTimer fire];
}

- (void)addElementOne {
    if (self.timeNum) {
        if (!(self.timeNum % 5)) {
            NSNumber *one = [NSNumber numberWithInt:1];
            [self.arrElementOne addObject:one];
            NSLog(@"\nThe arrElementOne is:%@",self.arrElementOne);
        }
        if (!(self.timeNum % 10)) {
            [self calculateArrayElement];
        }
    }
    self.timeNum ++;
}

- (void)calculateArrayElement {
    if (self.arrElementSixtyFour.count >= 2) {
        
        NSNumber *sixtyFour = [NSNumber numberWithInt:64];
        [self.arrElementSixtyFour removeObject:sixtyFour inRange:NSMakeRange(0, 2)];
        
        NSLog(@"To Next Array Element");
    } else if (self.arrElementThirtyTwo.count >= 2) {
        
        NSNumber *thirtyTwo = [NSNumber numberWithInt:32];
        [self.arrElementThirtyTwo removeObject:thirtyTwo inRange:NSMakeRange(0, 2)];
        
        NSNumber *sixtyFour = [NSNumber numberWithInt:64];
        [self.arrElementSixtyFour addObject:sixtyFour];
        
    } else if (self.arrElementSixteen.count >= 2) {
        
        NSNumber *sixteen = [NSNumber numberWithInt:16];
        [self.arrElementSixteen removeObject:sixteen inRange:NSMakeRange(0, 2)];
        
        NSNumber *thirtyTwo = [NSNumber numberWithInt:32];
        [self.arrElementThirtyTwo addObject:thirtyTwo];
        
    } else if (self.arrElementEight.count >= 2) {
        
        NSNumber *eight = [NSNumber numberWithInt:8];
        [self.arrElementEight removeObject:eight inRange:NSMakeRange(0, 2)];
        
        NSNumber *sixteen = [NSNumber numberWithInt:16];
        [self.arrElementSixteen addObject:sixteen];
        
    } else if (self.arrElementFour.count >= 2) {
        
        NSNumber *four = [NSNumber numberWithInt:4];
        [self.arrElementFour removeObject:four inRange:NSMakeRange(0, 2)];
        
        NSNumber *eight = [NSNumber numberWithInt:8];
        [self.arrElementEight addObject:eight];
        
    } else if (self.arrElementTwo.count >= 2) {
        
        NSNumber *two = [NSNumber numberWithInt:2];
        [self.arrElementTwo removeObject:two inRange:NSMakeRange(0, 2)];
        
        NSNumber *four = [NSNumber numberWithInt:4];
        [self.arrElementFour addObject:four];
        
    } else if (self.arrElementOne.count >= 2) {
        [self.arrElementOne removeObjectsInRange:NSMakeRange(0, 2)];
            
        NSNumber *two = [NSNumber numberWithInt:2];
        [self.arrElementTwo addObject:two];
        
    } else {
//        NSLog(@"Do Nothing");
    }
    
    [self.basicNumberArr removeAllObjects];
    [self.basicNumberArr addObjectsFromArray:self.arrElementOne];
    [self.basicNumberArr addObjectsFromArray:self.arrElementTwo];
    [self.basicNumberArr addObjectsFromArray:self.arrElementFour];
    [self.basicNumberArr addObjectsFromArray:self.arrElementEight];
    [self.basicNumberArr addObjectsFromArray:self.arrElementSixteen];
    [self.basicNumberArr addObjectsFromArray:self.arrElementThirtyTwo];
    [self.basicNumberArr addObjectsFromArray:self.arrElementSixtyFour];
    NSLog(@"\nThe basicNumberArr is:%@",self.basicNumberArr);
}

- (void)addOtherArr {
    NSLog(@"Add to other array");
}

//jumpToGCDView

- (void)jumpToGCD {
    GCDViewController *GCDView = [[GCDViewController alloc] init];
    [self.navigationController pushViewController:GCDView animated:YES];
}

// image - GIF
- (void)imageGIF {
    ImageGIFController *imageGIF = [[ImageGIFController alloc] init];
    [self.navigationController pushViewController:imageGIF animated:YES];
}

//aotulayout-Masonry

- (void)aotulayoutMasonry {
    UIView *redView = [[UIView alloc] init];
    [redView setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:redView];
    
    UIView *yellowView = [[UIView alloc] init];
    [yellowView setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:yellowView];
    
    UIView *blueView = [[UIView alloc] init];
    [blueView setBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:blueView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);//使左边等于self.view的左边，间距为0
        make.top.equalTo(GCDBtn.mas_top).offset(80);//使顶部与GCDBtn的间距为20
        make.bottom.equalTo(self.view.mas_bottom).offset(0);//使底部与self.view的间距为0
        make.width.equalTo(self.view.mas_width).multipliedBy((float)(1.0/3.0));//设置宽度为self.view的1/3，multipliedBy是倍数的意思，也就是，使宽度等于self.view宽度的1/3倍
    }];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView);//使宽高等于redView
        make.top.equalTo(redView.mas_top);//与redView顶部对齐
//        make.leading.equalTo(redView.mas_right);//与redView的间距为0
        make.left.equalTo(redView.mas_right).offset(0);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(redView);//使宽高等于redView
        make.top.equalTo(redView.mas_top);//与redView顶部对齐
        //        make.leading.equalTo(redView.mas_right);//与redView的间距为0
        make.left.equalTo(yellowView.mas_right).offset(0);
    }];
}

//kvo

- (void)kvoSelecter {
    [self addObserver:self forKeyPath:@"keyName" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
}

/****************************************************/

- (void)dealloc {
    [self.addTimer invalidate];
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
