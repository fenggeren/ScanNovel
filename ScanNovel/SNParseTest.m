//
//  SNParseTest.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/20.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "SNParseTest.h"
#import "SNNetwork.h"
#import "NSString+FGRExtension.h"
#import "SNParse.h"

@implementation SNParseTest


+ (void)testParseSearch
{
    
    
    [[SNNetwork sharedInstance] asyncRequestDataWith:@"http://zhannei.baidu.com/cse/search?q=%E5%9C%A3%E5%A2%9F&entry=1&s=8353527289636145615&srt=def&nsid=0" progress:NULL completeBlock:^(NSError *error, GDataXMLDocument *docu) {
        [[SNParse_BQG new] parseSearchedNovelsWith:docu];
    }];
}

+ (void)testURL
{
    [[SNNetwork sharedInstance] asyncRequestDataWith:[NSString stringWithFormat:@"http://www.79xs.com/Book/Search.aspx?SearchKey=%@&SearchClass=1", [@"圣皇" urlGB2312Encode]] progress:^(NSProgress *progress) {
        
    } completeBlock:^(NSError *error, GDataXMLDocument *docu) {
        
    }];
}

+ (void)testBQGParse
{
    [self _downloadNovelInfo_BQG];
    [self _downloadChapter_BQG];
}

+ (void)_downloadNovelInfo_BQG
{
    [[SNNetwork sharedInstance] downloadNovelInfoWith:@"http://www.biquge.com/43_43821/" complete:^(NSError *error, SNNovelModel *model) {
        NSLog(@"%@---%@", error, model);
    }];
}

+ (void)_downloadChapter_BQG
{
    [[SNNetwork sharedInstance] downloadChapterWith:@"http://www.biquge.com/0_168/1214392.html" complete:^(NSError *error, NSString *content) {
        NSLog(@"%@", content);
    }];
}

@end
