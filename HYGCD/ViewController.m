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

@property (nonatomic, strong) GCDTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self setUp];
    
}
#pragma mark - 使用示例
-(void)setUp{
    
    // 在全局并发队列中处理下载任务，然后回到主线程中更新UI
    
    [GlobalQueue executeAsyncTask:^{
        
        // download task , etc
        
        [MainQueue executeAsyncTask:^{
            
            // update UI
        }];
    }];
    
    
    // 使用GCD的线程组
    // init group
    GCDGroup *group = [GCDGroup new];
    
    // add to group
    [GlobalQueue executeTask:^{
        
        // task one
        
    } inGroup:group];
    
    // add to group
    [GlobalQueue executeTask:^{
        
        // task two
        
    } inGroup:group];

    // notify in MainQueue
    [MainQueue notifyTask:^{
        
        // task three
        
    } inGroup:group];
    
    // 使用GCD的定时器
    // init timer
    self.timer = [[GCDTimer alloc] initInMainQueue];
    
    // timer event
    [self.timer event:^{
        
        // task
        
    } timeInterval:NSEC_PER_SEC * 3 delay:NSEC_PER_SEC * 3];
    
    // start timer
    [self.timer start];
    
    // 使用GCD的信号量
    // init semaphore
    GCDSemaphore *semaphore = [GCDSemaphore new];
    
    // wait
    [GlobalQueue executeAsyncTask:^{
        
        [semaphore wait];
        
        // todo sth else
    }];
    
    // signal
    [GlobalQueue executeAsyncTask:^{
        
        // do sth
        [semaphore signal];
    }];
    
}

@end
