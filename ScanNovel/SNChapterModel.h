//
//  SNChapterModel.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/14.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNChapterModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

// 小说源 改变时， 章节URL也会随之改变，
// 那么加载小说内容时，如果无网络切已经缓存好内容，直接显示该缓存内容
// 否则 从新源 网络加载内容。
@property (nonatomic, copy) NSString *URL;



@end
