//
//  PayViewController.m
//  掌上阅读
//
//  Created by 易云时代 on 16/3/2.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import "PayViewController.h"
#import "DataMD5.h"
#import "XMLDictionary.h"
#import "WXApi.h"
#import "AppDelegate.h"
#import "WXApiObject.h"
#import "WXUtil.h"
#import "Product.h"
#import "Order.h"
#import "APAuthV2Info.h"
#import "payRequsestHandler.h"
#import "WXApiObject.h"
#import "WXUtil.h"

@interface PayViewController ()
{
    float money;
}

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)toPay{
    ((AppDelegate*)[[UIApplication sharedApplication] delegate]).weixinDelegate = self;
    payRequsestHandler *req = [payRequsestHandler new];
    [req init:APP_ID mch_id:MCH_ID];
    [req setKey:PARTNER_ID];
    NSString *str1 = [NSString stringWithFormat:@"%f",money];
    NSString *str2 = @"订单信息";
    NSString *orderNumber = @"订单号";
    NSMutableDictionary *dictoy = [req sendPay_demo:orderNumber price:str1 name:str2];
    if (dictoy == nil) {
        NSString *debug = [req getDebugifo];
        NSLog(@"！！！！！！！！！%@",debug);
    }else{
        NSMutableString *stamp = [dictoy objectForKey:@"timestamp"];
        PayReq *req = [PayReq new];
        req.openID = [dictoy objectForKey:@"appid"];
        req.partnerId = [dictoy objectForKey:@"partnerid"];
        req.nonceStr = [dictoy objectForKey:@"noncestr"];
        req.package = [dictoy objectForKey:@"package"];
        req.prepayId = [dictoy objectForKey:@"prepayid"];
        req.sign = [dictoy objectForKey:@"sign"];
        req.timeStamp = stamp.intValue;
        [WXApi sendReq:req];
    }
    
}
- (void)onResp:(BaseResp *)resp{
    
    
    if ([resp isKindOfClass:[PayResp class]]) {
        if (resp.errCode ==0 ) {
            UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"支付成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alter addAction:cancelAction];
            [self presentViewController:alter animated:YES completion:nil];
            
        }else{
            UIAlertController *alter = [UIAlertController alertControllerWithTitle:@"提示" message:@"支付失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alter addAction:cancelAction];
            [self presentViewController:alter animated:YES completion:nil];
        }
    }
    

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
