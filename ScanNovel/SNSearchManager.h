//
//  SNSearchManager.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/22.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>


@class SNNovelModel;

@interface SNSearchManager : NSObject

+ (void)advancedSearchedWith:(NSString *)key complete:(void(^)(NSError *, SNNovelModel *))block;

+ (void)fuzzySearchedWith:(NSString *)key  complete:(void(^)(NSError *, NSArray<SNNovelModel *> *))block;


/**
 isAdvanced: 是否是精准搜索结果
 */
+ (void)searchedWith:(NSString *)key
            complete:(void(^)(NSError *err, BOOL isAdvanced, NSArray<SNNovelModel *> *novels))block;

@end
