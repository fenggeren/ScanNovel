//
//  NSString+FGRExtension.m
//  FGRBook
//
//  Created by fenggeren on 16/9/16.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import "NSString+FGRExtension.h"

@implementation NSString (FGRExtension)

- (NSString *)stringWithHeader:(NSString *)header
{
    if ([self hasPrefix:header] == NO) {
        return [header stringByAppendingPathComponent:self];
    }
    return self;
}

- (NSString *)stringTrimHeaderTail
{
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


- (NSString* )alaboToChinese

{   NSString *str = self;
    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零"];
    NSArray *digits = @[@"个",@"十",@"百",@"千",@"万",@"十",@"百",@"千",@"亿",@"十",@"百",@"千",@"兆"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:chinese_numerals forKeys:arabic_numerals];
    
    NSMutableArray *sums = [NSMutableArray array];
    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *a = [dictionary objectForKey:substr];
        NSString *b = digits[str.length -i-1];
        NSString *sum = [a stringByAppendingString:b];
        if ([a isEqualToString:chinese_numerals[9]])
        {
            if([b isEqualToString:digits[4]] || [b isEqualToString:digits[8]])
            {
                sum = b;
                if ([[sums lastObject] isEqualToString:chinese_numerals[9]])
                {
                    [sums removeLastObject];
                }
            }else
            {
                sum = chinese_numerals[9];
            }
            
            if ([[sums lastObject] isEqualToString:sum])
            {
                continue;
            }
        }
        
        [sums addObject:sum];
    }
    
    NSString *sumStr = [sums  componentsJoinedByString:@""];
    NSString *chinese = [sumStr substringToIndex:sumStr.length-1];
    NSLog(@"%@ to %@",str,chinese);
    return chinese;
}

- (NSArray<NSString *> *)stringsByMatchedRegex:(NSString *)regex
{
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:NULL];
    NSArray *matches = [expression matchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)];

    NSMutableArray *array = [NSMutableArray array];
    for (NSTextCheckingResult *match in matches) {
        for (NSInteger i = 0; i < match.numberOfRanges; ++i) {
            NSString *component = [self substringWithRange:[match rangeAtIndex:i]];
            [array addObject:component];
        }
    }
    
    return array;
}

@end
