//
//  OnlyObject.m
//  playtext
//
//  Created by 宋朝阳 on 2017/7/14.
//  Copyright © 2017年 song. All rights reserved.
//

#import "OnlyObject.h"

@implementation OnlyObject

static OnlyObject *_onlyObject;

+ (instancetype)defaultAlloc {
    /*
     @synchronized (self) {
     // 为了防止多线程同时访问对象，造成多次分配内存空间，所以要加上线程锁
     if (!_onlyObject) {
     _onlyObject = [super allocWithZone:zone];
     }
     return _onlyObject;
     }
     */
    
    // 也可以使用一次性代码
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_onlyObject) {
            _onlyObject = [[self alloc]init];
        }
    });
    return _onlyObject;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
