//
//  NSString+FGRExtension.h
//  FGRBook
//
//  Created by fenggeren on 16/9/16.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FGRExtension)

- (NSString *)stringWithHeader:(NSString *)header;

- (NSString *)stringTrimHeaderTail;

- (NSString* )alaboToChinese;


- (NSArray<NSString *> *)stringsByMatchedRegex:(NSString *)regex;
@end
