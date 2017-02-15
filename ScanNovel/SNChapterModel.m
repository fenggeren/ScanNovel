//
//  SNChapterModel.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/14.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "SNChapterModel.h"

@implementation SNChapterModel

- (BOOL)isEqual:(SNChapterModel *)object
{
    return [self.URL isEqualToString:object.URL];
}

- (NSUInteger)hash
{
    return [self.URL hash];
}

@end
