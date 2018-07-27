//
//  CollectionViewCell.m
//  playtext
//
//  Created by 宋朝阳 on 2017/6/10.
//  Copyright © 2017年 song. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.cellImage  = [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 70, 70)];
        self.cellImage.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.cellImage];
        
        self.cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
        self.cellLabel.textAlignment = NSTextAlignmentCenter;
        self.cellLabel.textColor = [UIColor blueColor];
        self.cellLabel.font = [UIFont systemFontOfSize:15];
        self.cellLabel.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.cellLabel];
    }
    return self;
}

@end
