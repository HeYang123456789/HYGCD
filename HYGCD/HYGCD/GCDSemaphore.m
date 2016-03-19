//
//  GCDSemaphore.m
//  HYGCD
//
//  Created by HEYANG on 16/3/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//
//  http://www.cnblogs.com/goodboy-heyang
//  https://github.com/HeYang123456789
//

#import "GCDSemaphore.h"

@interface GCDSemaphore ()

@property (readwrite, nonatomic) dispatch_semaphore_t dispatchSemaphore;

@end

@implementation GCDSemaphore

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchSemaphore = dispatch_semaphore_create(0);
    }
    
    return self;
}

- (instancetype)initWithValue:(long)value {
    
    self = [super init];
    
    if (self) {
        
        self.dispatchSemaphore = dispatch_semaphore_create(value);
    }
    
    return self;
}

- (BOOL)signal {
    
    return dispatch_semaphore_signal(self.dispatchSemaphore) != 0;
}

- (void)wait {
    
    dispatch_semaphore_wait(self.dispatchSemaphore, DISPATCH_TIME_FOREVER);
}

- (BOOL)wait:(int64_t)delta {
    
    return dispatch_semaphore_wait(self.dispatchSemaphore, dispatch_time(DISPATCH_TIME_NOW, delta)) == 0;
}

-(void)dealloc{
    self.dispatchSemaphore = nil;
}

@end