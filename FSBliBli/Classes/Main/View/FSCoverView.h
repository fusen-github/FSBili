//
//  FSCoverView.h
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FSCoverViewDelegate <NSObject>

@optional
- (void)didClickCoverView:(UIView *)coverView;

@end

@interface FSCoverView : UIView

+ (instancetype)showCoverViewWithDelegate:(id<FSCoverViewDelegate>)delegate;


@end
