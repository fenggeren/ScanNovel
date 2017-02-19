//
//  SNParse.h
//  ScanNovel
//
//  Created by fenggeren on 2017/2/10.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNParseProtocol.h"


@interface SNParse_BQG : NSObject<SNParse>

@end

@interface SNParse_520 : NSObject<SNParse>

@end

@interface SNParse_SHH : NSObject<SNParse>

@end

@interface SNParse_LW : NSObject<SNParse>

@end

@interface SNParse_MP : NSObject<SNParse>

@end

@interface SNParse_LDW : NSObject<SNParse>

@end

@interface SNParse_QK : NSObject<SNParse>

@end


@interface SNParse_HH : NSObject<SNParse>

@end

@interface SNParse_SN : NSObject<SNParse>

@end

@interface SNParse_DH : NSObject<SNParse>

@end


@interface SNParse : NSObject

+ (id<SNParse>)parseWithSite:(NSString *)siteName;

@end





