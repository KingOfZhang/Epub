//
//  HTMMLModel.h
//  ShouGangBasketBall
//
//  Created by libin on 15/10/22.
//  Copyright (c) 2015年 SGzxw. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol sendRequestInfoHTMLno <NSObject>

- (void)sendRequestInfoHTMLno : (NSData *)requestData andRequestPath : (NSString *)path;

@end
@interface HTMMLModelno : NSObject
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSMutableData *myData;
@property (nonatomic, strong) id<sendRequestInfoHTMLno>delegate;
- (void)startRequestInfoHTMLno;
@end
