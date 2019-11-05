//
//  ImageGIFController.m
//  playtext
//
//  Created by 宋朝阳 on 2019/10/31.
//  Copyright © 2019 song. All rights reserved.
//

#import "ImageGIFController.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ImageGIFController ()

@end

@implementation ImageGIFController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *testImage = [UIImage imageNamed:@"IMG_1"];
    // 保存图片到相册
//    UIImageWriteToSavedPhotosAlbum(testImage, nil, nil, nil);
    [self jpgToPngWithImage:testImage]; // jpg转png
    [self pngToJpgWithImage:testImage]; // png转jpg
    
    // gif 处理及显示
    [self deCompositionGif];
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
    [self.view addSubview:gifImageView];
    [gifImageView setAnimationImages:[self deCompositionGif]]; // 添加GIF单帧图片
    [gifImageView setAnimationRepeatCount:110]; // 循环次数
    [gifImageView setAnimationDuration:2]; // 一次循环时长
    [gifImageView startAnimating];
//    [gifImageView stopAnimating];
    
    // gif 合成
    [self createGIF];
    
    // image加载优化（缓存）（大尺寸图片先可缩放后加载）
    // 1.图片加载缓存中，提高读取速度，大量图片有影响
    UIImage *imageWithName = [UIImage imageNamed:@"imageName"];
    // 2.直接地址读取，无内存操作，大量图片影响较小
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"imageName"] ofType:@"jpg"];
    UIImage *imageWithFile = [UIImage imageWithContentsOfFile:imagePath];
}

/*
 * UIImageTest
 */
- (UIImage *)jpgToPngWithImage:(UIImage *)image {
    NSData *pngData = UIImagePNGRepresentation(image);// 无损
    return [UIImage imageWithData:pngData];
}

- (UIImage *)pngToJpgWithImage:(UIImage *)image {
    NSData *jpgData = UIImageJPEGRepresentation(image, 1);// 有损
    return [UIImage imageWithData:jpgData];
}

/*
 * 获取gif解成单帧 --> 单帧转UIImage
 */
- (NSArray *)deCompositionGif {
    // GIF解成单帧
    NSString *gitPathSource = [[NSBundle mainBundle] pathForResource:@"git1" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:gitPathSource];
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge_retained CFDataRef)gifData, NULL);
    // 帧数
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    for (size_t num = 0; num < count; num++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, num, NULL);
        // 单帧转UIImage
        UIImage *image = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        CGImageRelease(imageRef);
        [imageArray addObject:image];
    }
    CFRelease(source);
    
    // 单帧保存（获取路径）
//    int i = 0;
//    for (UIImage *gifImage in imageArray) {
//        NSData *data = UIImagePNGRepresentation(gifImage);
//        NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *gifPath = path[0];
//        NSString *pathNum = [gifPath stringByAppendingString:[NSString stringWithFormat:@"%d.png", i]];
//        [data writeToFile:pathNum atomically:NO]; // 写入
//        i++;
//    }
    
    return imageArray;
}

/*
 * GIF合成
 */
- (void)createGIF {
    // 获取图片数据
    NSMutableArray *imageArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"IMG_1"], [UIImage imageNamed:@"IMG_2"], [UIImage imageNamed:@"IMG_3"], nil];
    // 创建GIF文件
    NSArray *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentStr = [document objectAtIndex:0];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *textDic = [documentStr stringByAppendingString:@"/gif"];
    [filemanager createDirectoryAtPath:textDic withIntermediateDirectories:YES attributes:nil error:nil];
    NSString *path = [textDic stringByAppendingString:@"testGIF.gif"]; // 路径
    // 配置属性
    CGImageDestinationRef destination;
    CFURLRef url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, (CFStringRef)path, kCFURLPOSIXPathStyle, false);
    destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, imageArray.count, NULL);
    NSDictionary *frameDic = [NSDictionary dictionaryWithObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:0.3], (NSString *)kCGImagePropertyGIFDelayTime, nil] forKey:(NSString *)kCGImagePropertyGIFDelayTime];
    NSMutableDictionary *gifParmdict = [NSMutableDictionary dictionaryWithCapacity:2];
    [gifParmdict setObject:[NSNumber numberWithBool:YES] forKey:(NSString *)kCGImagePropertyGIFImageColorMap];
    [gifParmdict setObject:(NSString *)kCGImagePropertyColorModelRGB forKey:(NSString *)kCGImagePropertyColorModel];
    [gifParmdict setObject:[NSNumber numberWithInt:8] forKey:(NSString *)kCGImagePropertyDepth];
    [gifParmdict setObject:[NSNumber numberWithInt:0] forKey:(NSString *)kCGImagePropertyGIFLoopCount];
    NSDictionary *gifProperty = [NSDictionary dictionaryWithObject:gifParmdict forKey:(NSString *)kCGImagePropertyGIFDictionary];
    // 合成GIF
    for (UIImage *dimage in imageArray) {
        CGImageDestinationAddImage(destination, dimage.CGImage, (__bridge CFDictionaryRef)frameDic);
    }
    CGImageDestinationSetProperties(destination, (__bridge CFDictionaryRef)gifProperty);
    CGImageDestinationFinalize(destination);
    CFRelease(destination);
}

@end
