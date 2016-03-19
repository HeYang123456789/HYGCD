//
//  HYGCDQueue.h
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

@class GCDGroup;

typedef void(^TaskBlock)(size_t);

@interface GCDQueue : NSObject

@property (nonatomic,readonly)dispatch_queue_t dispatchQueue;

#pragma mark - 初始化
- (instancetype)init;
- (instancetype)initSerial;
- (instancetype)initSerialWithLabel:(NSString *)label;
- (instancetype)initConcurrent;
- (instancetype)initConcurrentWithLabel:(NSString *)label;

#pragma mark - 执行任务
-(void)executeAsyncTask:(dispatch_block_t)task;
-(void)executeSyncTask:(dispatch_block_t)task;
-(void)executeAsyncTask:(dispatch_block_t)task afterDelaySecs:(NSTimeInterval)sec;

#pragma mark - 关于组
-(void)executeTask:(dispatch_block_t)task inGroup:(GCDGroup*)group;
-(void)notifyTask:(dispatch_block_t)task inGroup:(GCDGroup*)group;

/***  暂停函数，暂停对应的调度队列 */
#pragma mark - 暂停函数，暂停对应的系统提供的主队列
- (void)suspend;
- (void)resume;

#pragma mark - 在当前队列中迭代执行任务
- (void)applyExecuteTask:(TaskBlock)task count:(float)count;

@end


