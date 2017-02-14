//
//  SNNetwork.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/14.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNNovelModel, SNChapterModel;

@interface SNNetwork : NSObject

+ (instancetype)sharedInstance;

// 获取给定小说信息
- (void)getNovelWith:(NSString *)URL complete:(void(^)(NSError *, SNNovelModel *))complete;
// 获取给定章节
- (void)getChapterWith:(NSString *)URL complete:(void(^)(NSError *, SNChapterModel *))complete;
// 关键字 搜索小说结果
- (void)searchNovelsWith:(NSString *)name complete:(void(^)(NSError *, NSArray<SNNovelModel *> *))complete;;

// 下载给定小说
- (void)downloadNovelWith:(SNNovelModel *)novel progress:(void(^)(float))progress complete:(void(^)(NSError *))complete;
// 下载给定小说内容
- (void)downloadNovelInfoWith:(NSString *)URL complete:(void(^)(NSError *, SNNovelModel *))complete;
// 下载给定章节内容
- (void)downloadChapterWith:(NSString *)URL complete:(void(^)(NSError *, SNChapterModel *))complete;


@end


