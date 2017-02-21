//
//  SNParse.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/10.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNParseProtocol.h"


@interface SNParse_BQG : NSObject<SNSiteProtocol>

@end

@interface SNParse_520 : NSObject<SNSiteProtocol>

@end

@interface SNParse_SHH : NSObject<SNSiteProtocol>

@end

@interface SNParse_LW : NSObject<SNSiteProtocol>

@end

@interface SNParse_MP : NSObject<SNSiteProtocol>

@end


// http://www.hunhun520.com/book/%@/   key是其拼音直接转到搜索小说不用搜索--
@interface SNParse_HH : NSObject<SNSiteProtocol>

@end

@interface SNParse_QK : NSObject<SNSiteProtocol>

@end


// http://www.snwx.com/modules/article/search.php?searchkey=%@   unicode url编码
@interface SNParse_SN : NSObject<SNSiteProtocol>

@end


////////////////////////////////////////////////////////////////////////////////////////
// 搜索不能解析。 故舍弃该网站
@interface SNParse_LDW : NSObject<SNSiteProtocol>

@end

@interface SNParse_DH : NSObject<SNSiteProtocol>

@end
////////////////////////////////////////////////////////////////////////////////////////////////////////

@interface SNParse : NSObject

+ (id<SNParse>)parseWithSite:(NSString *)siteName;

@end





