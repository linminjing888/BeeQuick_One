//
//  CategoryCell.h
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperMarketSource.h"
@interface CategoryCell : UITableViewCell

+ (instancetype)cellWithTable:(UITableView *)tableView;

@property (nonatomic,strong)ProductCategory *categroies;
@end
