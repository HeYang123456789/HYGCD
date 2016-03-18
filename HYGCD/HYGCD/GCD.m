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

  /////////////////////类：GCD///////////////////////
@implementation GCD

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue{
    NSParameterAssert(task);
    dispatch_sync(queue.dispatchQueue, task);
}

#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue{
    NSParameterAssert(task);
    dispatch_async(queue.dispatchQueue, task);
}

#pragma mark 和组相关
+ (void)executeTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue
                                           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, queue.dispatchQueue, task);
}

+ (void)notifyTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue
            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, queue.dispatchQueue, task);
}

#pragma mark  一次性函数
//+ (void)executeOnceTask:(dispatch_block_t)task{
//    NSParameterAssert(task);
//    GCDExecOnce(task);
//}

@end

  /////////////////////类：MainQueue///////////////////////

@implementation MainQueue

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    // 如果当前队列是主队列，要提示奔溃处理
    dispatch_sync(mainQueue, task);
}
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(mainQueue, task);
}
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), mainQueue, task);
}
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, mainQueue, task);
}
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, mainQueue, task);
}
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend{
    dispatch_suspend(mainQueue);
}
+ (void)resume{
    dispatch_resume(mainQueue);
}
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count{
    NSParameterAssert(task);
    dispatch_apply(count, mainQueue, task);
}
@end

  ////////////////////类：GlobalQueue////////////////////////

@implementation GlobalQueue

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    // 如果当前队列是主队列，要提示奔溃处理
    dispatch_sync(globalQueue, task);
}
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalQueue, task);
}
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalQueue, task);
}
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalQueue, task);
}
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalQueue, task);
}
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend{
    dispatch_suspend(globalQueue);
}
+ (void)resume{
    dispatch_resume(globalQueue);
}
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count{
    NSParameterAssert(task);
    dispatch_apply(count, globalQueue, task);
}
@end

  ////////////////////类：GlobalLowPriorityQueue////////////////////////

@implementation GlobalLowPriorityQueue


#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    // 如果当前队列是主队列，要提示奔溃处理
    dispatch_sync(globalLowPriorityQueue, task);
}
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalLowPriorityQueue, task);
}
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalLowPriorityQueue, task);
}
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalLowPriorityQueue, task);
}
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalLowPriorityQueue, task);
}
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend{
    dispatch_suspend(globalLowPriorityQueue);
}
+ (void)resume{
    dispatch_resume(globalLowPriorityQueue);
}
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count{
    NSParameterAssert(task);
    dispatch_apply(count, globalLowPriorityQueue, task);
}
@end

  ////////////////////类：GlobalHighPriorityQueue////////////////////////

@implementation GlobalHighPriorityQueue


#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    // 如果当前队列是主队列，要提示奔溃处理
    dispatch_sync(globalHighPriorityQueue, task);
}
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalHighPriorityQueue, task);
}
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalHighPriorityQueue, task);
}
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalHighPriorityQueue, task);
}
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalHighPriorityQueue, task);
}
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend{
    dispatch_suspend(globalHighPriorityQueue);
}
+ (void)resume{
    dispatch_resume(globalHighPriorityQueue);
}
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count{
    NSParameterAssert(task);
    dispatch_apply(count, globalHighPriorityQueue, task);
}
@end

  ////////////////////类：GlobalBackgroundPriorityQueue////////////////////////

@implementation GlobalBackgroundPriorityQueue

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    // 如果当前队列是主队列，要提示奔溃处理
    dispatch_sync(globalBackgroundPriorityQueue, task);
}
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(globalBackgroundPriorityQueue, task);
}
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * sec), globalBackgroundPriorityQueue, task);
}

#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, globalBackgroundPriorityQueue, task);
}
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, globalBackgroundPriorityQueue, task);
}
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend{
    dispatch_suspend(globalBackgroundPriorityQueue);
}
+ (void)resume{
    dispatch_resume(globalBackgroundPriorityQueue);
}
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count{
    NSParameterAssert(task);
    dispatch_apply(count, globalBackgroundPriorityQueue, task);
}
@end

