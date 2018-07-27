//
//  FMDBTest.m
//  playtext
//
//  Created by 宋朝阳 on 2017/7/12.
//  Copyright © 2017年 song. All rights reserved.
//

#import "FMDBTest.h"

#import <FMDB/FMDatabase.h>
#import <AFNetworking/AFNetworking.h>

@interface FMDBTest ()

@end

@implementation FMDBTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getRequest {
    AFHTTPSessionManager *getManger = [AFHTTPSessionManager manager];
    [getManger GET:@"URL" parameters:nil progress:^(NSProgress *_Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)postRequest {
    AFHTTPSessionManager *postManager = [AFHTTPSessionManager manager];
    NSDictionary *requestDic = @{@"":@"",@"":@""};
    [postManager POST:@"URL" parameters:requestDic progress:^(NSProgress *_Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)download {
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.确定请求的URL地址
//    NSURL *url = [NSURL URLWithString:@""];
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@""]];
    //下载任务
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //打印下下载进度
        NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载地址
        NSLog(@"默认下载地址:%@",targetPath);
        //设置下载路径，通过沙盒获取缓存地址，最后返回NSURL对象
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //下载完成调用的方法
        NSLog(@"下载完成：");
        NSLog(@"%@--%@",response,filePath);
    }];
    //开始启动任务
    [downloadTask resume];
}

//第一种方法是通过工程中的文件进行上传
- (void)upLoadOne {
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.上传文件
    NSDictionary *dict = @{@"username":@"1234"};
    
    NSString *urlString = @"URL";
    [manager POST:urlString parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //上传文件参数
        NSString *imageStr = [NSString stringWithFormat:@"123.png"];
        UIImage *iamge = [UIImage imageNamed:imageStr];
        NSData *data = UIImagePNGRepresentation(iamge);
        //这个就是参数
        [formData appendPartWithFileData:data name:@"file" fileName:imageStr mimeType:@"image/png"];
    }progress:^(NSProgress * _Nonnull uploadProgress) {
        //打印下上传进度
        NSLog(@"%lf",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    }success:^(NSURLSessionDataTask *task, id responseObject) {
        //请求成功
        NSLog(@"请求成功：%@",responseObject);
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        //请求失败
        NSLog(@"请求失败：%@",error);
    }];
}

//第二种是通过URL来获取路径，进入沙盒或者系统相册等等
- (void)upLoadTwo {
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2.上传文件
    NSDictionary *dict = @{@"username":@"1234"};
    
    NSString *urlString = @"URL";
    [manager POST:urlString parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        /*
         
         第一个参数：要上传的文件的URL路径
         
         第二个参数：文件参数对应的参数名称，此处为file是该台服务器规定的（通常会在接口文档中提供）
         
         第三个参数：该文件上传到服务后以什么名称保存
         
         第四个参数：该文件的MIMeType类型
         
         第五个参数：错误信息，传地址
         
         */
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" error:nil];
        /*
         
         第一个参数：要上传的文件的URL路径
         
         第二个参数：文件参数对应的参数名称，此处为file
         
         第三个参数：错误信息
         
         说明：AFN内部自动获得路径URL地址的最后一个节点作为文件的名称，内部调用C语言的API获得文件的类型
         
         */
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"文件地址"] name:@"file" fileName:@"1234.png" mimeType:@"application/octet-stream" error:nil];
    }progress:^(NSProgress * _Nonnull uploadProgress)  {
        //打印下上传进度
        NSLog(@"%lf", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        NSLog(@"请求成功：%@",responseObject);
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSLog(@"请求失败：%@",error);
    }];
}

- (void)AFNetworkStatus{
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
    typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
        AFNetworkReachabilityStatusUnknown          = -1,      未知
        AFNetworkReachabilityStatusNotReachable     = 0,       无网络
        AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
        AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
    };
    */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                break;
                
            default:
                break;
        }
    }] ;
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
