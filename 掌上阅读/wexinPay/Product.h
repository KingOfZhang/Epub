//
//  Product.h
//  EcmCustomer
//
//  Created by libin on 15/12/26.
//  Copyright © 2015年 张进. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{
@private
    float     _price;
    NSString *_subject;
    NSString *_body;
    NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *orderId;


@end
