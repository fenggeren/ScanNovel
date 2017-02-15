//
//  NSTimer+FGRBlock.h
//  FGRBook
//
//  Created by fenggeren on 16/9/13.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Timer_Block)(NSTimer *);

@interface NSTimer (FGRBlock)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti userInfo:(id)userInfo repeats:(BOOL)yesOrNo handle:(Timer_Block)block;

@end
