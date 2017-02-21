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
}

+ (SNSiteModel *)siteWith:(NSDictionary *)dict
{
    return [self siteWith:dict[@"name"] URL:dict[@"URL"] parseClass:dict[@"class"] searchURL:dict[@"searchURL"]];
}

+ (SNSiteModel *)siteWith:(NSString *)name URL:(NSString *)URL parseClass:(NSString *)parseClass searchURL:(NSString *)searchURL
{
    SNSiteModel *site = [[self alloc] init];
    site.name = name;
    site.URL = URL;
    site.parseClass = NSClassFromString([NSString stringWithFormat:@"SNParse_%@", parseClass]);
    site.searchURL = searchURL;
    return site;
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

+ (SNSiteModel *)siteModelWith:(Class)cls
{
    for (SNSiteModel *site in [self.class sites]) {
        if (site.parseClass == cls) {
            return site;
        }
    }
    return nil;
}


+ (id<SNParse>)parserWithURL:(NSString *)URL
{
    SNSiteModel *site = [self __siteModelWithURL:URL];
    if (site) {
        return [[site.parseClass alloc] init];
    }
    return nil;
}

+ (NSString *)searchURLWith:(NSString *)key forSite:(NSString *)site
{
    SNSiteModel *sm = [self __siteModelWithURL:site];
    if (sm) {
        return [(id<SNSearchURLProtocol>)sm.parseClass searchURLWith:key];
    }
    return nil;
}


+ (SNSiteModel *)__siteModelWithURL:(NSString *)URL
{
    for (SNSiteModel *site in [self.class sites]) {
        if ([URL containsString:site.URL]) {
            return site;
        }
    }
    return nil;
}

@end
