//
//  FSCoverView.m
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import "FSCoverView.h"

@interface FSCoverView ()

@property (nonatomic, weak) id <FSCoverViewDelegate> delegate;

@end

@implementation FSCoverView

+ (instancetype)showCoverViewWithDelegate:(id<FSCoverViewDelegate>)delegate
{
    return [[self alloc] initWithDelegate:delegate];
}

- (instancetype)initWithDelegate:(id<FSCoverViewDelegate>)delegate
{
    if (self = [super init])
    {
        self.delegate = delegate;
        
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.frame = [UIScreen mainScreen].bounds;
    
    self.alpha = 0;
    
    self.backgroundColor = [UIColor blackColor];
    
    [UIView animateWithDuration:0.5 animations:^{
    
        self.alpha = 0.4;
    }];

    [keyWindow addSubview:self];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCover)];
    
    [self addGestureRecognizer:tap];
}


- (void)clickCover
{
    if (_delegate && [_delegate respondsToSelector:@selector(didClickCoverView:)])
    {
        [_delegate didClickCoverView:self];
    }
}






@end
