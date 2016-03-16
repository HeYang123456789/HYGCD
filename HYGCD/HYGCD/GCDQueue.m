//
//  GCDQueue.m
//  HYGCD
//
//  Created by HEYANG on 16/3/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//
//  http://www.cnblogs.com/goodboy-heyang
//  https://github.com/HeYang123456789
//


#import "GCDQueue.h"


@implementation GCDQueue
+ (void)initialize{
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - 获取各个队列

+ (void)excuteTask:(dispatch_block_t)task inQueue:(dispatch_queue_t)queue{
    
}

@end
