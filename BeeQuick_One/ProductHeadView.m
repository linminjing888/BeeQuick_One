//
//  ProductHeadView.m
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import "ProductHeadView.h"

@interface ProductHeadView()
@property (nonatomic,strong) UILabel *titleView;
@end
@implementation ProductHeadView

+ (instancetype)headerCellWith:(UITableView *)tableView {
    ProductHeadView *headerCell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (headerCell == nil) {
        headerCell = [[ProductHeadView alloc]initWithReuseIdentifier:@"header"];
    }
    return headerCell;
}
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithReuseIdentifier:reuseIdentifier])
    {
        self.contentView.backgroundColor = COLOR_BG;
        _titleView = [[UILabel alloc]init];
        _titleView.backgroundColor = [UIColor clearColor];
        _titleView.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1.0];
        _titleView.font = kFont(13);
        [self.contentView addSubview:_titleView];
        [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.leading.equalTo(self).offset(10);
        }];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    self.titleView.text = title;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
