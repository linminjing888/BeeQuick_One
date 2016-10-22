//
//  ProductsController.h
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SuperMarketSource.h"
@protocol ProductsDelegate<NSObject>

- (void)willDislayHeaderView:(NSInteger)section;
- (void)didEndDislayHeaderView:(NSInteger)section;


@end

@interface ProductsController : UIViewController<CategoryTableViewDelagate>

@property (nonatomic,strong) SuperMarketData *superMarketData;
@property (nonatomic,weak) id<ProductsDelegate>delegate;
@end
