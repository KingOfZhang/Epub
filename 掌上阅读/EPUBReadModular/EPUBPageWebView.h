//
//  EPUBPageWebView.h
//  掌上阅读
//
//  Created by 易云时代 on 2017/8/10.
//  Copyright © 2017年 易云时代_ZXW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EPUBPageViewController;
@interface EPUBPageWebView : UIWebView <UIWebViewDelegate>

@property (weak,nonatomic) EPUBPageViewController *parentVC;

- (NSInteger)highlightAllOccurencesOfString:(NSString*)str;
- (void)removeAllHighlights;

- (NSInteger)underlineAllOccurencesOfString:(NSString*)str;
@end
