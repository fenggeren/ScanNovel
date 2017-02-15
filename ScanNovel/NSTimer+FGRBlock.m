//
//  NSTimer+FGRBlock.m
//  FGRBook
//
//  Created by fenggeren on 16/9/13.
//  Copyright © 2016年 fenggeren. All rights reserved.
//

#import "NSTimer+FGRBlock.h"
#import <objc/runtime.h>
 

@implementation NSTimer (FGRBlock)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti userInfo:(id)userInfo repeats:(BOOL)yesOrNo handle:(Timer_Block)block
{
    __weak __typeof__(self)weakTarget = self;
    NSTimer *timer = [self scheduledTimerWithTimeInterval:ti target:weakTarget selector:@selector(_fgr_timerHandler:) userInfo:userInfo repeats:yesOrNo];
    [timer _set_runtime_TimeHandlerBlock:block];
    return timer;
}

+ (void)_fgr_timerHandler:(NSTimer *)timer
{
    Timer_Block blk = [timer _get_runtime_TimerHandlerBlock];
    if (blk) {
        blk(timer);
    }
}


- (Timer_Block)_get_runtime_TimerHandlerBlock
{
    return objc_getAssociatedObject(self, @selector(_get_runtime_TimerHandlerBlock));
}

- (void)_set_runtime_TimeHandlerBlock:(Timer_Block)block
{
    objc_setAssociatedObject(self, @selector(_get_runtime_TimerHandlerBlock), block, OBJC_ASSOCIATION_COPY);
}

@end
