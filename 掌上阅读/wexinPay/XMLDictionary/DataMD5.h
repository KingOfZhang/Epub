//
//  DataMD5.h
//  WeChatDemo
//
//  Created by 尹俊雄 on 15/7/2.
//  Copyright (c) 2015年 yjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataMD5 : NSObject
-(instancetype)initWithAppid:(NSString *)appid_key
                      mch_id:(NSString *)mch_id_key
                   nonce_str:(NSString *)noce_str_key
                  partner_id:(NSString *)partner_id
                        body:(NSString *)body_key
               out_trade_no :(NSString *)out_trade_no_key
                   total_fee:(NSString *)total_fee_key
            spbill_create_ip:(NSString *)spbill_create_ip_key
                  notify_url:(NSString *)notify_url_key
                  trade_type:(NSString *)trade_type_key;
///获取MD5签名
- (NSString *)getSignForMD5;
///创建发起支付时的sige签名
-(NSString *)createMD5SingForPay:(NSString *)appid_key partnerid:(NSString *)partnerid_key prepayid:(NSString *)prepayid_key package:(NSString *)package_key noncestr:(NSString *)noncestr_key timestamp:(UInt32)timestamp_key;
@end
