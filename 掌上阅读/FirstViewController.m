
//
//  FirstViewController.m
//  掌上阅读
//
//  Created by 易云时代 on 16/3/2.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import "FirstViewController.h"
#import "ShareViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)goShare:(id)sender {
    ShareViewController *share = [[ShareViewController alloc]init];
    [self.navigationController pushViewController:share animated:YES];
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
