//
//  GCD.h
//  HYGCD
//
//  Created by HEYANG on 16/3/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//
//  http://www.cnblogs.com/goodboy-heyang
//  https://github.com/HeYang123456789
//



#import <Foundation/Foundation.h>
#import "GCDMacros.h"
#import "GCDQueue.h"
#import "GCDGroup.h"


@class GCDGroup;

@interface GCD : NSObject

/**
 *  hy:该GCD类只有类方法，提供的功能：
 *  1、可以直接管理和使用着系统提供的1个主队列，和4个全局并发队列
 *  2、可以直接使用组(Group)管理和控制系统提供的1个主队列，和4个全局并发队列
 *  3、可以创建异步或者同步任务，并添加到系统提供的1个主队列，和4个全局并发队列
 *  4、可以创建延迟提交任务(补充：GCD的afterDelay并不是延迟执行，而是延迟提交)
 */

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue;



#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue;



#pragma mark  一次性函数
//+ (void)executeOnceTask:(dispatch_block_t)task;


@end

  //////////////////////MainQueue//////////////////////

@interface MainQueue : NSObject

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task;
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task;
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec;
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group;
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group;
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend;
+ (void)resume;
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count;
@end


  //////////////////////GlobalQueue//////////////////////


@interface GlobalQueue : NSObject

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task;
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task;
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec;
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group;
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group;
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend;
+ (void)resume;
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count;

@end

  /////////////////////GlobalLowPriorityQueue///////////////////////

@interface GlobalLowPriorityQueue : NSObject

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task;
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task;
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec;
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group;
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group;
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend;
+ (void)resume;
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count;
@end

  //////////////////////GlobalHighPriorityQueue//////////////////////

@interface GlobalHighPriorityQueue : NSObject

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task;
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task;
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec;
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group;
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group;
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend;
+ (void)resume;
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count;
@end

  ////////////////////GlobalBackgroundPriorityQueue////////////////////////

@interface GlobalBackgroundPriorityQueue : NSObject

#pragma mark  执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task;
#pragma mark  执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task;
#pragma mark  在五个系统提供的队列上，执行延迟任务
+ (void)executeDelayTask:(dispatch_block_t)task
          afterDelaySecs:(NSTimeInterval)sec;
#pragma mark  和组相关
/// execute
+ (void)executeTask:(dispatch_block_t)task
            inGroup:(GCDGroup*)group;
///notify
+ (void)notifyTask:(dispatch_block_t)task
           inGroup:(GCDGroup*)group;
#pragma mark  暂停恢复函数，暂停和恢复对应的系统提供的主队列
+ (void)suspend;
+ (void)resume;
#pragma mark  迭代函数
+ (void)applyExecuteTask:(TaskBlock)task count:(float)count;

@end
