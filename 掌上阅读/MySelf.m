//
//  MySelf.m
//  掌上阅读
//
//  Created by 易云时代 on 16/2/29.
//  Copyright © 2016年 易云时代_ZXW. All rights reserved.
//

#import "MySelf.h"

@interface MySelf ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@end
@implementation MySelf
- (void)viewDidLoad{

    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}
- (void)createUI{
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = @[@"我的",@"设置",@"评价",@"反馈",@"更新"];
    NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    cell.textLabel.text = [arr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:19];
    return cell;
}
@end
