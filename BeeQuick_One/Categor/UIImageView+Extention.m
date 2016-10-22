//
//  UIImageView+Extention.m
//  BeeQuick_One
//
//  Created by MinJing_Lin on 16/10/22.
//  Copyright © 2016年 MinJing_Lin. All rights reserved.
//

#import "UIImageView+Extention.h"
#import "UIImageView+WebCache.h"
@implementation UIImageView (Extention)

- (void)setImageWithURLStr:(NSString *)url placeholderImage:(UIImage *)placeholderImage
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage];
}
@end
