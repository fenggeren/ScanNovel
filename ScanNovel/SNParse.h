//
//  SNParse.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/10.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>
 
@class SNNovelModel, SNChapterModel;

@protocol SNParse <NSObject>

+ (NSString *)parseName;

/* 解析小说信息 */
- (SNNovelModel *)parseNovelWith:(NSString *)html;
/* 解析章节信息 */
- (SNChapterModel *)parseChapterWith:(NSString *)html;

@end


@interface SNParse_BQG : NSObject<SNParse>

@end

@interface SNParse_520 : NSObject<SNParse>

@end



@interface SNParse : NSObject

+ (id<SNParse>)parseWithSite:(NSString *)siteName;

@end





