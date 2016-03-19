//
//  FSMenuView.m
//  FSBliBli
//
//  Created by 四维图新 on 16/3/19.
//  Copyright © 2016年 四维图新. All rights reserved.
//

#import "FSMenuView.h"


@interface FSMenuView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation FSMenuView

- (NSArray *)dataArray
{
    if (_dataArray == nil)
    {
        NSArray *array = @[@[@{@"iconName":@"ic_home_black_24dp2",@"title":@"首页"},
                             @{@"iconName":@"ic_file_download_black_24dp",@"title":@"离线管理"}],
                           @[@{@"iconName":@"ic_star_black_24dp1",@"title":@"我的收藏"},
                             @{@"iconName":@"ic_history_black_24dp1",@"title":@"历史记录"},
                             @{@"iconName":@"ic_people_black_24dp1",@"title":@"关注的人"},
                @{@"iconName":@"ic_account_balance_wallet_black_24dp1",@"title":@"消费记录"}],
                           @[@{@"iconName":@"ic_settings_black_24dp1",@"title":@"设置"},
                             @{@"iconName":@"ic_help_black_24dp1",@"title":@"帮助与反馈"}]];
        
        _dataArray = array;
    }
    return _dataArray;
}

- (instancetype)initWithWidth:(CGFloat)width
{
    if (self = [super init])
    {
        self.x = -width;
        
        self.y = 0;
        
        self.width = width;
        
        self.height = kScreenHeight;
        
        self.backgroundColor = [UIColor clearColor];
        
        [keyWindow addSubview:self];
        
        [self setupView];
    }
    return self;
}


- (void)setupView
{
    UIView *headerView = [[UIView alloc] init];
    
    headerView.backgroundColor = UIColorFromRGB(0xef3e75); // 0xef3e75
    
    headerView.width = self.width;
    
    headerView.height = 200;
    
    headerView.y = 0;
    
    [self addSubview:headerView];
    
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:@"bili_default_avatar2"]
            forState:UIControlStateNormal];
    
    [button setTitle:@"付森" forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [button setTitleColor:[UIColor blackColor]
                 forState:UIControlStateNormal];
    
    button.width = 100;
    
    button.height = 100;
    
    button.x = 15;
    
    button.centerY = headerView.centerY;
    
    [self addSubview:button];
    
    [button setImageTopAndTitleBottomWithVerticalMargin:20];
    
    UIImageView *logoImageV = [[UIImageView alloc] init];
    
    logoImageV.image = [UIImage imageNamed:@"bili_drawerbg_logined"];
    
    logoImageV.frame = CGRectMake(button.maxX-30, 30, headerView.width - button.maxX + 30, headerView.height - 30);
    
    [headerView addSubview:logoImageV];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    self.tableView = tableView;
    
    tableView.rowHeight = 50;
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    tableView.frame = CGRectMake(0, headerView.maxY, headerView.width, kScreenHeight - headerView.height);
    
    [self addSubview:tableView];
    
    [self setupTableViewCellSeparatorInset];
}

- (void)setupTableViewCellSeparatorInset
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dataArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
        
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        cell.textLabel.textColor = [UIColor darkTextColor];
    }
    
    NSArray *sectionArr = [self.dataArray objectAtIndex:indexPath.section];
    
    NSDictionary *dict = [sectionArr objectAtIndex:indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:[dict objectForKey:@"iconName"]];
    
    cell.textLabel.text = [dict objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
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

- (void)hideWithAnimate:(BOOL)animate
{
    if (animate)
    {
        [UIView animateWithDuration:0.5 animations:^{
           
            self.x = -self.width;
            
        } completion:^(BOOL finished) {
            
            [self removeFromSuperview];
            
        }];
    }
}



@end
