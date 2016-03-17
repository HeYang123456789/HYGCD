//
//  GCDMacros.h
//  HYGCD
//
//  Created by HEYANG on 16/3/17.
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

/// 下面是对一次性函数的宏定义

/// 一次性函数不可以抽取封装成方法，否则外部调用有且只能执行一个任务，更何况还只能执行一次
/// 抽取成宏定义，但是用起来却不如直接使用系统原生的GCD的一次性函数的简便

#define GCDBlockClassBool [task class] == NSClassFromString(@"__NSMallocBlock__") || [task class] == NSClassFromString(@"__NSGlobalBlock__") || [task class] == NSClassFromString(@"__NSStackBlock__")

#ifndef GCDExecOnce
#define GCDExecOnce(task) \
{ \
NSParameterAssert(task); \
if (GCDBlockClassBool) \
{ \
static dispatch_once_t predicate = 0; \
dispatch_once(&predicate, task); \
} \
else \
{ \
NSLog(@"\nThis task is not __NSMallocBlock__ Class"); \
NSLog(@"%@",[task class]); \
} \
}
#endif
