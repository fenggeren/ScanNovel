
//
//  SNSite_BQG.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/15.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNParse.h"
#import "SNChapterModel.h"
#import "SNNovelModel.h"
#import "GDataXMLNode.h"
#import "NSString+FGRExtension.h"

@implementation SNParse_BQG

+ (NSString *)parseName
{
    return @"笔趣阁";
}

/* 解析小说信息 */
- (SNNovelModel *)parseNovelWith:(GDataXMLDocument *)html
{
    SNNovelModel *novel = [[SNNovelModel alloc] init];
    [self parseInfoForNovel:novel withDoc:html];
    [self parseChaptersForNovel:novel withDoc:html];
    return novel;
}

/* 解析章节信息 */
- (NSString *)parseChapterWith:(GDataXMLDocument *)html
{
    GDataXMLElement *ele = (GDataXMLElement *)[html firstNodeForXPath:@"//*[@id='content']" error:NULL];
    NSString *content = [ele.stringValue copy];
    NSRange range = [content rangeOfString:@"readx();"];
    if (range.location != NSNotFound) {
        content = [content substringFromIndex:range.location + range.length];
    }
    [content stringTrimHeaderTail];
    content = [content stringByReplacingOccurrencesOfString:@"    " withString:@"\n        "];
    content = [NSString stringWithFormat:@"    %@", content];
    
    return content;
}


- (void)parseInfoForNovel:(SNNovelModel *)novel withDoc:(GDataXMLDocument *)doc
{
    novel.imgURL = [(GDataXMLElement *)[doc firstNodeForXPath:@"//*[@id='fmimg']/img/@src" error:NULL] stringValue];
    
    GDataXMLElement *infoEle = (GDataXMLElement *)[doc firstNodeForXPath:@"//div[@id='info']" error:NULL];
    
    novel.name = [[infoEle firstNodeForXPath:@"h1" error:NULL] stringValue];
    NSString *auth = [[infoEle firstNodeForXPath:@"p" error:NULL] stringValue];
    novel.author = [[auth componentsSeparatedByString:@":"] lastObject];
    NSString *nudpateDate = [[infoEle firstNodeForXPath:@"p[3]" error:NULL] stringValue];
    
//    if ([nudpateDate isEqualToString:self.updateDate] == NO && self.updateDate != nil) {
//        self.update = YES;
//    }
    novel.lastUpdateDate = nudpateDate;
    
    NSString *info = [[doc firstNodeForXPath:@"//*[@id='intro']/p" error:NULL] stringValue];
    if (!info) {
        GDataXMLElement *infos = (GDataXMLElement *)[doc firstNodeForXPath:@"//*[@id='intro']" error:NULL];
        NSMutableString *infoM = [NSMutableString string];
        for (GDataXMLElement *ele in infos.children) {
            NSString *paragraph = ele.stringValue;
            if (paragraph && paragraph.length != 0) {
                [infoM appendFormat:@"    %@\n", [paragraph stringTrimHeaderTail]];
            }
        }
        info = [infoM copy];
    }
    novel.info = info;
}


// TODO.
// 有重复章节 需要剔除掉
- (void)parseChaptersForNovel:(SNNovelModel *)novel withDoc:(GDataXMLDocument *)doc
{
    NSArray *nodes = [doc nodesForXPath:@"//*[@id='list']/dl/dd" error:NULL];
    NSMutableArray *chapters = [NSMutableArray array];
    for (GDataXMLElement *ele in nodes) {
        NSString *name = [ele stringValue];
        GDataXMLElement *aEle = (GDataXMLElement *)[ele firstNodeForXPath:@"a" error:NULL];
        NSString *URL = [[aEle attributeForName:@"href"] stringValue];
        SNChapterModel *chapter = [[SNChapterModel alloc] init];
        chapter.title = name;
        chapter.URL = URL;
        [chapters addObject:chapter];
    }
    novel.chapters = [self removeRepeatedFor:chapters];
}

//  [10,9,8,7,0,1,2,3,4,5,6,7,8,9,10]  笔趣阁小说目录获取数组
// 默认会重复最后的9章
- (NSArray *)removeRepeatedFor:(NSMutableArray<SNChapterModel *> *)chapters
{
    NSInteger repeatedNum = 0;
    do {
        if (chapters.count < repeatedNum * 2) break;
        if (![chapters[repeatedNum] isEqual:chapters[chapters.count - repeatedNum - 1]]) {
            break;
        }
        repeatedNum++;
    } while (true);
    
    return [chapters subarrayWithRange:NSMakeRange(repeatedNum, chapters.count - repeatedNum)];
}

- (NSArray<SNNovelModel *> *)parseSearchedNovelsWith:(GDataXMLDocument *)html
{
    return nil;
}

@end









