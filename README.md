## HYGCD

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