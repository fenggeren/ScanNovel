//
//  UIColor+FGRExtension.m
//  FGRBook
//
//  Created by fenggeren on 16/9/17.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import "UIColor+FGRExtension.h"

@implementation UIColor (FGRExtension)


+ (instancetype)colorWithNodecimalRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [self colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:alpha];
}
@end
