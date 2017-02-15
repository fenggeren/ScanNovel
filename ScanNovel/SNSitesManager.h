//
//  SNSitesManager.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/15.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNSiteModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *URL;
@property (nonatomic, copy) NSString *parseClass;

@end



@interface SNSitesManager : NSObject

+ (NSArray *)sites;

@end
