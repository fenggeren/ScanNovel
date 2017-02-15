//
//  UIImage+FGRExtension.h
//  FGRBook
//
//  Created by fenggeren on 16/9/17.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FGRExtension)

//+ (instancetype)imageWithColor:(UIColor *)color;
+ (instancetype)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha;

- (UIImage *)imageWithSize:(CGSize)size;

- (UIImage *)imageWithSize:(CGSize)size cornerRadius:(CGFloat)radius;

- (void)clipCornerRadius:(CGFloat)radius withSize:(CGSize)size completeBlock:(void(^)(UIImage *img))block;
@end
