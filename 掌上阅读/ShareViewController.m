//
//  ShareViewController.m
//  掌上阅读
//
//  Created by 易云时代 on 16/3/2.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import "ShareViewController.h"
#import "WXApi.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)share:(id)sender {
    
    NSString *url = @"https://www.baidu.com";
    NSString *title = @"北京海淀最大的地，上地";
    NSString *description = @"这么大的地，种点玉米，种点水稻，种点啥啥的";
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.scene = WXSceneSession;
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:[UIImage imageNamed:@"1"]];
    WXWebpageObject *web = [WXWebpageObject object];
    web.webpageUrl = url;
    message.mediaObject = web;
    req.message = message;
    [WXApi sendReq:req];
    
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
