//
//  GCD.m
//  HYGCD
//
//  Created by HEYANG on 16/3/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//
//  http://www.cnblogs.com/goodboy-heyang
//  https://github.com/HeYang123456789
//

#import "GCD.h"

@implementation GCD


/**
 *  执行同步任务
 */
+ (void)executeSyncTask:(dispatch_block_t)task inQueue:(dispatch_queue_t)queue{
    dispatch_sync(queue, task);
}

+ (void)executeInMainQueueWithSyncTask:(dispatch_block_t)task{
    dispatch_sync(mainQueue, task);
}

+ (void)executeInGlobalQueueWithSyncTask:(dispatch_block_t)task{
    dispatch_sync(globalQueue, task);
}

/**
 *  执行异步任务
 */
+ (void)executeAsyncTask:(dispatch_block_t)task inQueue:(dispatch_queue_t)queue{
    dispatch_async(queue, task);
}

+ (void)executeInMainQueueWithAsyncTask:(dispatch_block_t)task{
    dispatch_async(mainQueue, task);
}

+ (void)executeInGlobalQueueWithAsyncTask:(dispatch_block_t)task{
    dispatch_async(globalQueue, task);
}


@end
