//
//  ProductsController.m
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import "ProductsController.h"
#import "ProductsCell.h"
#import "ProductHeadView.h"
#import "LMJRefreshHeader.h"
@interface ProductsController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * productsTableView;
//判断是否从下往上滑
@property (nonatomic) BOOL isScrollDown;
//记录上次滑动位置
@property (nonatomic) CGFloat lastOffsetY;
@end

@implementation ProductsController

-(void)loadView
{
    self.view = [[UIView alloc]initWithFrame:CGRectMake(LSCREENW * 0.25, 64, LSCREENW * 0.75, LSCREENH - 64)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpProductsTableView];
}

-(void)setUpProductsTableView
{
    self.productsTableView = ({
        UITableView *tabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tabView.delegate = self;
        tabView.dataSource = self;
        tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tabView.backgroundColor = COLOR_BG;
        tabView.showsVerticalScrollIndicator = NO;
        tabView;
    });
    [self.view addSubview:self.productsTableView];
    [self.productsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    LMJRefreshHeader * header =[LMJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerFresh)];
    self.productsTableView.mj_header  = header;
}
-(void)headerFresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.productsTableView.mj_header endRefreshing];
    });
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.superMarketData.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.superMarketData.categories[section].products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductsCell *cell = [ProductsCell cellWithTable:tableView];
    cell.goods = self.superMarketData.categories[indexPath.section].products[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 25;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ProductHeadView * head =[ProductHeadView headerCellWith:tableView];
    head.title =self.superMarketData.categories[section].name ;
    return head;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (!self.isScrollDown && tableView.dragging && [self.delegate respondsToSelector:@selector(willDislayHeaderView:)])
    {
        [self.delegate willDislayHeaderView:section];
    }
}
-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (self.isScrollDown && tableView.dragging && [self.delegate respondsToSelector:@selector(didEndDislayHeaderView:)])
    {
        [self.delegate didEndDislayHeaderView:section];
    }
}
#pragma scorllView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.isScrollDown = self.lastOffsetY < scrollView.contentOffset.y;
    self.lastOffsetY = scrollView.contentOffset.y;
    
}

#pragma mark CategoryTableViewDelagate
- (void)didTableView:(UITableView *)tableView clickedAtIndexPath:(NSIndexPath*)indexPath;
{
    [self.productsTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] animated:YES scrollPosition:UITableViewScrollPositionTop];
}
- (void)setSuperMarketData:(SuperMarketData *)superMarketData {
    _superMarketData = superMarketData;
    [self.productsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
