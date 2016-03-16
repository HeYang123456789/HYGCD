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

@interface GCDQueue ()

/** dispatch_queue_t */
@property (nonatomic,strong)dispatch_queue_t dispatchQueue;

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

#pragma mark - 操作当前队列
- (void)suspendQueue{
    dispatch_suspend(self.dispatchQueue);
}
- (void)resume {
    dispatch_resume(self.dispatchQueue);
}

#pragma mark - 暂停函数，暂停对应的系统提供的主队列
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


@end
