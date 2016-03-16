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
    [GCD executeAsyncTaskInGlobalQueue:^{
        sleep(2);
        NSLog(@"--1--");
    }];
    [GCD executeDelayTaskInGlobalQueue:^{
        NSLog(@"--2--");
    } afterDelaySecs:1];
}

@end
