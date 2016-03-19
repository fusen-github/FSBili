//
//  FSTabView.m
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import "FSTabToolBar.h"

#define kItemWidth 45

@interface FSTabToolBar ()

@property (nonatomic, strong) NSArray *array;

@property (nonatomic, strong) UIView *underLine;

@property (nonatomic, assign) CGFloat margin;

@property (nonatomic, weak) id <FSTabToolBarDelegate> delegate;

@end

@implementation FSTabToolBar

- (UIView *)underLine
{
    if (_underLine == nil)
    {
        UIView *view = [[UIView alloc] init];
        
        view.backgroundColor = [UIColor whiteColor];
        
        view.height = 2;
        
        view.width = kItemWidth;
        
        _underLine = view;
    }
    return _underLine;
}

- (instancetype)initWithTitleArray:(NSArray *)array delegate:(id<FSTabToolBarDelegate>)delegate
{
    if (self = [super init])
    {
        self.width = kScreenWidth;
        
        self.delegate = delegate;
        
        self.backgroundColor = UIColorFromRGB(0xF13B74);
        
        self.array = array;
        
        self.height = 50;
        
        [self setupTabView];
    }
    return self;
}

- (void)setupTabView
{
    CGFloat btnW = kItemWidth;
    
    CGFloat btnH = self.height - 2;
    
    CGFloat margin = (self.width - btnW * self.array.count) / (self.array.count + 1);
    
    self.margin = margin;
    
    CGFloat btnX = 0;
    
    CGFloat btnY = 0;
    
    NSInteger index = 0;
    
    for (NSString *title in self.array)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.tag = index;
        
        [button setTitle:title forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [button setTitleColor:UIColorFromRGB(0x9A9A9A)
                     forState:UIControlStateNormal];
        
        [button setTitleColor:UIColorFromRGB(0xFFFFFF)
                     forState:UIControlStateSelected];
        
        btnX = margin + (margin + btnW) * index;
        
        button.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        [button addTarget:self
                   action:@selector(clickItemButton:)
         forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
        
        if (index == 0)
        {
            self.underLine.x = margin;
            
            self.underLine.y = button.maxY;
            
            [self addSubview:self.underLine];
        }
        
        index++;
    }
}

- (void)clickItemButton:(UIButton *)button
{
    [UIView animateWithDuration:0.3 animations:^{
       
        self.underLine.x = self.margin + button.tag * (kItemWidth + self.margin);
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(didClickTabItemWithIndex:)])
    {
        [_delegate didClickTabItemWithIndex:button.tag];
    }
}




@end
