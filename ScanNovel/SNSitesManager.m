//
//  SNSitesManager.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/15.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "SNSitesManager.h"

@implementation SNSiteModel


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


@end
