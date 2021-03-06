//
//  TimerViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/1.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property (nonatomic, strong) NSTimer *timer;



@end

@implementation TimerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Timer";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer block 来了");
//    }];
//    self.timer = timer;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"Timer 开始");
    
#pragma mark CADisplayLink
//    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
////    link.preferredFramesPerSecond = 1;
//    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];


#pragma mark
    //vc的dealloc会回来，但是timer还会继续执行，所以需要用用一个self.timer接收一下，然后在vc的dealloc中把time干掉。
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"timer block 来了");
//    }];
//    self.timer = timer;
    
#pragma mark tiemr self 循环引用
    //vc的dealloc都不回来，因为runloop 持有 timer，timer 持有 self，runLoop不释放 timer就没法释放 self也就没法释放。
//    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeRun) userInfo:nil repeats:YES];//循环引用
    
    
#pragma mark 后台运行，timer在后台会停止
//    sleep(15);
//
//    int i = 0;
//    while (i < 1000) {
//        i += 5;
//        sleep(3);
//        NSLog(@"=====>>>>>:%d",i);
        NSString *idfv = [[UIDevice currentDevice].identifierForVendor UUIDString];
//        NSLog(@"=====>>>>>>:idfv:%@",idfv);//0D470B6A-54D7-45B8-BBF6-21BE8421D6B8
//    }
    
    
    NSLog(@"Timer 结束");
}

- (void)timeRun {
    NSLog(@"timeRun");
}

- (void)tick:(CADisplayLink *)link {
    NSLog(@"====>>>:%f",link.timestamp);
}

- (void)dealloc {
    NSLog(@"%s",__func__);
//    [self.timer invalidate];
//    self.timer = nil;
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
