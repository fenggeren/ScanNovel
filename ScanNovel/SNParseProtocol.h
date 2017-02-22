//
//  SNParseProtocol.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/19.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNNovelModel, SNChapterModel;
@class GDataXMLDocument;

@protocol SNParse <NSObject>

+ (NSString *)parseName;

/* 解析小说信息 */
- (SNNovelModel *)parseNovelWith:(GDataXMLDocument *)html;
/* 解析章节内容 */
- (NSString *)parseChapterWith:(GDataXMLDocument *)html;

@optional
// 解析搜索网页获取的 所有小说。
// TODO. 搜索结果可能会有多页。  -- 建立搜索结果模型，含下一页网址，用于加载更多？
- (NSArray<SNNovelModel *> *)parseSearchedNovelsWith:(GDataXMLDocument *)html;

@end


// 模糊搜索协议, 返回包含指定key的 所有小说名称结果的 URL
@protocol SNFuzzySearchedURLProtocol <NSObject>

+ (NSString *)fuzzySearchedURLWith:(NSString *)key;

@end


// 精准搜索结果 返回指定小说的 URL 可能为nil
@protocol SNAdvancedSearchedURLProtocol <NSObject>

+ (NSString *)advancedSearchedURLWith:(NSString *)key;

@end



