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

@implementation SNParseTest

+ (void)testURL
{
    [[SNNetwork sharedInstance] asyncRequestDataWith:[NSString stringWithFormat:@"http://www.79xs.com/Book/Search.aspx?SearchKey=%@&SearchClass=1", [@"圣皇" urlEncode]] progress:^(NSProgress *progress) {
        
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
