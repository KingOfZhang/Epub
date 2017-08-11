//
//  XWEPUBSearchJieViewController.h
//  掌上阅读
//
//  Created by 易云时代 on 2017/8/10.
//  Copyright © 2017年 易云时代_ZXW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPUBCustomType.h"

@class EPUBReadMainViewController;
@interface XWEPUBSearchJieViewController : UIViewController

@property (strong,nonatomic) EPUBReadMainViewController *epubVC;
@property (strong, nonatomic) EPUBReadBackBlock backBlock; //应该是copy
@property (strong, nonatomic) NSString *searText;
@property (strong,nonatomic) UIView *headView;
@property (strong,nonatomic) UIView *contentView;
@property (strong,nonatomic) UIView *footView;


@property (strong,nonatomic) UIButton *btnBack;         //in headView
@property (strong,nonatomic) UILabel *lbTitle;      //in headView
@property (nonatomic,strong) UISearchBar *searchBar;    //in contentView
@property (strong,nonatomic) UILabel *lbSearchResult;   //in contentView
@property (strong,nonatomic) UITableView *tableView;    //in contentView
@property (strong,nonatomic) UILabel *lbSearchStatus;   //in footView

-(void)customViewInit:(CGRect)viewRect;     //创建
-(void)resizeViews:(CGRect)viewRect;        //布局
-(void)dataPrepare;                         //数据
-(void)initAfter;                           //线程初始化
-(void)refresh;                             //刷新

@end
