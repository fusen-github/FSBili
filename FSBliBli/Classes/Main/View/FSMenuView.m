//
//  FSMenuView.m
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import "FSMenuView.h"

@implementation FSMenuView

- (instancetype)initWithWidth:(CGFloat)width
{
    if (self = [super init])
    {
        self.x = -width;
        
        self.y = 0;
        
        self.width = width;
        
        self.height = kScreenHeight;
        
        self.backgroundColor = [UIColor redColor];
        
        [keyWindow addSubview:self];
        
        [self setupView];
    }
    return self;
}


- (void)setupView
{
    UIView *headerView = [[UIView alloc] init];
    
    headerView.width = self.width;
    
    headerView.height = 200;
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:headerView];
    
    
    UIButton *button = [[UIButton alloc] init];
    
    button.titleLabel.backgroundColor = [UIColor blueColor];
    
    button.imageView.backgroundColor = [UIColor greenColor];
    
    button.backgroundColor = [UIColor redColor];
    
    [button setImage:[UIImage imageNamed:@"bili_default_avatar2"]
            forState:UIControlStateNormal];
    
    [button setTitle:@"付森" forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateNormal];
    
    button.width = 100;
    
    button.height = 100;
    
    button.centerX = headerView.centerX;
    
    button.centerY = headerView.centerY;
    
    [self addSubview:button];
    
    [button setImageTopAndTitleBottomWithVerticalMargin:10];
    
}

- (void)showMenuWithAnimate:(BOOL)animate
{
    if (animate)
    {
        [UIView animateWithDuration:0.5 animations:^{
           
            self.x = 0;
        }];
    }
    else
    {
        self.x = 0;
    }
}



@end
