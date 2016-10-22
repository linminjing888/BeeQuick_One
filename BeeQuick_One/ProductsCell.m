//
//  ProductsCell.m
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import "ProductsCell.h"
#import "BuyView.h"
#import "Goods.h"
@interface ProductsCell ()
// 商品的图片
@property (nonatomic,strong) UIImageView *goodsImageView;
// 商品名字
@property (nonatomic,strong) UILabel *nameLabel;
// 精选的图片
@property (nonatomic,strong) UIImageView *fineImageView;
// 买一赠一的图片
@property (nonatomic,strong) UIImageView *giveImageView;
// 商品单位
@property (nonatomic,strong) UILabel *specificsLabel;
// 选择数量
@property (nonatomic,strong) BuyView *buyView;

//// 折扣
//@property (nonatomic,strong) DiscountPriceView *discountPriceView;

@property (nonatomic,strong) UIView *lineView;
@end
@implementation ProductsCell

+ (instancetype)cellWithTable:(UITableView *)tableView {
    static NSString *cellId = @"ProductsCellID";
    ProductsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[ProductsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _goodsImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_goodsImageView];
        
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = kFont(13);
        [self.contentView addSubview:_nameLabel];
        
        _fineImageView = [[UIImageView alloc]init];
        [_fineImageView setImage:[UIImage imageNamed:@"jingxuan.png"]];
        [self.contentView addSubview:_fineImageView];
        
        _giveImageView = [[UIImageView alloc]init];
        [_giveImageView setImage:[UIImage imageNamed:@"buyOne.png"]];
        [self.contentView addSubview:_giveImageView];
        
        _specificsLabel = [[UILabel alloc]init];
        _specificsLabel.font = kFont(12);
        _specificsLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_specificsLabel];
        
        _buyView = [[BuyView alloc]init];
        [self.contentView addSubview:_buyView];
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = COLOR_Line;
        [self.contentView addSubview:_lineView];
        
        [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.leading.equalTo(self);
            make.width.mas_equalTo(self.mas_height);
            make.height.mas_equalTo(self.mas_height);
        }];
        
        [_fineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_goodsImageView.mas_trailing);
            make.top.equalTo(self).offset(10);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(15);
        }];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_fineImageView);
            make.leading.equalTo(_fineImageView.mas_trailing);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        [_giveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_fineImageView);
            make.top.equalTo(_fineImageView.mas_bottom).offset(2);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(15);
        }];
        [_specificsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_fineImageView);
            make.top.equalTo(_giveImageView.mas_bottom);
            make.trailing.equalTo(self);
            make.height.mas_equalTo(20);
        }];
        
        [_buyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-5);
            make.trailing.equalTo(self).offset(-5);
            make.width.mas_equalTo(75);
            make.height.mas_equalTo(25);
        }];
    
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.trailing.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}
-(void)setGoods:(Goods *)goods
{
//    NSLog(@"%@",goods.img);
    [self.goodsImageView setImageWithURLStr:goods.img placeholderImage:[UIImage imageNamed:@"v2_placeholder_square"]];
    self.nameLabel.text = goods.name;
    if ([goods.pm_desc isEqualToString:@"买一赠一"]) {
        self.giveImageView.hidden = NO;
    }else{
        self.giveImageView.hidden = YES;
    }
    self.specificsLabel.text = goods.specifics;
    self.buyView.goodNum = 0 ;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
