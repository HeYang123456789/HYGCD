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

@class GCDGroup;

@interface GCD : NSObject

/**
 *  hy:该GCD类只有类方法，提供的功能：
 *  1、可以直接管理和使用着系统提供的1个主队列，和4个全局并发队列
 *  2、可以直接使用组(Group)管理和控制系统提供的1个主队列，和4个全局并发队列
 *  3、可以创建异步或者同步任务，并添加到系统提供的1个主队列，和4个全局并发队列
 *  4、可以创建延迟提交任务(补充：GCD的afterDelay并不是延迟执行，而是延迟提交)
 *  5、提供一次性函数的调用
 */

#pragma mark - 执行同步任务
+ (void)executeSyncTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue;
+ (void)executeSyncTaskInMainQueue:(dispatch_block_t)task;
+ (void)executeSyncTaskInGlobalQueue:(dispatch_block_t)task;
+ (void)executeSyncTaskInHighPriorityGlobalQueue:(dispatch_block_t)task;
+ (void)executeSyncTaskInLowPriorityGlobalQueue:(dispatch_block_t)task;
+ (void)executeSyncTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task;


#pragma mark - 执行异步任务
+ (void)executeAsyncTask:(dispatch_block_t)task inQueue:(GCDQueue*)queue;
+ (void)executeAsyncTaskInMainQueue:(dispatch_block_t)task;
+ (void)executeAsyncTaskInGlobalQueue:(dispatch_block_t)task;
+ (void)executeAsyncTaskInHighPriorityGlobalQueue:(dispatch_block_t)task;
+ (void)executeAsyncTaskInLowPriorityGlobalQueue:(dispatch_block_t)task;
+ (void)executeAsyncTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task;

#pragma mark - 在五个系统提供的队列上，执行延迟提交执行任务
+ (void)executeDelayTaskInMainQueue:(dispatch_block_t)task
                    afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeDelayTaskInGlobalQueue:(dispatch_block_t)task
                      afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeDelayTaskInHighPriorityGlobalQueue:(dispatch_block_t)task
                                  afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeDelayTaskInLowPriorityGlobalQueue:(dispatch_block_t)task
                                 afterDelaySecs:(NSTimeInterval)sec;
+ (void)executeDelayTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task
                                        afterDelaySecs:(NSTimeInterval)sec;

#pragma mark - 和组相关
+ (void)executeTaskInMainQueue:(dispatch_block_t)task
                     inGroup:(GCDGroup*)group;
+ (void)executeTaskInGlobalQueue:(dispatch_block_t)task
                       inGroup:(GCDGroup*)group;
+ (void)executeTaskInHighPriorityGlobalQueue:(dispatch_block_t)task
                                   inGroup:(GCDGroup*)group;
+ (void)executeTaskInLowPriorityGlobalQueue:(dispatch_block_t)task
                                  inGroup:(GCDGroup*)group;
+ (void)executeTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task
                                         inGroup:(GCDGroup*)group;
+ (void)notifyTaskInMainQueue:(dispatch_block_t)task
                       inGroup:(GCDGroup*)group;
+ (void)notifyTaskInGlobalQueue:(dispatch_block_t)task
                         inGroup:(GCDGroup*)group;
+ (void)notifyTaskInHighPriorityGlobalQueue:(dispatch_block_t)task
                                     inGroup:(GCDGroup*)group;
+ (void)notifyTaskInLowPriorityGlobalQueue:(dispatch_block_t)task
                                    inGroup:(GCDGroup*)group;
+ (void)notifyTaskInBackgroundPriorityGlobalQueue:(dispatch_block_t)task
                                           inGroup:(GCDGroup*)group;

/***  暂停恢复函数，暂停和恢复对应的系统提供的主队列 */
#pragma mark - 暂停函数，暂停对应的系统提供的主队列
+ (void)suspendMainQueue;
+ (void)suspendGlobalQueue;
+ (void)suspendGlobalLowPriorityQueue;
+ (void)suspendGlobalHighPriorityQueue;
+ (void)suspendGlobalBackgroundPriorityQueue;

+ (void)resumeMainQueue;
+ (void)resumeGlobalQueue;
+ (void)resumeGlobalLowPriorityQueue;
+ (void)resumeGlobalHighPriorityQueue;
+ (void)resumeGlobalBackgroundPriorityQueue;

#pragma mark - 一次性函数
//+ (void)executeOnceTask:(dispatch_block_t)task;

#pragma mark - 迭代函数
+ (void)applyExecuteTaskInMainQueue:(TaskBlock)task
                              count:(float)count;
+ (void)applyExecuteTaskInGlobalQueue:(TaskBlock)task
                                count:(float)count;
+ (void)applyExecuteTaskInGlobalLowPriorityQueue:(TaskBlock)task
                                           count:(float)count;
+ (void)applyExecuteTaskInGlobalHighPriorityQueue:(TaskBlock)task
                                            count:(float)count;
+ (void)applyExecuteTaskInGlobalBackgroundPriorityQueue:(TaskBlock)task
                                                  count:(float)count;

@end
