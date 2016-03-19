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
#import "GCDGroup.h"

@interface GCDQueue ()

/** dispatch_queue_t */
@property (nonatomic,readwrite)dispatch_queue_t dispatchQueue;

@end

@implementation GCDQueue
+ (void)initialize{
    
}

#pragma mark - 初始化,创建并发和串行队列
///因为创建调度队列的第二个参数值是可以确定的，具体值是有限个数的，而且这里就两个值
///所以是可以如下写出所有的初始化方法
///对于第一个参数label值显然是无法确定的，所以需要就对外展开接口传参
///第一个参数别忘了默认值nil
- (instancetype)init {
    
    return [self initSerial];
}

- (instancetype)initSerial {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchQueue = dispatch_queue_create(nil, serial);
    }
    
    return self;
}
///为了外部使用更加符合Objective-C的面向对象习惯用法，所以对外提供NSString* label
///然后在初始化方法内部，使用UTF8String转为C语言的字符串
- (instancetype)initSerialWithLabel:(NSString *)label {
    
    self = [super init];
    if (self)
    {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], serial);
    }
    
    return self;
}

- (instancetype)initConcurrent {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchQueue = dispatch_queue_create(nil, concurrent);
    }
    
    return self;
}

- (instancetype)initConcurrentWithLabel:(NSString *)label {
    self = [super init];
    if (self)
    {
        self.dispatchQueue = dispatch_queue_create([label UTF8String], concurrent);
    }
    return self;
}

#pragma mark - 执行任务
-(void)executeAsyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_async(self.dispatchQueue, task);
}
-(void)executeSyncTask:(dispatch_block_t)task{
    NSParameterAssert(task);
    dispatch_sync(self.dispatchQueue, task);
}
-(void)executeAsyncTask:(dispatch_block_t)task afterDelaySecs:(NSTimeInterval)sec{
    NSParameterAssert(task);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(sec * NSEC_PER_SEC)), self.dispatchQueue, task);
}

#pragma mark - 关于组
-(void)executeTask:(dispatch_block_t)task inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_async(group.dispatchGroup, self.dispatchQueue, task);
}
-(void)notifyTask:(dispatch_block_t)task inGroup:(GCDGroup*)group{
    NSParameterAssert(task);
    dispatch_group_notify(group.dispatchGroup, self.dispatchQueue, task);
}


#pragma mark - 操作当前队列
- (void)suspend{
    dispatch_suspend(self.dispatchQueue);
}
- (void)resume {
    dispatch_resume(self.dispatchQueue);
}
#pragma mark - 在当前队列中迭代执行任务

- (void)applyExecuteTask:(TaskBlock)task count:(float)count{
    NSParameterAssert(task);
    dispatch_apply(count, self.dispatchQueue, task);
};

- (void)dealloc{
    self.dispatchQueue = nil;
}

@end







