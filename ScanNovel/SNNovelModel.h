//
//  SNNovelModel.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/14.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNNovelModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *lastUpdateDate;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *URL;
@property (nonatomic, copy) NSString *imgURL;
@property (nonatomic, strong) NSArray *chapters;


@property (nonatomic, assign) NSInteger viewChapterIndex;
@property (nonatomic, assign) NSInteger viewChapterPageIndex;

// 解析网站
@property (nonatomic, copy) NSString *parseSiteBaseURL;

@end






