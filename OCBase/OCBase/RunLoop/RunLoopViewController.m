//
//  RunLoopViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/26.
//

#import "RunLoopViewController.h"
#import <Masonry/Masonry.h>


extern _objc_autoreleasePoolPrint();

@interface RunLoopViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSThread *thread;

@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunLoop";
    self.view.backgroundColor = [UIColor whiteColor];
    
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor redColor];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(100, 60));
        }];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    {
        UIScrollView *scroll = [[UIScrollView alloc] init];
        scroll.backgroundColor = [UIColor redColor];
        scroll.delegate = self;
        [self.view addSubview:scroll];
        [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(120);
            make.top.mas_equalTo(100);
            make.width.height.mas_equalTo(100);
        }];
        scroll.contentSize = CGSizeMake(200, 200);
//        scroll.contentOffset = CGPointMake(100, 100);
        scroll.showsHorizontalScrollIndicator = YES;
        scroll.showsVerticalScrollIndicator = YES;

        UILabel *lab = [[UILabel alloc] init];
        [scroll addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(scroll);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        lab.backgroundColor = [UIColor yellowColor];

        UILabel *lab1 = [[UILabel alloc] init];
        [scroll addSubview:lab1];
        [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.right.equalTo(scroll);//由于contentSize默认为CGSizeZero，所以这里有问题
            make.bottom.right.mas_equalTo(200);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
        lab1.backgroundColor = [UIColor blackColor];
    }
}

- (void)buttonClick:(UIButton *)sender {
    
#pragma mark 3、
//    [NSThread detachNewThreadWithBlock:^{
//        NSLog(@"子线程开始：%@",[NSThread currentThread]);
//        _objc_autoreleasePoolPrint();
//        [NSTimer scheduledTimerWithTimeInterval:7 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"time 来了");
//        }];
//        [self performSelector:@selector(afterFirstAddObserver) withObject:nil afterDelay:1];
//        [self performSelector:@selector(afterAddAutoObj) withObject:nil afterDelay:3];
//
//        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeInterval:10 sinceDate:[NSDate date]]];
//
//        NSLog(@"子线程结束：%@",[NSThread currentThread]);
//        _objc_autoreleasePoolPrint();
//    }];
    
#pragma mark 2、RunLoop退出时机，线程结束时。线程是处理器调度的基本单位，线程都不在了，runloop代码都没法运行了啊。
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//        NSLog(@"子线程开始：%@",[NSThread currentThread]);
//        [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"time 来了 %@",[NSThread currentThread]);
//            [self addRunLoopObserver:CFRunLoopGetCurrent()];
//        }];
//
//        [self performSelector:@selector(afterTheadExit) withObject:nil afterDelay:5];
//
//        [[NSRunLoop currentRunLoop] run];
//
//        NSLog(@"子线程结束：%@",[NSThread currentThread]);
//    }];
//    self.thread = thread;
//    [thread start];
    
#pragma mark 1、RunLoop退出时机，runUntilDate 时间到了 退出
//    [NSThread detachNewThreadWithBlock:^{
//        NSLog(@"子线程开始：%@",[NSThread currentThread]);
//        [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"time 来了");
//            [self addRunLoopObserver:CFRunLoopGetCurrent()];
//        }];
//
//        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeInterval:7 sinceDate:[NSDate date]]];
//
//        NSLog(@"子线程结束：%@",[NSThread currentThread]);
//    }];
}

- (void)afterTheadExit {
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
    [NSThread exit];
}

- (void)afterFirstAddObserver {
    [self addRunLoopObserver:CFRunLoopGetCurrent()];
}

- (void)afterAddAutoObj {
    NSLog(@"afterAddAutoObj  开始");
    _objc_autoreleasePoolPrint();
    __autoreleasing NSObject *obj = [[NSObject alloc] init];
    NSLog(@"afterAddAutoObj  obj");
    _objc_autoreleasePoolPrint();
    NSLog(@"afterAddAutoObj  @autoreleasepool 开始");
    @autoreleasepool {
        _objc_autoreleasePoolPrint();
    }
    NSLog(@"afterAddAutoObj  @autoreleasepool 结束");
    _objc_autoreleasePoolPrint();

}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    NSLog(@"%@",[[NSRunLoop currentRunLoop] currentMode]);
//    _objc_autoreleasePoolPrint();
    
#pragma mark 1、观察runLoop切换模式，runLoop的生命周期
    //滚动scrollView
//    [self addRunLoopObserver:CFRunLoopGetCurrent()];
//    [NSTimer scheduledTimerWithTimeInterval:7 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"time 来了");
//    }];
    
}

- (void)addRunLoopObserver:(CFRunLoopRef)runLoop {
    static CFRunLoopObserverRef observer;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        CFOptionFlags activities = (kCFRunLoopAllActivities);
        
        observer = CFRunLoopObserverCreateWithHandler(NULL, activities, YES, 720, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
            switch (activity) {
                case kCFRunLoopEntry:
                    NSLog(@"kCFRunLoopEntry  进入 RunLoop");
//                    _objc_autoreleasePoolPrint();
                    break;
                case kCFRunLoopBeforeTimers:
                    NSLog(@"kCFRunLoopBeforeTimers 即将处理Timer");
//                    _objc_autoreleasePoolPrint();
                    break;
                case kCFRunLoopBeforeSources:
                    NSLog(@"kCFRunLoopBeforeSources 即将处理Source");
//                    _objc_autoreleasePoolPrint();
                    break;
                case kCFRunLoopBeforeWaiting:
                    NSLog(@"kCFRunLoopBeforeWaiting 即将进入休眠");
//                    _objc_autoreleasePoolPrint();
                    break;
                case kCFRunLoopAfterWaiting:
                    NSLog(@"kCFRunLoopAfterWaiting 刚从休眠中唤醒");
//                    _objc_autoreleasePoolPrint();
                    break;
                case kCFRunLoopExit:
                    NSLog(@"kCFRunLoopExit 退出 RunLoop");
//                    _objc_autoreleasePoolPrint();
                    break;
                case kCFRunLoopAllActivities:
                    NSLog(@"kCFRunLoopAllActivities");
//                    _objc_autoreleasePoolPrint();
                    break;
                default:
                    break;
            }
        });
        CFRunLoopAddObserver(runLoop, observer, kCFRunLoopCommonModes);
        CFRelease(observer);
    });
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f %@",scrollView.contentOffset.x,[[NSRunLoop currentRunLoop] currentMode]);
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
