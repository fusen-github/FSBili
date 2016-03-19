//
//  FSTabView.h
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FSTabToolBarDelegate <NSObject>

- (void)didClickTabItemWithIndex:(NSInteger)index; // 从0开始

@end

@interface FSTabToolBar : UIView

- (instancetype)initWithTitleArray:(NSArray *)array
                          delegate:(id<FSTabToolBarDelegate>)delegate;

@end
