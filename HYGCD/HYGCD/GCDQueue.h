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


///宏定义五个系统中可以直接获取的队列
// 主队列
#define mainQueue dispatch_get_main_queue()
// 四个不同优先级的全局并发队列
#define globalQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define globalHighPriorityQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)

#define globalLowPriorityQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)

#define globalBackgroundPriorityQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)


///宏定义简化队列的类型
#define serial DISPATCH_QUEUE_SERIAL
#define concurrent DISPATCH_QUEUE_CONCURRENT


#import <Foundation/Foundation.h>

@interface GCDQueue : NSObject

#pragma mark - 初始化
- (instancetype)init;
- (instancetype)initSerial;
- (instancetype)initSerialWithLabel:(NSString *)label;
- (instancetype)initConcurrent;
- (instancetype)initConcurrentWithLabel:(NSString *)label;

/***  暂停函数，暂停对应的系统提供的主队列 */
#pragma mark - 暂停函数，暂停对应的系统提供的主队列
+ (void)suspendMainQueue;
+ (void)suspendGlobalQueue;
+ (void)suspendGlobalLowPriorityQueue;
+ (void)suspendGlobalHighPriorityQueue;
+ (void)suspendGlobalBackgroundPriorityQueue;


@end
