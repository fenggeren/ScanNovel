//
//  SNSitesManager.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/15.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "SNSitesManager.h"
#import "NSString+FGRExtension.h"

#define kSiteURLGegex  @"/\\w.*\\w/"


@implementation SNSiteModel
{
    NSString *_URLSite;
}

+ (SNSiteModel *)siteWith:(NSDictionary *)dict
{
    return [self siteWith:dict[@"name"] URL:dict[@"URL"] parseClass:dict[@"class"]];
}

+ (SNSiteModel *)siteWith:(NSString *)name URL:(NSString *)URL parseClass:(NSString *)parseClass
{
    SNSiteModel *site = [[self alloc] init];
    site.name = name;
    site.URL = URL;
    site.parseClass = [NSString stringWithFormat:@"SNParse_%@", parseClass];
    return site;
}

- (NSString *)URLSite
{
    if (!_URLSite) {
        _URLSite = [_URL stringsByMatchedRegex:kSiteURLGegex].firstObject;
    }
    return _URLSite;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name: %@, \n URL: %@, \n parseClass: %@", _name, _URL, _parseClass];
}

@end


@implementation SNSitesManager


+ (NSArray *)sites
{
    static NSArray *siteModels;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *url = [[NSBundle mainBundle] pathForResource:@"Sites" ofType:@"plist"];
        NSArray *sites = [NSArray arrayWithContentsOfFile:url];
        NSMutableArray *models = [NSMutableArray arrayWithCapacity:sites.count];
        for (NSDictionary *dict in sites) {
            [models addObject:[SNSiteModel siteWith:dict]];
        }
        siteModels = [models copy];
    });
    return siteModels;
}



+ (id<SNParse>)parserWithURL:(NSString *)URL
{
//    URL = [URL stringsByMatchedRegex:kSiteURLGegex].firstObject;
    for (SNSiteModel *site in [self.class sites]) {
        if ([URL containsString:site.URL]) {
            return [[NSClassFromString(site.parseClass) alloc] init];
        }
    }
    return nil;
}




@end
