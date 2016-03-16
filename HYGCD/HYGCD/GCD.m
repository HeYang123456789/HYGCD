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

#pragma mark - 执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task inQueue:(dispatch_queue_t)queue{
    NSParameterAssert(task);
    dispatch_sync(queue, task);
}
+ (void)executeSyncTaskInMainQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_sync(mainQueue, task);
}
+ (void)executeSyncTaskInGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_sync(globalQueue, task);
}
+ (void)executeSyncTaskInHighPriorityGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_sync(globalHighPriorityQueue, task);
}
+ (void)executeSyncTaskInLowPriorityGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_sync(globalLowPriorityQueue, task);
}
+ (void)executeSyncTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_sync(globalBackgroundPriorityQueue, task);
}


#pragma mark - 执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task inQueue:(dispatch_queue_t)queue{
    NSParameterAssert(task);
    dispatch_async(queue, task);
}
+ (void)executeAsyncTaskInMainQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(mainQueue, task);
}
+ (void)executeAsyncTaskInGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalQueue, task);
}
+ (void)executeAsyncTaskInHighPriorityGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalHighPriorityQueue, task);
}
+ (void)executeAsyncTaskInLowPriorityGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalLowPriorityQueue, task);
}
+ (void)executeAsyncTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalBackgroundPriorityQueue, task);
}

#pragma mark - 在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTaskInMainQueue:(dispatch_block_t)task
                    afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), mainQueue, task);
}
+ (void)executeDelayTaskInGlobalQueue:(dispatch_block_t)task
                      afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalQueue, task);
}
+ (void)executeDelayTaskInHighPriorityGlobalQueue:(dispatch_block_t)task
                                  afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), \
                   globalHighPriorityQueue, task);
}
+ (void)executeDelayTaskInLowPriorityGlobalQueue:(dispatch_block_t)task
                                 afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), \
                   globalLowPriorityQueue, task);
}
+ (void)executeDelayTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task
                                        afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), \
                   globalBackgroundPriorityQueue, task);
}

#pragma mark - 和组相关
/// execute
+ (void)executeTaskInMainQueue:(dispatch_block_t)task
                            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, mainQueue, task);
}
+ (void)executeTaskInGlobalQueue:(dispatch_block_t)task
                              inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalQueue, task);
}
+ (void)executeTaskInHighPriorityGlobalQueue:(dispatch_block_t)task
                                          inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalHighPriorityQueue, task);
}
+ (void)executeTaskInLowPriorityGlobalQueue:(dispatch_block_t)task
                                         inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalLowPriorityQueue, task);
}
+ (void)executeTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task
                                                inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalBackgroundPriorityQueue, task);
}
///notify
+ (void)notifyTaskInMainQueue:(dispatch_block_t)task
                       inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, mainQueue, task);
}
+ (void)notifyTaskInGlobalQueue:(dispatch_block_t)task
                         inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalQueue, task);
}
+ (void)notifyTaskInHighPriorityGlobalQueue:(dispatch_block_t)task
                                     inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalHighPriorityQueue, task);
}
+ (void)notifyTaskInLowPriorityGlobalQueue:(dispatch_block_t)task
                                    inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalLowPriorityQueue, task);
}
+ (void)notifyTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task
                                           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalBackgroundPriorityQueue, task);
}

#pragma mark - 暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspendMainQueue{
    dispatch_suspend(mainQueue);
}
+ (void)suspendGlobalQueue{
    dispatch_suspend(globalQueue);
}
+ (void)suspendGlobalLowPriorityQueue{
    dispatch_suspend(globalLowPriorityQueue);
}
+ (void)suspendGlobalHighPriorityQueue{
    dispatch_suspend(globalHighPriorityQueue);
}
+ (void)suspendGlobalBackgroundPriorityQueue{
    dispatch_suspend(globalBackgroundPriorityQueue);
}
+ (void)resumeMainQueue{
    dispatch_resume(mainQueue);
}
+ (void)resumeGlobalQueue{
    dispatch_resume(globalQueue);
}
+ (void)resumeGlobalLowPriorityQueue{
    dispatch_resume(globalLowPriorityQueue);
}
+ (void)resumeGlobalHighPriorityQueue{
    dispatch_resume(globalHighPriorityQueue);
}
+ (void)resumeGlobalBackgroundPriorityQueue{
    dispatch_resume(globalBackgroundPriorityQueue);
}

#pragma mark - 一次性函数
static dispatch_once_t onceToken;
+ (void)executeOnceTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_once(&onceToken, task);
}


@end
