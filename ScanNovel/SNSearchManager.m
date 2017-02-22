//
//  SNSearchManager.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/22.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "SNSearchManager.h"

@implementation SNSearchManager

+ (void)advancedSearchedWith:(NSString *)key complete:(void (^)(NSError *, SNNovelModel *))block
{
    
}

+ (void)fuzzySearchedWith:(NSString *)key complete:(void (^)(NSError *, NSArray<SNNovelModel *> *))block
{
    
}


+ (void)searchedWith:(NSString *)key complete:(void (^)(NSError *, BOOL, NSArray<SNNovelModel *> *))block
{
    [self advancedSearchedWith:key complete:^(NSError *err, SNNovelModel *novel) {
        if (err) {
            [self fuzzySearchedWith:key complete:^(NSError *err, NSArray<SNNovelModel *> *novels) {
                block(nil, NO, novels);
            }];
        } else {
            block(nil, YES, @[novel]);
        }
    }];
}

@end
