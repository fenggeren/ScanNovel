//
//  UIImage+FGRExtension.m
//  FGRBook
//
//  Created by fenggeren on 16/9/17.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import "UIImage+FGRExtension.h"

@implementation UIImage (FGRExtension)



+ (instancetype)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(1, 1), NO, [UIScreen mainScreen].scale);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGColorRef colorRef = CGColorCreateCopyWithAlpha(color.CGColor, alpha);
    CGContextSetFillColorWithColor(ctx, colorRef);
    CGContextFillRect(ctx, CGRectMake(0, 0, 1, 1));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    CGColorRelease(colorRef);
    UIGraphicsEndImageContext();
    return img;
}


- (UIImage *)imageWithSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)imageWithSize:(CGSize)size cornerRadius:(CGFloat)radius
{
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    UIBezierPath *bp = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    [bp addClip];
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)clipCornerRadius:(CGFloat)radius withSize:(CGSize)size completeBlock:(void(^)(UIImage *img))block
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *img = [self imageWithSize:size cornerRadius:radius];
        dispatch_async(dispatch_get_main_queue(), ^{
            block(img);
        });
    });
}

@end






