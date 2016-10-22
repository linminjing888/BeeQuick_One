//
//  BuyView.m
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import "BuyView.h"

@interface BuyView ()
/** 加号按钮 */
@property (nonatomic,strong) UIButton *addGoodsButton;
/** 减号按钮 */
@property (nonatomic,strong) UIButton *reduceGoodsButton;
/** 数量label */
@property (nonatomic,strong) UILabel *countLabel;
/** 购买商品的数量  */
@property (nonatomic,assign) NSInteger buyNumber;
@end
@implementation BuyView

- (instancetype)init {
    self = [super init];
    if (self)
    {
        _addGoodsButton = [[UIButton alloc]init];
        [_addGoodsButton setImage:[UIImage imageNamed:@"v2_increase"] forState:UIControlStateNormal];
        [_addGoodsButton addTarget:self action:@selector(addButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_addGoodsButton];
        
        _countLabel = [[UILabel alloc]init];
        _countLabel.text = @"0";
        _countLabel.font = kFont(14);
        _countLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_countLabel];
        
        _reduceGoodsButton = [[UIButton alloc]init];
        [_reduceGoodsButton setImage:[UIImage imageNamed:@"v2_reduce"] forState:UIControlStateNormal];
        [_reduceGoodsButton addTarget:self action:@selector(reduceButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_reduceGoodsButton];
        
        [_reduceGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(self.mas_height);
        }];
        
        [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_reduceGoodsButton.mas_trailing).offset(3);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.trailing.equalTo(_addGoodsButton.mas_leading).offset(-2);
        }];
        [_addGoodsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.width.mas_equalTo(self.mas_height);
        }];
    }
    
    return self;
}
-(void)setGoodNum:(NSInteger)goodNum
{
    _goodNum = goodNum;
    self.buyNumber = goodNum;
}
-(void)setBuyNumber:(NSInteger)buyNumber
{
    _buyNumber = buyNumber;
    if (buyNumber == 0)
    {
        self.reduceGoodsButton.hidden = YES;
        self.countLabel.hidden = YES ;
    }else
    {
        self.countLabel.text = [NSString stringWithFormat:@"%ld",(long)buyNumber];
        self.reduceGoodsButton.hidden = NO;
        self.countLabel.hidden = NO;
    }
}

-(void)addButtonCliked:(UIButton*)btn
{
    self.buyNumber++;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.buyNumber];
}
-(void)reduceButtonCliked:(UIButton*)btn
{
    if (self.buyNumber<=0)
    {
        return;
    }
    
    self.buyNumber--;
    self.countLabel.text = [NSString stringWithFormat:@"%ld",self.buyNumber];
//    if (self.buyNumber==0)
//    {
//        self.reduceGoodsButton.hidden = YES;
//        self.countLabel.hidden = YES;
//    }else
//    {
//        self.countLabel.text = [NSString stringWithFormat:@"%ld",self.buyNumber];
//    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
