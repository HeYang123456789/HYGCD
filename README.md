## HYGCD

在实际开发中使用本人封装好的简单易用的面向对象的GCD接口，建议读者已经熟练掌握了GCD的各种常用的用法。如果读者对GCD的认识不深，可以阅读本人写的一篇关于GCD比较全面的博文：[IOS开发之多线程 -- GCD的方方面面](http://www.cnblogs.com/goodboy-heyang/p/5271513.html)。多多指教。

### API接口使用示例代码

![](http://a3.qpic.cn/psb?/V10CYGbV1hdHeK/DiiNVJJZjo4A2qVHMR11ZgSAb07S1gt6mMGy.XwOxkY!/b/dHABAAAAAAAA&bo=lgHGAAAAAAADB3M!&rf=viewer_4)

![](http://a1.qpic.cn/psb?/V10CYGbV1hdHeK/B8F7umDVCtTjbezVvDwXA1mZ2PprvWiiNJWYaqWeixc!/b/dHEBAAAAAAAA&bo=IgGIAQAAAAADAI8!&rf=viewer_4)

![](http://a1.qpic.cn/psb?/V10CYGbV1hdHeK/C0Wy6LsoA8YKX9mohhYWFM6OBrsJRjc1EiTfNtCF*mA!/b/dHEBAAAAAAAA&bo=8gHgAAAAAAADADY!&rf=viewer_4)

![](http://a1.qpic.cn/psb?/V10CYGbV1hdHeK/SxdFXgzjwxd4zqU340uxAEDcv9u65KVj.NrX3FEWhCo!/b/dHEBAAAAAAAA&bo=mwEwAQAAAAADAI4!&rf=viewer_4)

### 封装GCD需要考虑到的功能

队列：HYGCDQueue

线程组：HYGCDGroup

+ 线程组封装异步任务
	dispatch_group_async(group,queue,block);

+ 线程组封装同步任务
	dispatch_group_sync(group,queue,block);

+ 线程组 
	相关用法
	
		- (void)enter;
		- (void)leave;
		- (void)wait;
		- (BOOL)wait:(int64_t)delta;

信号量：HYGCDSemaphore



计时器：HYGCDTimer



其他函数的使用

+ 栅栏函数（只能用在调度并发队列中使用）
	
+ 延迟函数

+ 一次性函数

### 各个GCD类的接口简介

根据[IOS开发之多线程 -- GCD的方方面面](http://www.cnblogs.com/goodboy-heyang/p/5271513.html)提到的我们可以使用的全部队列是：系统提供的主队列和系统提供的四个全局并发队列，以及自己可以创建的串行或者并发调度队列。

本人将系统提供的主队列和系统提供的四个全局并发队列封装在GCD.h+GCD.m中，而自己可以创建和使用的串行或者并发调度队列的过程则封装在GCDQueue.h+GCDQueue.m中。

1、GCD.h+GCD.m


```objc
1、可以直接管理和使用着系统提供的1个主队列，和4个全局并发队列
2、可以直接使用组(Group)管理和控制系统提供的1个主队列，和4个全局并发队列
3、可以创建异步或者同步任务，并添加到系统提供的1个主队列，和4个全局并发队列
4、可以创建延迟提交任务(补充：GCD的afterDelay并不是延迟执行，而是延迟提交)
```

2、GCDQueue.h+GCDQueue.m

```objc
1、创建自己的并发队列(Concurrent)或者串行(Serial)队列
2、可以直接管理和使用自己创建的队列
3、可以在组中使用自己创建的队列
```

3、GCDGroup.h+GCDGroup.m

```objc
1、可以直接创建组
2、控制和调度组
```

4、GCDSemaphore.h+GCDSemaphore.m

```objc
1、可以直接创建信号量对象
2、信号量的发送和等待
```
5、GCDTimer.h+GCDTimer.m

```objc
1、可以直接创建计时器对象
2、设置任务和时间
3、可以启动、挂起和销毁计时器的任务。(多次启动、挂起和销毁相互之间不会有冲突)
```



### 最后补充

一次性函数不好封装，建议直接用系统原生的GCD一次性函数。


