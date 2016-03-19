//
//  FSMainViewController.m
//  FSBliBli
//
//  Created by 四维图新 on 16/3/9.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import "FSMainViewController.h"
#import "FSMenuView.h"
#import "FSCoverView.h"
#import "FSMainTool.h"
#import "FSTabToolBar.h"

@interface FSMainViewController ()<FSCoverViewDelegate,FSTabToolBarDelegate>

@property (nonatomic, weak) FSMenuView *menuView;

@end

@implementation FSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavBar];
    
    [self setupTabView];
}

- (void)setupTabView
{
    NSArray *titles = @[@"番剧",@"推荐",@"分区",@"关注",@"发现"];
    
    FSTabToolBar *toolBar = [[FSTabToolBar alloc] initWithTitleArray:titles
                                                            delegate:self];
    
    toolBar.x = 0;
    
    toolBar.y = 0;
    
    [self.view addSubview:toolBar];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)setupNavBar
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, self.view.width, 20)];
    
    bgView.backgroundColor = UIColorFromRGB(0xF13B74);
    
    [self.navigationController.navigationBar addSubview:bgView];
    
    UIImage *bgImage = [UIImage imageWithColor:UIColorFromRGB(0xF13B74)];
    
    [self.navigationController.navigationBar setBackgroundImage:bgImage
                                                  forBarMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self leftBarView]];
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
}


- (UIView *)leftBarView
{
    UIView *view = [FSMainTool mainViewControllerLeftBarButtonWithNavBarHeight:self.navigationController.navigationBar.height];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didCilckMenuView)];
    
    [view addGestureRecognizer:tap];
    
    return view;
}

- (void)didCilckMenuView
{
    [FSCoverView showCoverViewWithDelegate:self];
    
    FSMenuView *menuView = [[FSMenuView alloc] initWithWidth:kScreenWidth * 0.7];
    
    self.menuView = menuView;
    
    [menuView showMenuWithAnimate:YES];
}


- (void)didClickCoverView:(UIView *)coverView
{
    [self.menuView hideWithAnimate:YES];
    
    [UIView animateWithDuration:0.5 animations:^{
        coverView.alpha = 0;
    } completion:^(BOOL finished) {
        [coverView removeFromSuperview];
    }];
}

- (void)didClickTabItemWithIndex:(NSInteger)index
{
    
}


@end
