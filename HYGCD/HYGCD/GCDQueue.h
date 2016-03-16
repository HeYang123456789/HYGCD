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


// 主队列
#define mainQueue dispatch_get_main_queue()
// 四个不同优先级的全局并发队列
#define globalQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define globalHighPriorityGlobalQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);

#define globalLowPriorityGlobalQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);

#define globalBackgroundPriorityGlobalQueue \
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);



#import <Foundation/Foundation.h>

@interface GCDQueue : NSObject

@end
