//
//  BookViewController.m
//  掌上阅读
//
//  Created by 易云时代 on 16/2/29.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import "BookViewController.h"
#import "EPUBParser.h"
#import "EPUBReadMainViewController.h"
#import "PhoneNmuberViewController.h"

@implementation BookViewController
- (void)viewDidLoad{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //前提条件
    _epubParser=[[EPUBParser alloc] init];

}
- (IBAction)toBook:(id)sender {
    
/*
 先判断用户是否登陆
 YES：进入epub
 NO：跳转登录界面
 */
    
    //显示  epub
    int i =1;
    if (i==1) {
    
    NSString *fileFullPath=[[NSBundle mainBundle] pathForResource:@"750441344501" ofType:@"epub" inDirectory:nil];
    
    //
    NSMutableDictionary *fileInfo=[NSMutableDictionary dictionary];
    [fileInfo setObject:fileFullPath forKey:@"fileFullPath"];
    
    
    EPUBReadMainViewController *epubVC=[EPUBReadMainViewController new];
    epubVC.epubParser=self.epubParser;
    epubVC.fileInfo=fileInfo;
    
    epubVC.epubReadBackBlock=^(NSMutableDictionary *para1){
        NSLog(@"回调=%@",para1);
        //[self dismissViewControllerAnimated:YES completion:nil];  //a方式  oK
        //[self.navigationController popToRootViewControllerAnimated:YES];    //b方式  oK
        [self dismissViewControllerAnimated:YES completion:nil];
        
        return 1;
    };
    
    //[self showViewController:epubVC sender:nil];  //a方式  oK
    //[self.navigationController pushViewController:epubVC animated:YES];  //b方式  oK
    [self.navigationController presentViewController:epubVC animated:YES completion:nil];
    }else{
        PhoneNmuberViewController *Phone = [[PhoneNmuberViewController alloc]init];
        [self.navigationController pushViewController:Phone animated:YES];
    }
    
}
- (IBAction)toMy:(id)sender {
    int l=0;
    if (l == 1) {
        
    //显示  epub
    NSString *fileFullPath=[[NSBundle mainBundle] pathForResource:@"保持共产党员先进性教育学习文件导读" ofType:@"epub" inDirectory:nil];
    
    //
    NSMutableDictionary *fileInfo=[NSMutableDictionary dictionary];
    [fileInfo setObject:fileFullPath forKey:@"fileFullPath"];
    
    
    EPUBReadMainViewController *epubVC=[EPUBReadMainViewController new];
    epubVC.epubParser=self.epubParser;
    epubVC.fileInfo=fileInfo;
    
    epubVC.epubReadBackBlock=^(NSMutableDictionary *para1){
        NSLog(@"回调=%@",para1);
        //[self dismissViewControllerAnimated:YES completion:nil];  //a方式  oK
        //[self.navigationController popToRootViewControllerAnimated:YES];    //b方式  oK
        [self dismissViewControllerAnimated:YES completion:nil];
        
        return 1;
    };
    
    //[self showViewController:epubVC sender:nil];  //a方式  oK
    //[self.navigationController pushViewController:epubVC animated:YES];  //b方式  oK
    [self.navigationController presentViewController:epubVC animated:YES completion:nil];
    }else{

        PhoneNmuberViewController *phone = [[PhoneNmuberViewController alloc]init];
        [self.navigationController pushViewController:phone animated:YES];
    }
    
}
@end
