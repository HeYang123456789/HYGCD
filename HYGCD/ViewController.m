//
//  ViewController.m
//  HYGCD
//
//  Created by HEYANG on 16/3/16.
//  Copyright © 2016年 HEYANG. All rights reserved.
//
//  http://www.cnblogs.com/goodboy-heyang
//  https://github.com/HeYang123456789
//

#import "ViewController.h"
#import "HYGCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self setUp];
    
}

-(void)setUp{
    
    // 注意下面会出现死锁的两个情况
//// sync + MainQueue
//==[GCD executeSyncTaskInMainQueue:^{
//==NSLog(@"hello");
//==}];
    
//// 两个sync相互嵌套+serial 会出现死锁
//==GCDQueue* queue = [[GCDQueue alloc] initSerial];
//==[GCD executeSyncTask:^{
//==    NSLog(@"World");
//==    [GCD executeSyncTask:^{
//==        NSLog(@"--haha--");
//==    } inQueue:queue];
//==} inQueue:queue];
    

    
    [GCD executeAsyncTaskInGlobalQueue:^{
        
        // download task, etc
        
        [GCD executeAsyncTaskInMainQueue:^{
            
            // update UI
        }];
    }];
    
    
    
    
    
    // init group
    GCDGroup *group = [GCDGroup new];
    
//    // add to group
//    [[GCDQueue GlobalQueue] execute:^{
//        
//        // task one
//        
//    } inGroup:group];
//    
//    // add to group
//    [[GCDQueue GlobalQueue] execute:^{
//        
//        // task two
//        
//    } inGroup:group];
//    
//    // notify in MainQueue
//    [[GCDQueue MainQueue] notify:^{
//        
//        // task three
//        
//    } inGroup:group];
//    
//    
//    
//    
//    // init timer
//    self.timer = [[GCDTimer alloc] initInQueue:[GCDQueue MainQueue]];
//    
//    // timer event
//    [self.timer event:^{
//        
//        // task
//        
//    } timeInterval:NSEC_PER_SEC * 3 delay:NSEC_PER_SEC * 3];
//    
//    // start timer
//    [self.timer start];
//    
//    
//    
//    
//    // init semaphore
//    GCDSemaphore *semaphore = [GCDSemaphore new];
//    
//    // wait
//    [GCDQueue executeInGlobalQueue:^{
//        
//        [semaphore wait];
//        
//        // todo sth else
//    }];
//    
//    // signal
//    [GCDQueue executeInGlobalQueue:^{
//        
//        // do sth
//        [semaphore signal];
//    }];
    
}

@end
