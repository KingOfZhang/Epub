//
//  BookViewController.h
//  掌上阅读
//
//  Created by 易云时代 on 16/2/29.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EPUBParser;
@interface BookViewController : UIViewController
@property (strong, nonatomic) EPUBParser *epubParser; //epub解析器，成员变量或全局
@property (strong ,nonatomic) NSString *i;
@end
