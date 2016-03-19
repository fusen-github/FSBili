//
//  FSMainTool.m
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import "FSMainTool.h"

@implementation FSMainTool

+ (UIView *)mainViewControllerLeftBarButtonWithNavBarHeight:(CGFloat)height
{
    UIView *view = [[UIView alloc] init];
    
    view.height = 44;
    
    UIImageView *imageV1 = [[UIImageView alloc] initWithImage:
                            [UIImage imageNamed:@"ic_drawer_home"]];
    
    [view addSubview:imageV1];
    
    imageV1.userInteractionEnabled = YES;
    
    imageV1.x = 0;
    
    imageV1.centerY = height * 0.5;
    
    [view addSubview:imageV1];
    
    UIImageView *imageV2 = [[UIImageView alloc] initWithImage:
                            [UIImage imageNamed:@"bili_default_avatar"]];
    
    imageV2.userInteractionEnabled = YES;
    
    imageV2.x = imageV1.maxX + 5;
    
    imageV2.centerY = height * 0.5;
    
    [view addSubview:imageV2];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    
    nameLabel.text = @"雅人";
    
    [nameLabel sizeToFit];
    
    nameLabel.textColor = [UIColor whiteColor];
    
    nameLabel.font = [UIFont systemFontOfSize:14];
    
    [view addSubview:nameLabel];
    
    nameLabel.userInteractionEnabled = YES;
    
    nameLabel.x = imageV2.maxX + 5;
    
    nameLabel.centerY = height * 0.5;
    
    view.width = nameLabel.maxX + 3;
    
    return view;

}


@end
