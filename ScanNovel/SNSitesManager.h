//
//  SNSitesManager.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/15.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNParseProtocol.h"


@interface SNSiteModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *URL;
@property (nonatomic, assign) Class parseClass;
@property (nonatomic, copy) NSString *searchURL;
@end



@interface SNSitesManager : NSObject

+ (NSArray *)sites;

+ (SNSiteModel *)siteModelWith:(Class)cls;

+ (id<SNParse>)parserWithURL:(NSString *)URL;

+ (NSString *)searchURLWith:(NSString *)key forSite:(NSString *)site;

@end
