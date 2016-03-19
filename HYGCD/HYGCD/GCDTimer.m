//
//  GCDTimer.m
//  HYGCD
//
//  Created by HEYANG on 16/3/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//
//  http://www.cnblogs.com/goodboy-heyang
//  https://github.com/HeYang123456789
//


#import "GCDTimer.h"
#import "GCDQueue.h"

@interface GCDTimer ()

/** isDestroy */
@property (nonatomic,assign)BOOL isDestroyed;
/** isAlreadyResume */
@property (nonatomic,assign)BOOL isAlreadyResume;
/** isSuspend */
@property (nonatomic,assign)BOOL isSuspend;

@property (readwrite, nonatomic) dispatch_source_t dispatchSource;

@end

@implementation GCDTimer

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    }
    
    return self;
}

- (instancetype)initInQueue:(GCDQueue *)queue {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue.dispatchQueue);
    }
    
    return self;
}

- (instancetype)initInMainQueue {
    
    self = [super init];
    if (self) {
        
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, mainQueue);
    }
    
    return self;
}
- (instancetype)initInGlobalQueue {
    
    self = [super init];
    if (self) {
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalQueue);
    }
    
    return self;
}
- (instancetype)initInGlobalLowPriorityQueue {
    
    self = [super init];
    if (self) {
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalLowPriorityQueue);
    }
    
    return self;
}
- (instancetype)initInGlobalHighPriorityQueue {
    
    self = [super init];
    if (self) {
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalHighPriorityQueue);
    }
    
    return self;
}
- (instancetype)initInGlobalBackgroundPriorityQueue {
    
    self = [super init];
    if (self) {
        self.dispatchSource = \
        dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, globalBackgroundPriorityQueue);
    }
    
    return self;
}

- (void)setUp{
    // 刚创建，所以未销毁
    self.isDestroyed = NO;
    // 刚创建，当然未开始/恢复
    self.isAlreadyResume = NO;
    // 刚创建，都没开始，怎么可能挂起来呢
    self.isSuspend = NO;
}

- (void)event:(dispatch_block_t)task timeInterval:(uint64_t)interval {
    
    NSParameterAssert(task);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), interval, 0);
    dispatch_source_set_event_handler(self.dispatchSource, task);
    [self setUp];
}

- (void)event:(dispatch_block_t)task timeInterval:(uint64_t)interval delay:(uint64_t)delay {
    
    NSParameterAssert(task);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, delay), interval, 0);
    dispatch_source_set_event_handler(self.dispatchSource, task);
    [self setUp];
}

- (void)event:(dispatch_block_t)task timeIntervalWithSecs:(float)secs {
    
    NSParameterAssert(task);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, 0), secs * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.dispatchSource, task);
    [self setUp];
}

- (void)event:(dispatch_block_t)task timeIntervalWithSecs:(float)secs delaySecs:(float)delaySecs {
    
    NSParameterAssert(task);
    dispatch_source_set_timer(self.dispatchSource, dispatch_time(DISPATCH_TIME_NOW, delaySecs * NSEC_PER_SEC), secs * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.dispatchSource, task);
    [self setUp];
}

/**
 *  下面对计时器的启动、挂起和销毁增加了逻辑处理，排除GCD计时器自身的冲突的逻辑
 */

- (void)start {
    if (!self.isDestroyed) {
        if (!self.isAlreadyResume) {
            // 执行/恢复
            dispatch_resume(self.dispatchSource);
            // 标记 表示已经resume
            self.isAlreadyResume = YES;
            // 标记已经恢复了，没有挂起了
            self.isSuspend = NO;
        }
    }
}

- (void)suspend {
    if (!self.isDestroyed) {
        if (!self.isSuspend) {
            if (self.isAlreadyResume) {
                // 挂起
                dispatch_suspend(self.dispatchSource);
                // 记录，已经挂起了
                self.isSuspend = YES;
                // 既然挂起了，所以，就不等于启动
                self.isAlreadyResume = NO;
            }
        }
    }
}

- (void)destroy {
    // 销毁之前，一定要将挂起恢复
    if (self.isSuspend) {
        // 执行/恢复
        dispatch_resume(self.dispatchSource);
        self.isSuspend = NO;
    }
    
    // 如果没销毁，下面进行销毁
    if (!self.isDestroyed) {
        // 不管你是否resume启动了任务，都可以销毁一次
        dispatch_source_cancel(self.dispatchSource);
        // 记录 已经销毁了
        self.isDestroyed = YES;
    }
}

-(void)dealloc{
    self.dispatchSource = nil;
}

@end
