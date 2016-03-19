//
//  FSMenuView.h
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSMenuView : UIView

- (instancetype)initWithWidth:(CGFloat)width;

- (void)showMenuWithAnimate:(BOOL)animate;

- (void)hideWithAnimate:(BOOL)animate;

@end
