//
//  ViewController.h
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CategoryTableViewDelagate <NSObject>

- (void)didTableView:(UITableView *)tableView clickedAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface ViewController : UIViewController

@property (nonatomic,weak) id<CategoryTableViewDelagate>delegate;
@end

