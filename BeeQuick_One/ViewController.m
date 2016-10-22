//
//  ViewController.m
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import "ViewController.h"
#import "ProductsController.h"
#import "CategoryCell.h"
#import "SuperMarketSource.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ProductsDelegate>
@property (nonatomic,strong) UITableView * categoriesTableView;
@property (nonatomic,strong) ProductsController *productsController;
@property (nonatomic,strong) SuperMarketData * superMarketData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =COLOR_YELLOW;
    
    [self setUpcategoriesTableView];
    
    [self setUpProductsTableView];
    
    [self loadData];
}
-(void)loadData
{
    WEAKSELf
    [SuperMarketSource loadSupermarketData:^(id data, NSError *error) {
        weakSelf.superMarketData = data;
        [weakSelf.categoriesTableView reloadData];
        [weakSelf.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        self.productsController.superMarketData =data;
    }];
}
-(void)setUpcategoriesTableView
{
    self.categoriesTableView = ({
        UITableView *tabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tabView.delegate = self;
        tabView.dataSource = self;
        tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tabView.backgroundColor = COLOR_BG;
        tabView.showsVerticalScrollIndicator = NO;
        tabView;
    });
    [self.view addSubview:self.categoriesTableView];
    [self.categoriesTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.width.mas_equalTo(self.view).multipliedBy(0.25);
    }];
}
-(void)setUpProductsTableView
{
    self.productsController = [[ProductsController alloc]init];
    [self addChildViewController:self.productsController];
    [self.view addSubview:self.productsController.view];
    self.delegate = self.productsController;
    self.productsController.delegate =self;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.superMarketData.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [CategoryCell cellWithTable:tableView];
    cell.categroies = self.superMarketData.categories[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didTableView:clickedAtIndexPath:)]) {
        [self.delegate didTableView:self.categoriesTableView clickedAtIndexPath:indexPath];
    }
}

#pragma mark  ProductsDelegate

- (void)willDislayHeaderView:(NSInteger)section
{
    [self.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
- (void)didEndDislayHeaderView:(NSInteger)section
{
    [self.categoriesTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section+1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
