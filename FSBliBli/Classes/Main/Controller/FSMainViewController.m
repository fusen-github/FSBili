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

@interface FSMainViewController ()<FSCoverViewDelegate>

@end

@implementation FSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavBar];
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
    
    
}

- (UIView *)leftBarView
{
    UIView *view = [[UIView alloc] init];
    
    view.height = 44;
    
    UIImageView *imageV1 = [[UIImageView alloc] initWithImage:
                            [UIImage imageNamed:@"ic_drawer_home"]];
    
    [view addSubview:imageV1];
    
    imageV1.userInteractionEnabled = YES;
    
    imageV1.x = 0;
    
    imageV1.centerY = self.navigationController.navigationBar.height * 0.5;
    
    [view addSubview:imageV1];
    
    UIImageView *imageV2 = [[UIImageView alloc] initWithImage:
                            [UIImage imageNamed:@"bili_default_avatar"]];
    
    imageV2.userInteractionEnabled = YES;
    
    imageV2.x = imageV1.maxX + 5;
    
    imageV2.centerY = self.navigationController.navigationBar.height * 0.5;
    
    [view addSubview:imageV2];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    
    nameLabel.text = @"雅人";
    
    [nameLabel sizeToFit];
    
    nameLabel.textColor = [UIColor whiteColor];
    
    nameLabel.font = [UIFont systemFontOfSize:14];
    
    [view addSubview:nameLabel];
    
    nameLabel.userInteractionEnabled = YES;
    
    nameLabel.x = imageV2.maxX + 5;
    
    nameLabel.centerY = self.navigationController.navigationBar.height * 0.5;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didCilckMenuView)];
    
    [view addGestureRecognizer:tap];
    
    view.width = nameLabel.maxX + 3;
    
    return view;
}

- (void)didCilckMenuView
{
    [FSCoverView showCoverViewWithDelegate:self];
    
    FSMenuView *menuView = [[FSMenuView alloc] initWithWidth:kScreenWidth * 0.7];
    
    [menuView showMenuWithAnimate:YES];
}



- (void)didClickCoverView:(UIView *)coverView
{
    
}




@end
