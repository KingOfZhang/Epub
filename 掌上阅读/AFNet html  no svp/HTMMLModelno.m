//
//  HTMMLModel.m
//  ShouGangBasketBall
//
//  Created by libin on 15/10/22.
//  Copyright (c) 2015年 SGzxw. All rights reserved.
//

#import "HTMMLModelno.h"
#import "AFHTTPRequestOperationManager.h"
#import "AppDelegate.h"

@implementation HTMMLModelno

{
    int i;
}

- (void)startRequestInfoHTMLno
{
    /*
     NSURL *url = [NSURL URLWithString:self.path];
     NSURLRequest *request = [NSURLRequest requestWithURL:url];
     [NSURLConnection connectionWithRequest:request delegate:self];
     }
     // 1.
     - (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
     {
     if (self.myData == nil) {
     self.myData = [[NSMutableData alloc]init];
     }else{
     self.myData = 0;
     }
     }
     // 2.
     - (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
     {
     [self.myData appendData:data];
     }
     // 3.
     - (void)connectionDidFinishLoading:(NSURLConnection *)connection
     {
     if ([self.delegate respondsToSelector:@selector(sendRequestInfo:andRequestPath:)]) {
     [self.delegate sendRequestInfo:self.myData andRequestPath:self.path];
     }
     */

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //判断当前网络状态
    /*
     AFNetworkReachabilityStatusNotReachable     = 0,
     AFNetworkReachabilityStatusReachableViaWWAN = 1,
     AFNetworkReachabilityStatusReachableViaWiFi = 2,
     */
    i = 10;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        i = status;
        
    }];
    //开启网络监控
    [manager.reachabilityManager startMonitoring];
    //只要当前网络发生改变 就会立即调用block语句块
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:self.path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSData class]]) {
            [self.delegate sendRequestInfoHTMLno:responseObject andRequestPath:self.path];
          
        }else{
            NSLog(@"错了");
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (i == 0) {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请检查网络！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            alert.tag = 1000;
            [alert show];
        }else
            NSLog(@"error : %@",error.description);
 
    }];
    
}



@end
