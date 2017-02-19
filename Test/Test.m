//
//  Test.m
//  Test
//
//  Created by fenggeren on 2017/2/17.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "SNParse.h"
#import "SNNetwork.h"
#import "SNSitesManager.h"
#import "NSString+FGRExtension.h"

@interface Test : XCTestCase

@end

@implementation Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRegexString
{
    NSString *str = @"http://www.biquge.com/笔趣阁";
    NSArray *result = [str stringsByMatchedRegex:@".*/.*/"];
    NSLog(@"\n=====================\n%@\n=====================\n", result);
}

- (void)testSitesManager
{
    NSArray *sites = [SNSitesManager sites];
    for (SNSiteModel *site in sites) {
        NSLog(@"%@", site);
        NSLog(@"\n=====================\n%@\n=====================\n", [SNSitesManager parserWithURL:[site.URL stringByAppendingPathComponent:@"人道至尊"]]);
    }
    
    
}

- (void)testBQG
{
    [[SNNetwork sharedInstance] downloadNovelInfoWith:@"http://www.biquge.com/43_43821/" complete:^(NSError *error, SNNovelModel *model) {
        NSLog(@"%@---%@", error, model);
    }];
}


@end
