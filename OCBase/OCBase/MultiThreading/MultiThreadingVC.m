//
//  MultiThreadingVC.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/15.
//

#import "MultiThreadingVC.h"
#import "MTThinkingAnalyticsSDK.h"

@interface MultiThreadingVC ()

@property (nonatomic, strong) NSCondition *condition;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@end

@implementation MultiThreadingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"多线程";
    
#pragma mark 5、NSCondition 配合
//    self.condition = [[NSCondition alloc] init];
//    [NSThread detachNewThreadSelector:@selector(createConsumer) toTarget:self withObject:nil];
    
#pragma mark 3、信号量 配合
//    self.semaphore = dispatch_semaphore_create(0);
//    [NSThread detachNewThreadSelector:@selector(createSemaphore) toTarget:self withObject:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"多线程>>>>>>点击开始");
    
#pragma mark 11、dispatch_once 默认是带锁的，线程安全
    dispatch_queue_t queue = dispatch_queue_create("队列once", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 50; i++) {
        dispatch_async(queue, ^{
//            NSLog(@"%@",[NSThread currentThread]);
            MTThinkingAnalyticsSDK *instance = [MTThinkingAnalyticsSDK shareSDK];
//            MTThinkingAnalyticsSDK *instance = [MTThinkingAnalyticsSDK shareSDK1];
        });
    }
    
#pragma mark 10、栅栏函数
    /**
     非常重要的一点: 栅栏函数只能控制同一并发队列
     一定要是自定义的并发队列
     必须要求都在同一个队列
     */
//    dispatch_queue_t queue1 = dispatch_queue_create("队列1", DISPATCH_QUEUE_CONCURRENT);
////    dispatch_queue_t queue1 = dispatch_get_global_queue(0, 0);//错
//    dispatch_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务一 %d",i);
//        }
//    });
//    dispatch_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务二 %d",i);
//        }
//    });
//    dispatch_barrier_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"栅栏函数一 %d",i);
//        }
//    });
//    dispatch_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务三 %d",i);
//        }
//    });
//    dispatch_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务四 %d",i);
//        }
//    });
//    dispatch_barrier_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"栅栏函数二 %d",i);
//        }
//    });
//    dispatch_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务五 %d",i);
//        }
//    });
    
    
#pragma mark 9、调度组 实例一
   /**
    最直接的作用: 控制任务执行顺序，不必要求队列是同一个队列
    >创建组:dispatch_group_create
    进组任务:dispatch_group_async
    进组任务执行完毕通知: dispatch_group_notify
    进组任务执行等待时间:dispatch_group_wait
    进组: dispatch_group_enter
    出组: dispatch_group_leave
    控制执行顺序
    */
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue1 = dispatch_queue_create("队列1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create("队列2", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_group_enter(group);
//    dispatch_async(queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务一 %d",i);
//        }
//        dispatch_group_leave(group);
//    });
//    dispatch_group_enter(group);
//    dispatch_async(queue2, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务二 %d",i);
//        }
//        dispatch_group_leave(group);
//    });
//    dispatch_group_notify(group, queue1, ^{
//        NSLog(@"执行完毕");
//    });
    
#pragma mark 9、调度组 实例二
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue1 = dispatch_queue_create("队列1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create("队列2", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_async(group, queue1, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务一 %d",i);
//        }
//    });
//    dispatch_group_async(group, queue2, ^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"任务二 %d",i);
//        }
//    });
//    dispatch_group_notify(group, queue1, ^{
//        NSLog(@"执行完毕");
//    });
    
#pragma mark 8、访问同一内存
//    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("xm", DISPATCH_QUEUE_CONCURRENT);//DISPATCH_QUEUE_CONCURRENT换成DISPATCH_QUEUE_SERIAL 虽然下面开辟了线程了但是也是顺序执行，所以下面的也不会崩溃
////    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(0, 0);
//    for (int i = 0; i<20; i++) {
//        dispatch_async(concurrentQueue, ^{
//            NSString *imageName = @"live_mic_user_mute@3x";//[NSString stringWithFormat:@"%d.jpg", (i % 10)];
//            NSURL *url = [[NSBundle mainBundle] URLForResource:imageName withExtension:@".webp"];
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            UIImage *image = [UIImage imageWithData:data];
//
//            //多条线程同时访问同一块内存，崩溃，解决方法加锁
////            [array addObject:image];
////            NSLog(@"array.count:%ld",array.count);
//
//            //方法一
////            @synchronized (self) {
////                [array addObject:image];
////                NSLog(@"array.count:%ld",array.count);
////            }
//
//            //方法二
////            NSLog(@"===>>>:%d",i);
////            dispatch_barrier_async(concurrentQueue, ^{
////                [array addObject:image];
////                NSLog(@"array.count:%ld",array.count);
////            });
//        });
//    }
    
    
#pragma mark 7、资源抢夺
//    __block int a = 0;
//    while (a<10) {
//        //dispatch_async不用等待当前语句执行完毕，就可以执行下一条语句，所以下面语句会一下执行好多次，所以会开辟好多线程，所以很多线程有a的指针，所以只要有一个线程中a的值大于了10，就会出while循环，但是有的线程中可能还没执行完毕，所以a的值还会变化，所以最后打印a的值不确定。
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            a++;
//            NSLog(@"%d-%@",a,[NSThread currentThread]);
//        });
//    }
//
////    for (NSInteger i=0; i<20; i++) {
////        NSLog(@"%d",a);
////    }
//    NSLog(@"aaa----%d",a);//while循环执行完毕之后才会执行下一条语句
//
//    //想输出绝对的a的真实值，不可能。下面的方法只是简略的解决，还是不对，只是用了FIFO，且这些任务都比较简单，执行时间差不多，如果一个任务执行时间长了，就不准了。
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"bbb --- %d",a);
//    });
    
#pragma mark 6、一个线程打印奇数，一个线程打印偶数，从1-100
#pragma mark 6.4、方式四 根本就不需要用锁，但是不用锁number的值不准确（???）
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    __block int number = 1;
//
//    dispatch_async(queue, ^{
//        for (; number < 100; ) {
//            if (number%2 == 1) {
//                NSLog(@"奇数--%@--%d",[NSThread currentThread],number);
//                number++;
//            }
//        }
//    });
//
//    dispatch_async(queue, ^{
//        for (; number <= 100; ) {
//            if (number%2 == 0) {
//                NSLog(@"偶数--%@--%d",[NSThread currentThread],number);
//                number++;
//            }
//        }
//    });
    
#pragma mark 6.3、方式三 NSCondition
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    NSCondition *cond = [[NSCondition alloc] init];
//    __block int number = 1;
//    dispatch_async(queue, ^{
//        while (number < 100) {
//            [cond lock];
//            if (number%2 == 1) {
//                NSLog(@"奇数---%d",number);
//                number++;
////                [cond signal];
////                [cond wait];
//            }
//            [cond unlock];
//        };
//    });
//
//    dispatch_async(queue, ^{
//        while (number <= 100) {
//            [cond lock];
//            if (number%2 == 0) {
//                NSLog(@"偶数---%d",number);
//                number++;
////                [cond signal];
////                [cond wait];
//            }
//            [cond unlock];
//        };
//    });
    
#pragma mark 6.2、方式二 NSLock
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    NSLock *lock = [[NSLock alloc] init];
//    __block int number = 1;
//    dispatch_async(queue, ^{
//        while (number < 100) {
//            [lock lock];
//            if (number%2 == 1) {
//                NSLog(@"奇数---%d",number);
//                number++;
//            }
//            [lock unlock];
//        };
//    });
//
//    dispatch_async(queue, ^{
//        while (number < 100) {
//            [lock lock];
//            if (number%2 == 0) {
//                NSLog(@"偶数---%d",number);
//                number++;
//            }
//            [lock unlock];
//        };
//    });
    
#pragma mark 6.1、方式一 dispatch_semaphore_t
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    dispatch_semaphore_t sema = dispatch_semaphore_create(1);
//
//    __block int number = 1;
//
//    dispatch_async(queue, ^{
//        while (number < 100) {
//            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//            if (number%2 != 0) {
//                NSLog(@"奇数--%@--%d",[NSThread currentThread],number);
//                number++;
//            }
//            dispatch_semaphore_signal(sema);
//        };
//    });
//
//    dispatch_async(queue, ^{
//        while (number < 100) {
//            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
//            if (number%2 == 0) {
//                NSLog(@"偶数--%@--%d",[NSThread currentThread],number);
//                number++;
//            }
//            dispatch_semaphore_signal(sema);
//        };
//    });
    
    
#pragma mark 5、NSCondition 配合
//    [self.condition signal];
////    [self.condition signal];//调用多次 也没事
    
#pragma mark 4、NSLock 不同的lock
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    NSLock *lock = [[NSLock alloc] init];
//    NSLock *lock1 = [[NSLock alloc] init];
//    NSLock *lock2 = [[NSLock alloc] init];
//
//    dispatch_async(queue, ^{
//        [lock lock];
//        NSLog(@"任务1：%@",[NSThread currentThread]);//不同的线程
//        NSLog(@"执行任务1");
//        sleep(1);
//        NSLog(@"任务1");
//        sleep(1);
//        NSLog(@"任务1完成");
//        [lock unlock];
//    });
//
//    dispatch_async(queue, ^{
//        [lock1 lock];
//        NSLog(@"任务2：%@",[NSThread currentThread]);
//        NSLog(@"执行任务2");
//        sleep(5);
//        NSLog(@"任务2");
//        sleep(1);
//        NSLog(@"任务2完成");
//        [lock1 unlock];
//    });
//
//    dispatch_async(queue, ^{
//        [lock2 lock];
//        NSLog(@"任务3：%@",[NSThread currentThread]);
//        NSLog(@"执行任务3");
//        sleep(1);
//        NSLog(@"任务3");
//        sleep(1);
//        NSLog(@"任务3完成");
//        [lock2 unlock];
//    });
    
#pragma mark 4、NSLock 同一把lock。a[lock lock]之后，再b[lock lock]了其他的，必须等第一个a[lock unlock]之后，才能执行b[lock lock]之后的代码。
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//
//    NSLock *lock = [[NSLock alloc] init];
//
//    dispatch_async(queue, ^{
//        [lock lock];
//        NSLog(@"任务1：%@",[NSThread currentThread]);//不同的线程
//        NSLog(@"执行任务1");
//        sleep(1);
//        NSLog(@"任务1");
//        sleep(1);
//        NSLog(@"任务1完成");
//        [lock unlock];
//    });
//
//    dispatch_async(queue, ^{
//        [lock lock];
//        NSLog(@"任务2：%@",[NSThread currentThread]);
//        NSLog(@"执行任务2");
//        sleep(5);
//        NSLog(@"任务2");
//        sleep(1);
//        NSLog(@"任务2完成");
//        [lock unlock];
//    });
//
//    dispatch_async(queue, ^{
//        [lock lock];
//        NSLog(@"任务3：%@",[NSThread currentThread]);
//        NSLog(@"执行任务3");
//        sleep(1);
//        NSLog(@"任务3");
//        sleep(1);
//        NSLog(@"任务3完成");
//        [lock unlock];
//    });
    
#pragma mark 3、信号量 配合
//    dispatch_semaphore_signal(self.semaphore);
    
#pragma mark 3、信号量 卡住 必须为0
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    // 信号量 -- gcd控制并发数
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//
//    //任务1
//    dispatch_async(queue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"任务1：%@",[NSThread currentThread]);//不同的线程
//        NSLog(@"执行任务1");
//        sleep(1);
//        NSLog(@"任务1");
//        sleep(1);
//        NSLog(@"任务1完成");
//        dispatch_semaphore_signal(semaphore);
//    });
//
//    //任务2
//    dispatch_async(queue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"任务2：%@",[NSThread currentThread]);
//        NSLog(@"执行任务2");
//        sleep(5);
//        NSLog(@"任务2");
//        sleep(1);
//        NSLog(@"任务2完成");
//        dispatch_semaphore_signal(semaphore);
//    });
//
//    //任务3
//    dispatch_async(queue, ^{
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//        NSLog(@"任务3：%@",[NSThread currentThread]);
//        NSLog(@"执行任务3");
//        sleep(1);
//        NSLog(@"任务3");
//        sleep(1);
//        NSLog(@"任务3完成");
//        dispatch_semaphore_signal(semaphore);
//    });
    
    
#pragma mark 2、主队列同步任务-死锁
//    dispatch_sync(dispatch_get_main_queue(), ^{
//
//    });
    
#pragma mark 1、问题-死锁
    //发生线程死锁的条件是，在同一个串行队列里面添加了同步执行的任务
    //实例1
//    dispatch_queue_t queue = dispatch_queue_create("xm", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"1 %@",[NSThread currentThread]);
//    dispatch_async(queue, ^{
//        NSLog(@"2 %@",[NSThread currentThread]);
//        dispatch_async(queue, ^{
//            NSLog(@"3 %@",[NSThread currentThread]);
//        });
////        dispatch_sync(queue, ^{
////            NSLog(@"3 %@",[NSThread currentThread]);
////        });
//        for (int i=0; i<5; i++) {
//            NSLog(@"4 %@",[NSThread currentThread]);
//        }
//    });
//    NSLog(@"5 %@",[NSThread currentThread]);
    
    //实例2 死锁
//    dispatch_queue_t queue = dispatch_queue_create("xm", DISPATCH_QUEUE_CONCURRENT);//不会死锁
//    dispatch_queue_t queue = dispatch_queue_create("xm", DISPATCH_QUEUE_SERIAL);//会死锁
//    NSLog(@"1 %@",[NSThread currentThread]);
//    dispatch_sync(queue, ^{
//        NSLog(@"2 %@",[NSThread currentThread]);
//        dispatch_sync(queue, ^{
//            NSLog(@"3 %@",[NSThread currentThread]);
//        });
//        for (int i=0; i<5; i++) {
//            NSLog(@"4 %@",[NSThread currentThread]);
//        }
//    });
//    NSLog(@"5 %@",[NSThread currentThread]);
    
    
    
    
    NSLog(@"多线程>>>>>>点击结束");
}


- (void)createConsumer {
    [self.condition lock];
    
    for (NSInteger i = 0; i<5; i++) {
        NSLog(@"===>>1111 num:%ld",i);
    }
    
    [self.condition wait];
    
    for (NSInteger i = 0; i<5; i++) {
        NSLog(@"====>>2222 num:%ld",i);
    }
    
    [self.condition unlock];
}


- (void)createSemaphore {
    for (NSInteger i = 0; i<5; i++) {
        NSLog(@"===>>1111 num:%ld",i);
    }
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    for (NSInteger i = 0; i<5; i++) {
        NSLog(@"====>>2222 num:%ld",i);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
