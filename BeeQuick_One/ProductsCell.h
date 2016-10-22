//
//  ProductsCell.h
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Goods;
@interface ProductsCell : UITableViewCell


+ (instancetype)cellWithTable:(UITableView *)tableView;

@property (nonatomic,strong)Goods * goods;
@end
