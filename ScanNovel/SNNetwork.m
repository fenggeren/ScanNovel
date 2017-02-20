//
//  SNNetwork.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/14.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "SNNetwork.h"
#import "SNSitesManager.h"
#import "AFNetworking/AFNetworking.h"
#import "AFNetworking/UIKit+AFNetworking.h"
#import "GDataXMLNode.h"

@interface SNNetwork ()
{
    AFHTTPSessionManager *_manager;
}
@end

@implementation SNNetwork

+ (instancetype)sharedInstance
{
    static SNNetwork *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        [instance configSessionManager];
    });
    return instance;
}

//// 获取给定小说信息
//- (void)getNovelWith:(NSString *)URL complete:(void(^)(NSError *, SNNovelModel *))complete;
//// 获取给定章节
//- (void)getChapterWith:(NSString *)URL complete:(void(^)(NSError *, SNChapterModel *))complete;
//// 关键字 搜索小说结果
//- (void)searchNovelsWith:(NSString *)name complete:(void(^)(NSError *, NSArray<SNNovelModel *> *))complete;;

// 下载给定小说
//- (void)downloadNovelWith:(SNNovelModel *)novel progress:(void(^)(float))progress complete:(void(^)(NSError *))complete;

// 下载给定小说内容
- (void)downloadNovelInfoWith:(NSString *)URL complete:(void(^)(NSError *, SNNovelModel *))complete
{
    [self asyncRequestDataWith:URL progress:NULL completeBlock:^(NSError *error, GDataXMLDocument *docu) {
        if (error) {
            complete(error, nil); return;
        }
        SNNovelModel *novel = [[SNSitesManager parserWithURL:URL] parseNovelWith:docu];
        complete(nil, novel);
    }];
}

// 下载给定章节内容
- (void)downloadChapterWith:(NSString *)URL complete:(void(^)(NSError *, NSString *))complete
{
    [self asyncRequestDataWith:URL progress:NULL completeBlock:^(NSError *error, GDataXMLDocument *docu) {
        if (error) {
            complete(error, nil); return;
        }
        NSString *chapter = [[SNSitesManager parserWithURL:URL] parseChapterWith:docu];
        complete(nil, chapter);
    }];
}

- (void)asyncRequestDataWith:(NSString *)url
               progress:(void (^)(NSProgress * _Nonnull))downloadProgressBlock
               completeBlock:(void(^)(NSError *error, GDataXMLDocument *docu))block
{
    [_manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downloadProgressBlock)downloadProgressBlock(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *xmlError = NULL;
        GDataXMLDocument *docu = [[GDataXMLDocument alloc] initWithHTMLData:responseObject error:&xmlError];
        block(xmlError, docu);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        block(error, nil);
        NSLog(@"%@", error);
    }];
}


#pragma mark - Helper

- (void)configSessionManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = serializer;
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    _manager = manager;
}


@end



