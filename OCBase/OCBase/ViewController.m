//
//  ViewController.m
//  OCBase
//
//  Created by xmly on 2021/7/1.
//

#import "ViewController.h"
//#import <AFNetworking.h>
#import "XMMicCancelableQueue.h"

#import <stdatomic.h>

#import <ios-ntp.h>

#import "Person.h"
#import "Person+Chat.h"
#import "Person+Ting.h"
#import <AVFoundation/AVAssetReader.h>
#import <Masonry/Masonry.h>
//#import <YYText/YYLabel.h>
#import <YYText.h>
#import <YYModel.h>

#import "XMChatActiveReconnectStrategy.h"
//#import "XMMacro.h"//static 小
//#import "Car.h"//非static 大
#import "XMLiveStream.h"
#import "XMLivePlayer.h"
#import "XMTestOne.h"
#import "MessageSend/MessageSendObject.h"
#import "CTMediator/CTMediator+CTMediatorModuleAActions.h"
#import "Runtime/RunTimeViewController.h"
#import "HitTest/HitTestViewController.h"
#import "AssociatedObject/AssObject.h"
#import "AssociatedObject/AssObject+Cate.h"
#import "Property/ProObject.h"
#import "MultiThreading/MultiThreadingVC.h"
#import "TheInnerManagement/InnerManageViewController.h"
#import "TheInnerManagement/InnerManageISAViewController.h"
#import "NSCopying/XMCopySong.h"
#import "NSCoding/XMCodingViewController.h"
#import "NSCoding/UserDefaultsViewController.h"
#import "MethodSwizzling/MethodSwizzlingVC.h"
#import "RunLoop/RunLoopViewController.h"
#import "CopyAndMutableCopy/CopyAndMutableCopyVC.h"
#import "SelfAndSuper/SelfAndSuperVC.h"
#import "Block/BlockViewController.h"
#import "KVO/KVOViewController.h"
#import "TableView/TableViewController.h"
#import "MVP/MVPViewController.h"
#import "Timer/TimerViewController.h"
#import "DrawRect/RrawRectViewController.h"
#import "Null/NullViewController.h"
#import "Notification/NotificationViewController.h"
#import "Protocol/XMRTCObj.h"
#import "ExtensionViewController.h"
#import "UUID/UUIDViewController.h"

//void funcTest(int a);//C函数 函数申明

typedef NS_OPTIONS(NSUInteger, YLOptions) {
    YLOptionsTop           =  1 << 0,   // 0000 0001
    YLOptionsBottom        =  1 << 1,   // 0000 0010
    YLOptionsLeft          =  1 << 2,   // 0000 0100
    YLOptionsRight         =  1 << 3,   // 0000 1000
};

#define __FILENAME__ (strrchr(__FILE__,'/')+1)

@interface ViewController () {
    NetworkClock * netClock;
//    NetAssociation *        netAssociation;
    
    NSDateFormatter * dateFormatter;
    
    dispatch_queue_t _ioQueueTest;
    void *_ioQueueTagTest;
}

@property (nonatomic, strong) XMMicCancelableQueue *ioQueue;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (atomic, assign) atomic_int sentinel;

@property (nonatomic, strong) dispatch_source_t source;
@property (nonatomic, strong) NSMutableArray *mArray;

@property (nonatomic, strong) YYLabel *text;

@property (nonatomic, strong) Person *person;
@property (nonatomic, copy) NSString *string;

@property (nonatomic, strong) UIView *viewBg;
@property (nonatomic, strong) UIStackView *stackView;

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) XMCopySong *song;



@end

@implementation ViewController

- (void)optionsDemo:(YLOptions)type{
    if (type & YLOptionsTop) {
        NSLog(@"上  %ld",type & YLOptionsTop);
    }
    if (type & YLOptionsBottom) {
        NSLog(@"下  %ld",type & YLOptionsBottom);
    }
    if (type & YLOptionsLeft) {
        NSLog(@"左  %ld",type & YLOptionsLeft);
    }
    if (type & YLOptionsRight) {
        NSLog(@"右  %ld",type & YLOptionsRight);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    NSLog(@"%s",__FUNCTION__);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    NSLog(@"%s",__FUNCTION__);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    NSLog(@"%s",__FUNCTION__);
}

- (void)dealloc {
    NSLog(@"%s",__FUNCTION__);
    _ioQueueTest = NULL;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
//    NSLog(@"%s",__FUNCTION__);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.string = @"你好啊邓亚洲哈哈哈邓哈哈哈 哈哈哈你说的对很对呵呵呵";
    
    self.title = @"第二页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%s",__FUNCTION__);
    
#pragma mark UI =======================begin=======================
    
#pragma mark 6、UIView 和 CALayer
//    转移到RrawRectViewController中
    
#pragma mark 5、drawRect
//    转移到RrawRectViewController中
    
#pragma mark 4、定时器的开始暂停
//    {
//        UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button0 setTitle:@"Start" forState:UIControlStateNormal];
//        button0.backgroundColor = [UIColor grayColor];
//        [button0 addTarget:self action:@selector(onStartPlayClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button0];
//        [button0 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(10);
//            make.bottom.mas_equalTo(-150);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(30);
//        }];
//
//        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button1 setTitle:@"Stop" forState:UIControlStateNormal];
//        button1.backgroundColor = [UIColor grayColor];
//        [button1 addTarget:self action:@selector(onStopPlayClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button1];
//        [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(button0.mas_right).offset(10);
//            make.top.mas_equalTo(button0.mas_top);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(30);
//        }];
//
//        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button2 setTitle:@"Pause" forState:UIControlStateNormal];
//        button2.backgroundColor = [UIColor grayColor];
//        [button2 addTarget:self action:@selector(onPausePlayClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button2];
//        [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(button1.mas_right).offset(10);
//            make.top.mas_equalTo(button0.mas_top);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(30);
//        }];
//
//        UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button3 setTitle:@"Resume" forState:UIControlStateNormal];
//        button3.backgroundColor = [UIColor grayColor];
//        [button3 addTarget:self action:@selector(onResumePlayClick:) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:button3];
//        [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(button2.mas_right).offset(10);
//            make.top.mas_equalTo(button0.mas_top);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(30);
//        }];
//    }
    
#pragma mark 3、masonry
//    {
//        UIView *view = [[UIView alloc] init];
//        [self.view addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(10);
//            make.top.offset(100);
//            make.size.mas_equalTo(CGSizeMake(100, 50));
//        }];
//        view.backgroundColor = [UIColor redColor];
//
//        UIView *view1 = [[UIView alloc] init];
//        [self.view addSubview:view1];
//        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.left.equalTo(view.mas_right).offset(20);//"make.left" 相对于 "view.mas_right" 的偏移 offset(20)
//            make.left.equalTo(view.mas_right).offset(-20);//offset 向右为正
////            make.top.equalTo(view);//top，equalTo(view) 默认是前面top属性
////            make.top.equalTo(view.mas_top);
//            make.top.equalTo(view).offset(-10);//offset 向下为正
////            make.width.mas_equalTo(100).multipliedBy(0.7);//设置比例是，mas_equalTo(100)不能为数字。❌
////            make.width.mas_equalTo(view).multipliedBy(0.7);
//            make.width.mas_equalTo(view.mas_height).multipliedBy(0.7);//比例
////            make.height.mas_equalTo(100);
////            make.height.mas_lessThanOrEqualTo(100);//小于或等于
////            make.height.lessThanOrEqualTo(view);
////            make.height.mas_greaterThanOrEqualTo(100);//大于或等于
//            make.height.greaterThanOrEqualTo(view);//默认为等于的值。make.height.greaterThanOrEqualTo(view)的优先级比 make.height.mas_equalTo(30)高
////            make.height.greaterThanOrEqualTo(view).priorityLow();//设置优先级
//            make.height.mas_equalTo(130);
//        }];
//        view1.backgroundColor = [UIColor cyanColor];
//    }
    
    
#pragma mark 2、"view insertSubview:view1 aboveSubview:view2" view1添加在view上，并且view1在view2的上面
//    {
//        UIView *view1 = [UIView new];
//        view1.backgroundColor = [UIColor redColor];
//        [self.view addSubview:view1];
//        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.offset(-16);
//            make.bottom.offset(-14);
//            make.size.mas_equalTo(CGSizeMake(100, 100));
//        }];
//
//        UIView *view2 = [UIView new];
//        view2.backgroundColor = [UIColor yellowColor];
//        [self.view addSubview:view2];
//        [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.offset(-32);
//            make.bottom.offset(-28);
//            make.size.mas_equalTo(CGSizeMake(100, 100));
//        }];
//
//        CGFloat widht = [UIScreen mainScreen].bounds.size.width;
//        CGFloat height = [UIScreen mainScreen].bounds.size.height;
////        UIView *view3 = [UIView new];
//        UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(widht-100, height-42-100, 100, 100)];
//        view3.backgroundColor = [UIColor orangeColor];
////        [self.view addSubview:view3];
////        [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.right.offset(-48);
////            make.bottom.offset(-42);
////            make.size.mas_equalTo(CGSizeMake(100, 100));
////        }];
//        [self.view insertSubview:view3 aboveSubview:view1];//把view3添加到self.view上，并且view3在view1的上面（这里的上面是指他们在同一个self.view，只是view3盖在view1上）
//    }
    
#pragma mark 1、UIScrollView
    //转移到RunLoopViewController中
    
#pragma mark UI =======================end=======================
    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    self.ioQueue = [[XMMicCancelableQueue alloc] init:"com.xmly.mic.queue" attr:DISPATCH_QUEUE_SERIAL];
    
    _ioQueueTest = dispatch_queue_create("com.xmly.ioQueue", DISPATCH_QUEUE_SERIAL);
    _ioQueueTagTest = &_ioQueueTagTest;
    void *nonNullUnusedPointer = (__bridge void *)self;
    dispatch_queue_set_specific(_ioQueueTest, _ioQueueTagTest, nonNullUnusedPointer, NULL);
    
    
    NSLog(@"你好 喜马拉雅！");
//    self.person = [[Person alloc] init];
//    char *abc = "abcd";
//    void *context = abc;
//    [self.person addObserver:self forKeyPath:@"abc" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:context];
    
    
//    per.beforeStartTime = [NSNumber numberWithInteger:round([[NSDate date] timeIntervalSince1970] * 1000)];
//    self.mArray = [[NSMutableArray alloc] initWithCapacity:1];
//    [self.mArray addObject:per];
    
    self.sentinel = 10;
    
    
    dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    dateFormatter.timeStyle = NSDateFormatterMediumStyle;
    dateFormatter.locale = [NSLocale currentLocale];
    
    netClock = [NetworkClock sharedNetworkClock];
    
//    [self p_timeRun];

//    [self optionsDemo:YLOptionsTop|YLOptionsRight];
    
    
}


- (void)onStartPlayClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(sendPlaySEIInfo) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
- (void)onStopPlayClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)onPausePlayClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
    [self.timer setFireDate:[NSDate distantFuture]];
}
- (void)onResumePlayClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
    [self.timer setFireDate:[NSDate date]];
}

- (void)sendPlaySEIInfo {
    NSLog(@"%s",__func__);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == "abcd") {
        NSLog(@"=== ***%@",change);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

+ (void)trackModule:(NSString *)module subModule:(NSString *)subModule format:(id)format
{
    Class xlogClass = NSClassFromString(@"XMXlogHelper");
    if (xlogClass) {
        SEL logSEL = NSSelectorFromString(@"logWithModuleName:subModuleName:fileName:lineNumber:funcName:message:");
        if ([xlogClass respondsToSelector:logSEL]) {
            IMP logIMP = [xlogClass methodForSelector:logSEL];
            void (*LogFunc)(id, SEL, NSString *, NSString *, const char *, int, const char *, id) = (void *)logIMP;
            LogFunc(xlogClass, logSEL, module, subModule, NULL, 0, NULL, format);
        }
    }
}

- (void)apmModule:(NSInteger)logLevel module:(const char * _Nullable)module file:(const char * _Nullable)file line:(int)line funcName:(const char * _Nullable)funcName message:(NSString * _Nullable)message {
    Class apmClass = NSClassFromString(@"XMAPM");
    if (apmClass) {
        SEL apmSEL = NSSelectorFromString(@"XMAPMLog:module:file:line:funcName:message:");
        if ([apmClass respondsToSelector:apmSEL]) {
            IMP apmIMP = [apmClass methodForSelector:apmSEL];
            void (*ApmFunc)(id, SEL, NSInteger, const char *, const char *, int, const char *, NSString *) = (void *)apmIMP;
            ApmFunc(apmClass, apmSEL, logLevel, module, file, line, funcName, message);
        }
    }
}

- (void)p_timeRun {
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, 0 * NSEC_PER_SEC), 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        static int a = 1;
        NSLog(@"*** %d",a);
        a++;
//        NSDate *dateNow = [NSDate date];//系统现在时间
////        NSTimeInterval doubleNow = ([dateNow timeIntervalSince1970] + self.offset)*1000;
//        NSTimeInterval doubleNow = ([dateNow timeIntervalSince1970])*1000;
//        NSString *strNow = [NSString stringWithFormat:@"%f",doubleNow];
//        NSDictionary *dic = @{@"currentTime":strNow,@"streamId":self.micSDKInfo.streamId};
//        NSString *jsonString = [dic yy_modelToJSONString];
//
//        const unsigned char *cString = (const unsigned char *)[jsonString cStringUsingEncoding:NSUTF8StringEncoding];
//        int strlength = (int)[jsonString lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
//
//        [self sendMediaSideInfo:cString dataLen:strlength];
        
//        NSLog(@"%@",[NSThread currentThread]);
//        self.labelTitle.text = [NSString stringWithFormat:@"Network Clock: %@",
//                                [self->dateFormatter stringFromDate:self->netClock.networkTime]];
        
    });
    
    self.source = timer;
    
}

- (IBAction)buttonStart:(UIButton *)sender {
//    dispatch_resume(self.source);
    
//    Person *per = self.mArray.firstObject;
//    per.beforeStartTime = [NSNumber numberWithInteger:round([[NSDate date] timeIntervalSince1970] * 1000)];
}

- (IBAction)buttonPause:(UIButton *)sender {
//    dispatch_suspend(self.source);
}

- (IBAction)buttonContinue:(UIButton *)sender {
//    dispatch_resume(self.source);
}
- (IBAction)buttonCancel:(UIButton *)sender {
//    dispatch_source_cancel(self.source);
//    Person *per = self.mArray.firstObject;
//    NSLog(@"%ld",per.beforeStartTime.integerValue);
}

- (void)putWithTag:(NSString *)tag path:(nullable NSString *)path Format:(NSString *)format, ...
{
    va_list ap;

    va_start (ap, format);

    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    NSLog(@"=== >>>:%@",body);

    va_end (ap);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"开始");
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSLog(@"=====>>>>width:%@",@(size.width));
    
        
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        NSLog(@"结束啦");
//    });

//    NSOrderedSet *set = [[NSOrderedSet alloc] init];
//    static const char *extraTextFormatInfo =
//        "\006\002\005\000\003\006\000\005\017\000\006\n\000\007\010\000\010\010\000";
//    NSValue *extraInfoValue = [NSValue valueWithPointer:extraTextFormatInfo];
    
//    dispatch_async_on_main_queue_dyz(^{
//        NSLog(@"888");
//    });
    
#pragma mark 65、测试一下数数的新电脑Temp
    
#pragma mark 64、NSProcessInfo 进程相关
//    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
//    processInfo.processName;
//    processInfo.hostName;
//    processInfo.environment;
//    processInfo.systemUptime;
    

#pragma mark 62、扩展Extension
//    ExtensionViewController *vc = [[ExtensionViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 62、扩展Extension
//    ExtensionViewController *vc = [[ExtensionViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 61、判断字符串是否包含指定的字符串
    //containsString 方法区分小写字母(iOS 8.0)
    //localizedCaseInsensitiveContainsString 方法不区分小写字母(iOS 8.0)
    //localizedStandardContainsString 方法不区分小写字母(iOS 9.0)
//    NSString *str = @"abcz";
//    if ([str localizedStandardContainsString:@"Z"]) {
//        NSLog(@"包含");
//    } else {
//        NSLog(@"不包含");
//    }
    
#pragma mark 60、YYLabel 绘制
//    YYLabel *label = [[YYLabel alloc] init];
//    label.frame = CGRectMake(100, 100, 80, 40);
//    label.text = @"你好 世界";
//    [self.view addSubview:label];
    
#pragma mark 59、协议中使用@synthesize
//    XMRTCObj *obj = [[XMRTCObj alloc] init];
//    obj.businessType = @"123";
//    NSLog(@"====%@",obj.businessType);
    
#pragma mark 58、通知
//    NotificationViewController *vc = [[NotificationViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 57、drawRect
//    RrawRectViewController *vc = [[RrawRectViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 56、Timer 释放
//    TimerViewController *vc = [[TimerViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 55、MVP
//    MVPViewController *vc = [[MVPViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 54、tableView
//    TableViewController *vc = [[TableViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 53、KVO
//    KVOViewController *vc =[[KVOViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 52、block
//    BlockViewController *vc = [[BlockViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 51、self & super
//    SelfAndSuperVC *vc = [[SelfAndSuperVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 50、深浅拷贝
//    CopyAndMutableCopyVC *vc = [[CopyAndMutableCopyVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 49、RunLoop
//    RunLoopViewController *vc = [[RunLoopViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:true];
    
#pragma mark 48、方法交换
//    MethodSwizzlingVC *vc = [[MethodSwizzlingVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 47、喜马拉雅 n+1
//    double num7 = 23000+330;
//    double num8 = 23000+330;
//    double num9 = 23000+330;
//    double num10 = 23000+255;
//    double num11 = 23000+330;
//    double num12 = 23000+345;
//    double numFuWu = 11594.52;
//    double numJiXiao = 11500;
//    double num1 = 23000+285+1500;
//    double num2 = 23000+210;
//    double num3 = 23000+345;
//
//    double tot = num7 + num8 + num9 + num10 + num11 + num12 + numFuWu + numJiXiao + num1 + num2 + num3;
//    NSLog(@"tot:%f",tot);//234354.520000
//
//    double average = tot / 9.0;
//    NSLog(@"average:%f",average);//26039.391111
//    double compensate = average + 23000+330;
//    NSLog(@"compensate:%f",compensate);//49369.391111
    
#pragma mark 47、序列化
//    XMCodingViewController *vc = [[XMCodingViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 48、沙盒
//    UserDefaultsViewController *vc = [[UserDefaultsViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 46、copy修饰的属性 被赋值，需要实现NSCopying协议。"copyWithZone"里面如果直接返回self，那么就相当于strong，如果返回一个新的XMCopySong对象，那么这个"copy修饰的属性"就指向这个新的XMCopySong对象。
//    XMCopySong *cSong = [[XMCopySong alloc] init];
//    self.song = cSong;
//    cSong.name = @"嘿嘿";
//    cSong.age = 32;
//    NSLog(@"%ld",self.song.age);
    
#pragma mark 45、内存管理 isa 打印，必须是.mm文件哦
//    InnerManageISAViewController *vc = [[InnerManageISAViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 45、内存管理
//    InnerManageViewController *vc= [[InnerManageViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:true];
    
#pragma mark 44、__autoreleasing
//    __autoreleasing NSObject *obj = [[NSObject alloc] init];
    
#pragma mark 43、多线程
//    MultiThreadingVC *vc = [[MultiThreadingVC alloc] init];
//    [self.navigationController pushViewController:vc animated:true];
    
#pragma mark 42、如何高性能的画一个圆角?
//    UILabel *label = [[UILabel alloc] init];
//    label.layer.cornerRadius = 5;
//    label.layer.masksToBounds = YES;
//    首先上面的方式是不可取的，会触发离屏渲染。
//    如果能够只用cornerRadius解决问题，就不用优化。
//    如果必须设置masksToBounds，可以参考圆角视图的数量，如果数量较少(一页只有几个)也可以考虑不用优化。
//    UIImageView的圆角通过直接截取图片实现，其它视图的圆角可以通过CoreGraphics画出圆角矩形实现。
    
#pragma mark 41、@synthesize 合成成员变量规则
    //image lookup -t ProObject 查看
//    NSLog(@"");
    
#pragma mark 41、property
//    ProObject *obj = [[ProObject alloc] init];
////    obj.name = @"嘿嘿";
//    ProObject.cAge = 100;
//    NSLog(@"cAge:%ld",ProObject.cAge);
    
#pragma mark 40、关联对象
//    AssObject *obj = [[AssObject alloc] init];
//    obj.name = @"嘿嘿";
//    obj.car = @"凯迪拉克";
//    NSLog(@"%@-%@",obj.name,obj.car);
    
#pragma mark 39、响应者链条
//    HitTestViewController *vc = [[HitTestViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 38、Runtime
//    RunTimeViewController *runVC = [[RunTimeViewController alloc] init];
//    [self.navigationController pushViewController:runVC animated:YES];
    
#pragma mark 37、CTMediator
//    [[CTMediator sharedInstance] CTMediator_OCBase];
    
//    NSString *str = [[CTMediator sharedInstance] CTMediator_TestTwo];
//    NSLog(@"%@",str);
    
//    NSInteger num = [[CTMediator sharedInstance] CTMediator_TestThree];
//    NSLog(@"%ld",(long)num);
    
    
#pragma mark 36、消息转发
//    MessageSendObject *obj = [[MessageSendObject alloc] init];
//    [obj testTwo];
    
#pragma mark 35、是否有这个字体UIFont
//    if ([UIFont fontWithName:@"PingFangSC-Regular" size:12]) {
//        NSLog(@"有");
//    } else {
//        NSLog(@"没有");
//    }
    
#pragma mark 34、nil 转成字符串就是 (null)
//    NSString *str = nil;
//    NSLog(@"===%@===",str);
    
#pragma mark 31、switch 不同case执行相同代码
//    NSInteger index = 4;
//    switch (index) {
//        case 1:
//        case 4:
//        case 5:
//            NSLog(@"Song");
//            break;
//        case 2:
//            NSLog(@"song");
//            break;
//        case 3:
//            NSLog(@"it");
//            break;
//        default:
//            NSLog(@"default");
//            break;
//    }
    
    
#pragma mark 30、(NSInteger)dic[@"type"] 错误
//    NSString *str = @"1000";
//    if ((NSInteger)str == 1000) {
//        NSLog(@"==>0:错误");
//    }
//    if ([str integerValue] == 1000) {
//        NSLog(@"==>1:对");
//    }
//    if ([str isEqualToString:@"1000"]) {
//        NSLog(@"==>2:对");
//    }
    
//    NSDictionary *dic = @{@"type":@(1000)};
//    if ((NSInteger)dic[@"type"] == 1000) {
//        NSLog(@"==>0:错误");
//    }
//    if ([dic[@"type"] integerValue] == 1000) {
//        NSLog(@"==>1:对");
//    }
//    if ([dic[@"type"] isEqualToString:@"1000"]) {
//        NSLog(@"==>2:崩溃");
//    }
    
#pragma mark 29、C 函数申明
    //C函数如果没添加头文件，直接申明一下函数 就OK了
//    void funcTest(int a);//函数申明
//    funcTest(12);//函数调用
    
#pragma mark 28、return只在当前method中起作用
//    [self testReturn];
    
#pragma mark 27、为什么 NSTimer 有时候不好使
    //因为创建的 NSTimer 默认是被加入到了 defaultMode ，所以当 Runloop 的 Mode 变 化时，当前的 NSTimer 就不会工作了。
//    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        static int i = 0;
//        NSLog(@"timer 执行了%d",i++);
//    }];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
#pragma mark 27、NSTimer 不会立刻执行
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:10 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSString *dateStr = [[NSDate date] description];
//        NSThread *thread = [NSThread currentThread];
//        NSLog(@"===>>>:%@ %@",dateStr,thread);
//    }];
    
#pragma mark 26、git 下载
    //git clone http://gitlab.alibaba-inc.com/damai-mz/mz-common.git

#pragma mark 25、dispatch_once_t，输入 snippet
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        <#code to be executed once#>
//    });
    
//    dispatch_after，输入 snippet
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        <#code to be executed after a specified delay#>
//    });
    
#pragma mark 24、延迟调用 dispatch_after
//    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC);
//    dispatch_after(when, _ioQueueTest, ^{
//        NSLog(@"=== >>> :%@",self.string);//这里不会产出循环引用
//        NSLog(@"=== >>> Thread:%@",[NSThread currentThread]);
//    });
    
#pragma mark 23、 ... === ##__VA_ARGS__
    //##__VA_ARGS__ 代表多参数
    //... 代表多参数
    //"(NSString *)format, ..." 一起组成字符一个字符串
    //format 代表第一个字符串
    
//    NSString *str = @"a %s b %@ c %@";
//    NSString *str = @"a";
//    [XMTestOne putWithTag:@"XMIMCore" path:@"liveChat" Format:[NSString stringWithFormat:@"12 === %@ === %@",@"34",str]];//错误,如果str中有%@或%s，就会导致format中有%@或%s，里面再调用[[NSString alloc] initWithFormat:format arguments:ap]，就会导致参数匹配不是而崩溃
//    [XMTestOne putWithTag:@"XMIMCore" path:@"liveChat" Format:@"12 === %@ === %@",@"34",str];
//    [XMTestOne putWithTag:@"XMIMCore" path:@"liveChat" Format:@"12",@"34",@"56"];
//    XMTestOneLog(@"XMIMCore", @"liveChat", @"12 === %@ === %@",@"34",str);
//    NSLog(@"===987===123");
    
#pragma mark 22、NSPredicate
//    NSMutableArray *arraySource = [[NSMutableArray alloc] initWithCapacity:4];
//    XMLivePlayer *livePlayer1 = [XMLivePlayer  livePlayer:1001 roomName:@"房间3" property1:@"广告1" property2:20];
//    XMLivePlayer *livePlayer2 = [XMLivePlayer  livePlayer:1002 roomName:@"房间2" property1:@"广告2" property2:21];
//    XMLivePlayer *livePlayer3 = [XMLivePlayer  livePlayer:1003 roomName:@"房间3" property1:@"广告3" property2:22];
//    XMLivePlayer *livePlayer4 = [XMLivePlayer  livePlayer:1004 roomName:@"房间4" property1:@"广告4" property2:23];
//    [arraySource addObject:livePlayer1];
//    [arraySource addObject:livePlayer2];
//    [arraySource addObject:livePlayer3];
//    [arraySource addObject:livePlayer4];
//
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.roomInfo.roomId == %@", @(1002)];//对
////    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.roomInfo.roomId == %d", 1002];//对
////    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.roomInfo.roomName == %@", @"房间3"];//对
//    NSArray *array = [arraySource filteredArrayUsingPredicate:predicate];
//
//    for (XMLivePlayer *player in array) {
//        NSLog(@"player:%@",player.description);
//    }
    
#pragma mark 21、description
    //NSLog(@"===>>>:%@",date);//打印的是 当前UTC时间所对应的本地时间，更改时区 这个值会变
    //NSLog(@"===>>>:%@",date.description);//打印的是 UTC时间，更改时区 这个值不变
    
#pragma mark 21、时区
    // 获取所有已知的时区名称
//    NSArray *zoneNames = [NSTimeZone knownTimeZoneNames];
//    [zoneNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"===>>>:%ld ==:%@",idx,obj);
//    }];
    
    //localTimeZone、defaultTimeZone、systemTimeZone 都是手机系统设置的时区，三者值相等
//    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];// 获取本地时区
//    NSTimeZone *defaultTimeZone = [NSTimeZone defaultTimeZone];// 获取默认时区
//    NSTimeZone *systemTimeZone = [NSTimeZone systemTimeZone];// 获取系统时区
//    NSLog(@"name:%@ data:%@",localTimeZone.name,localTimeZone.data);
//    NSLog(@"name:%@ data:%@",defaultTimeZone.name,defaultTimeZone.data);
//    NSLog(@"name:%@ data:%@",systemTimeZone.name,systemTimeZone.data);
    
#pragma mark 21、UTC/GMT 0 (零时区)
//    NSDate *date = [NSDate date];//默认是UTC(零时区)时间，手机系统时间改了，这个也跟着变，但是还是UTC(零时区)时间
//    NSLog(@"===>>>:%@",date);//打印的是 手机系统设置时区的 时间，更改时区 这个值会变
//    NSLog(@"===>>>:%@",date.description);//打印的是 UTC时间，更改时区 这个值不变，但是更改手机系统时间，这个就变了
    
#pragma mark 21、NSDateFormatter
    // 实例1
//    NSDate *date = [NSDate date];
//    NSLog(@"===>>>:%@",date);
//    NSLog(@"===>>>:%@",date.description);
//
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
////    formatter.timeZone = [NSTimeZone systemTimeZone];
////    formatter.timeZone = [NSTimeZone localTimeZone];
////    formatter.timeZone = [NSTimeZone defaultTimeZone];
////    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
//    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];//America/Chicago、Asia/Shanghai
//    NSString *dateStr = [formatter stringFromDate:date];//把date 转化为formatter中对应时区所在 时间的字符串
//    NSLog(@"===>>>:%@",dateStr);
    
    // 实例2
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
//    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
//    //10:55 == >> 02:55
////    NSDate *date = [formatter dateFromString:@"2022-06-14 11:32:00"];//会把输入的字符串 2022-06-14 11:32:00 改成 formatter中时区所对应的时间
//    NSDate *date = [formatter dateFromString:@"2022-06-14 11:40:00"];
//    NSLog(@"===>>>:%@",date);//打印的是 手机系统设置时区的 时间
//    NSLog(@"===>>>:%@",date.description);//打印的是 UTC时间
//
//    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//    formatter1.dateFormat = @"yyyy-MM-dd HH:mm:ss";
////    formatter1.timeZone = [NSTimeZone localTimeZone];
////    formatter1.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
////    formatter1.timeZone = [NSTimeZone timeZoneWithName:@"Europe/Moscow"];
////    formatter1.timeZone = [NSTimeZone defaultTimeZone];
//    NSString *dateStr = [formatter1 stringFromDate:date];//把date 转化为formatter中对应时区所在 时间的字符串
//    NSLog(@"===>>>:%@",dateStr);

//    NSString *str = [NSDate date].description;
//    NSLog(@"===>>>:%@",str);
//    NSDate *date = [NSDate date];
//    NSDate *dateNow = [NSDate now];
//    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:0];
//    NSLog(@"===>>>:%@",date.description);
//    NSLog(@"===>>>:%@",dateNow.description);
//    NSLog(@"===>>>:%@",date1);
    
#pragma mark iOS 世界标准时间UTC/GMT
    //默认都是UTC/GMT时间
//    NSDate *date = [NSDate date];
//    NSLog(@"===>>>date:%@",date);
//    NSLog(@"===>>>description:%@",date.description);
//    NSTimeZone *timeZoneUTC = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT，UTC打印也是GMT
////    NSLog(@"name:%@,description:%@",timeZoneUTC.name,timeZoneUTC.description);//name:GMT,description:GMT (GMT) offset 0
//    NSLog(@"name:%@,description:%@",timeZoneUTC.name,timeZoneUTC);
//    NSTimeZone *timeZoneLocal = [NSTimeZone localTimeZone];
////    NSLog(@"name:%@,description:%@",timeZoneLocal.name,timeZoneLocal.description);//name:Asia/Shanghai,description:Local Time Zone (Asia/Shanghai (GMT+8) offset 28800)
//    NSLog(@"name:%@,description:%@",timeZoneLocal.name,timeZoneLocal);
//    NSInteger timeZoneUTCOffSet = [timeZoneUTC secondsFromGMTForDate:date];
//    NSLog(@"timeZoneUTCOffSet:%ld",timeZoneUTCOffSet);//timeZoneUTCOffSet:0
//    NSInteger timeZoneLocalOffSet = [timeZoneLocal secondsFromGMTForDate:date];
//    NSLog(@"timeZoneUTCOffSet:%ld",timeZoneLocalOffSet);//timeZoneUTCOffSet:28800
//
//    NSDate *dateLocal = [[NSDate alloc] initWithTimeInterval:timeZoneLocalOffSet sinceDate:date];
//    NSLog(@"===>>>:%@",dateLocal);
//    NSLog(@"===>>>:%@",dateLocal.description);
    
#pragma mark 20、timeIntervalSince1970 时间戳是秒  timeIntervalSinceNow
//    NSTimeInterval date = [[NSDate date] timeIntervalSince1970]*1000;

//    NSMutableDictionary *xlogDict = [NSMutableDictionary dictionary];
//    xlogDict[@"dataTime1"] = @(date);
//    xlogDict[@"dataTime2"] = @(floor(date));
//    NSLog(@"===>>>:%@",xlogDict);
    
//    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
//    NSTimeInterval timeInterval1 = [date timeIntervalSince1970];//相对于1970的时间戳
//    NSTimeInterval timeInterval2 = [date timeIntervalSinceNow];//相对于现在的时间戳
//    NSLog(@"===>>>:%f",timeInterval1);
//    NSLog(@"===>>>:%f",timeInterval2);
    
#pragma mark 20、dateWithTimeIntervalSinceNow: 当前时间往后几秒的时间
//    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];//当前时间往后几秒的时间
//    NSLog(@"===>>>:%@",date);
//    NSLog(@"====>>>>:%@",date.description);
//    NSDate *dateNow = [NSDate date];
//    NSLog(@"===>>>:%@",dateNow);
//    NSLog(@"====>>>>:%@",dateNow.description);
   

#pragma mark 19、yy_modelToJSONObject
//    XMLiveStream *str = [[XMLiveStream alloc] init];
//    str.userID = @"0001";
//    str.userName = @"渠龟传";
//    str.streamID = @"";
//    str.extraInfo = @"额外信息";
////    str.renderView = [[UIView alloc] init];
//
//    NSArray *strams = @[str,str];
//
////    NSString *jsonObje = [strams yy_modelToJSONObject];
//    NSString *jsonObje = [str yy_modelToJSONObject];
//    NSLog(@"====>>>>:%@",jsonObje);
//
//    NSMutableArray *dicArray = [[NSMutableArray alloc] initWithCapacity:1];
//    for (XMLiveStream *str in strams) {
//        NSMutableDictionary *dicStream = [[NSMutableDictionary alloc] initWithCapacity:0];
//        if (str.userID) {
//            [dicStream setObject:str.userID forKey:@"userID"];
//        }
//        if (str.userName) {
//            [dicStream setObject:str.userName forKey:@"userName"];
//        }
//        if (str.streamID) {
//            [dicStream setObject:str.streamID forKey:@"streamID"];
//        }
//        if (str.extraInfo) {
//            [dicStream setObject:str.extraInfo forKey:@"extraInfo"];
//        }
//        if (str.renderView) {
//            [dicStream setObject:str.renderView forKey:@"renderView"];
//        }
//        [dicArray addObject:dicStream];
//    }
////    NSLog(@"===>>>:%@",dicArray);
    
#pragma mark 18、数组元素求和
//    NSArray *array= [NSArray arrayWithObjects:@"2.0",@"2.3",@"3.0",@"4.0",@"10",nil];
//
//    CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
//    CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
//    CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
//    CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
    
//    NSMutableArray *array = [Car getCarElement];//age 为NSInteger
////    NSLog(@"%@",[array yy_modelToJSONObject]);
//    CGFloat sum = [[array valueForKeyPath:@"@sum.age"] integerValue];
//    CGFloat avg = [[array valueForKeyPath:@"@avg.age"] floatValue];
//    CGFloat max = [[array valueForKeyPath:@"@max.age"] integerValue];
//    CGFloat min = [[array valueForKeyPath:@"@min.age"] integerValue];
    
//    NSMutableArray *array = [Car getCarElement];//high 为NSNumber
//    CGFloat sum = [[array valueForKeyPath:@"@sum.high"] integerValue];
//    CGFloat avg = [[array valueForKeyPath:@"@avg.high"] floatValue];
//    CGFloat max = [[array valueForKeyPath:@"@max.high"] integerValue];
//    CGFloat min = [[array valueForKeyPath:@"@min.high"] integerValue];
    
#pragma mark 17、NSRegularExpression 正则
//    NSString *line = @"[12abc,[56ckj";
//    NSRegularExpression *lineTimeRex = [NSRegularExpression regularExpressionWithPattern:@"\\[\\d+" options:0 error:nil];
////    NSTextCheckingResult *ret = [lineTimeRex firstMatchInString:line options:0 range:NSMakeRange(0, line.length)];//返回一个
////    NSString *lineTime = [line substringWithRange:ret.range];
////    NSLog(@"%@",lineTime);
//    NSArray *retArr = [lineTimeRex matchesInString:line options:0 range:NSMakeRange(0, line.length)];//返回数组
//    for (NSTextCheckingResult *ret in retArr) {
//        NSString *lineTime = [line substringWithRange:ret.range];
//        NSLog(@"%@",lineTime);
//    }
    
#pragma mark 16、YYTextLayout 计算文本
//    NSMutableAttributedString *contentText = [[NSMutableAttributedString alloc] initWithString:self.string];
//    contentText.yy_font = [UIFont systemFontOfSize:10];
//
//    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(100, MAXFLOAT)];
//    YYTextLayout *layout = [YYTextLayout layoutWithContainer:container text:contentText];
//    layout.textBoundingRect.size.width;
//    layout.textBoundingRect.size.height;
    
    //系统计算方法
//    CGRect systemLayout = [self.string boundingRectWithSize:CGSizeMake(100, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]} context:nil];
//    systemLayout.size.width;
//    systemLayout.size.height;
    
#pragma mark 15、NSCharacterSet
//    1 controlCharacterSet//控制符
//    2 whitespaceCharacterSet //两端空格
//    3 whitespaceAndNewlineCharacterSet//空格换行
//    4 decimalDigitCharacterSet//小数
//    5 letterCharacterSet//文字
//    6 lowercaseLetterCharacterSet//小写字母
//    7 uppercaseLetterCharacterSet//大写字母
//    8 nonBaseCharacterSet//非基础
//    9 alphanumericCharacterSet//字母数字
//    10 decomposableCharacterSet//可分解
//    11 illegalCharacterSet//非法
//    12 punctuationCharacterSet//标点
//    13 capitalizedLetterCharacterSet//大写
//    14 symbolCharacterSet//符号
//    15 newlineCharacterSet//换行符

//    NSCharacterSet *chara = [NSCharacterSet characterSetWithCharactersInString:@"~^G"];
//    NSLog(@"%@",chara);
    
#pragma mark 14、componentsSeparatedByCharactersInSet 字符分割
//    NSString *str = @"A~B^C";
////    NSArray *array = [str componentsSeparatedByString:@"~"];
//    NSArray *array = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"~^"]];
//    NSLog(@"%@",array);
//    NSString *result = [array componentsJoinedByString:@"="];//array元素组成字符串
//    NSLog(@"%@",result);
    
#pragma mark stringByTrimmingCharactersInSet 去掉特殊字符
//    NSCharacterSet *chara = [NSCharacterSet whitespaceCharacterSet];//两端空格
//    NSString *str = @" abc def ";
//    NSString *rstr = [str stringByTrimmingCharactersInSet:chara];//去掉两端空格
//    NSLog(@"--%@--",rstr);
    
#pragma mark stringByReplacingOccurrencesOfString 字符替换
//    NSString *str = [@"1hello23hhhh2" stringByReplacingOccurrencesOfString:@"2" withString:@"D"];
//    NSLog(@"%@",str);
    
#pragma mark 13、字节数组转NSData
//    Byte byte[] = {0x09,0x00,0x00,0x4a,
//                   0x06,0x51,0x5f,0x00,
//                   0x00,0x00,0x00,0x27,
//                   0x01,0x00,0x00,0x00,
//                   0x00,0x00,0x00,0x41,
//        0x18,0x00,0x00,0x03,
//        0xe9,0x7b,0x22,0x73,
//        0x74,0x72,0x65,0x61,
//        0x6d,0x49,0x64,0x22,
//        0x3a,0x22,0x73,0x5f,
//        0x2d,0x35,0x2d,0x35,
//        0x35,0x32,0x2d,0x33,
//        0x33,0x33,0x35,0x2d,
//        0x31,0x2d,0x30,0x22,
//        0x2c,0x22,0x63,0x75,
//        0x72,0x72,0x65,0x6e,
//        0x74,0x54,0x69,0x6d,
//        0x65,0x22,0x3a,0x31,
//        0x36,0x34,0x30,0x31,
//        0x36,0x31,0x36,0x32,
//        0x36,0x35,0x39,0x38,
//        0x7d
//    };
//    NSData *adata = [[NSData alloc] initWithBytes:byte length:85];
    
#pragma mark 12、NSData 的 bytes
//    NSString *key = @"1234abcd";
//    NSData *data = [key dataUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%s %s",[key UTF8String],data.bytes);
//    //data.bytes:首地址
//    //(data.bytes+2):地址偏移2字节
//    //(char *):指针类型转换（因为data.bytes为地址所以(data.bytes+2)还是地址，地址就是指针，所以(char *)是转化为char类型的指针）
//    //*((char *)(data.bytes+2)):取char类型指针指向的值
//    char a = *((char *)(data.bytes+2));
//    NSLog(@"%c",a);
    
//    NSMutableData *data = [NSMutableData data];
//    uint32_t msgLength = CFSwapInt32HostToBig((uint32_t)23);//0x17000000
//    uint32_t msgLength1 = CFSwapInt32HostToLittle((uint32_t)23);//0x00000017
//    NSString *msgName = @"XMIMCore";
//    [data appendBytes:&msgLength length:sizeof(uint32_t)];//<00000017> //appendBytes 添加进去之后 反的
//    [data appendData:[msgName dataUsingEncoding:NSUTF8StringEncoding]];//appendData 添加进去之后 正的
//    NSLog(@"%@",data);
    
    
#pragma mark 11、nil Nil NULL NSNull
//    NullViewController *vc = [[NullViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
#pragma mark 10、rangeOfString
//    NSString *action = @"abc::345::99";
//    NSString *prefixString = nil;
//    NSRange range = [action rangeOfString:@"::"];
    
#pragma mark 9、typeof
    //typeof是一个一元运算，放在一个运算之前，运算数可以是任意类型。可以理解为：我们根据typeof()括号里面的变量，自动识别变量类型并返回该类型。
    // 注意 NSArray、NSString，[str class]、[NSString class]、[arr class]、[NSArray class] 不相等，自己创建的类相等 
//    NSString *str = @"abc";
//    typeof(str) str1 = @"ddd";
//    if ([str1 isKindOfClass:[NSString class]]) {
//        NSLog(@"=== ***:%@",str1);
//    } else {
//        NSLog(@"不是 typeof");
//    }
//
//    Person *pe = [[Person alloc] init];
//    if ([pe class] == [Person class]) {
//        NSLog(@"pe 对");
//    } else {
//        NSLog(@"pe 错");
//    }
//
//    NSArray *arr = [[NSArray alloc] init];
//    if ([arr class] == [NSArray class]) {
//        NSLog(@"对");
//    } else {
//        NSLog(@"错");
//    }
//
//
//    [arr class];
//    typeof(arr) arr1 = @[@1,@2];
//    if ([arr isMemberOfClass:[NSArray class]]) {
//        NSLog(@"=== ***:%@",arr1);
//    } else {
//        NSLog(@"不是 typeof");
//    }
    
    
#pragma mark 8、系统定义的宏 __FILE__ 、__FILE_NAME__
    /// __FILE__:/Users/xmly/Desktop/OCBase/OCBase/ViewController.m
    /// __FILE_NAME__:ViewController.m
//    NSLog(@"***%s",__FILE__);
//    NSLog(@"***%s",__FILENAME__);//喜马拉雅 定义的宏，和 __FILE_NAME__ 效果一样
//    NSLog(@"***%s",__FILE_NAME__);
//    NSLog(@"***%d",__LINE__);
//    NSLog(@"***%s",__func__);
//    NSLog(@"***%s",__FUNCTION__);
    
    
#pragma mark 7、PerformSelector:afterDelay: 在子线程中
    //PerformSelector:afterDelay:这个方法在子线程不起作用，子线程默认没有开启Runloop。
//    [NSThread detachNewThreadWithBlock:^{
//        //方式一
//        [self performSelector:@selector(p_logEvent1) withObject:nil afterDelay:2];//此方法是，在当前runloop中添加了一个timer，用于执行aSelector message
////        [NSTimer scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer * _Nonnull timer) {
////            NSLog(@"%@",[NSThread currentThread]);
////        }];
//        [[NSRunLoop currentRunLoop] run];
//    }];
//
//    //这个也是在子线程中实现延迟调用
//    dispatch_queue_t queue = dispatch_queue_create("com.xmly.ioQueue", DISPATCH_QUEUE_SERIAL);
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), queue, ^{
//        NSLog(@"currentThread:%@",[NSThread currentThread]);
//    });
    
    
#pragma mark 7、cancelPreviousPerformRequestsWithTarget 取消延迟执行的方法，只能取消延迟执行的方法
    // 那取消时的参数也要一致，否则不能取消成功
    // performSelector和cancel一定要在同一个线程中操作，否则是没办法取消成功的
//    NSLog(@"==== >>>>:%@",[NSThread currentThread]);
//    [self performSelector:@selector(p_logEvent:) withObject:nil afterDelay:0];
//    [self performSelector:@selector(p_logEvent:) withObject:@"test1" afterDelay:0];
//    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(p_logEvent:) object:@"test1"];
//    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
//    [self performSelector:@selector(p_logEvent:) withObject:nil afterDelay:0];
//    [self performSelector:@selector(p_logEvent1)];//无参数，如果传递了一个有参数的就会崩溃，例如（@selector(p_logEvent1:)）
//    [self performSelector:@selector(p_logEvent:) withObject:nil];
    
//    [self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#> withObject:<#(NSTimeInterval)#>]
    
#pragma mark 6、ntp 网络时间协议
//    netClock = [NetworkClock sharedNetworkClock];
    
//    netAssociation = [[NetAssociation alloc] initWithServerName:[NetAssociation ipAddrFromName:@"time.apple.com"]];
//    netAssociation.delegate = self;
//    [netAssociation sendTimeQuery];
    
//    NSLog(@"%@",[NSString stringWithFormat:@"Clock Offet: %5.3f mSec", netClock.networkOffset * 1000.0]);
//    NSLog(@"%@",netClock.networkTime);
    
    
#pragma mark 5、XXX

    
#pragma mark 4、NSString -> cStr，cStr 长度计算
//    NSString *str = @"abcd 你好！";
////    const char *cString = [str UTF8String];// 方法1
//    const char *cString = [str cStringUsingEncoding:NSUTF8StringEncoding];// 方法2
//    int strlength = (int)[str lengthOfBytesUsingEncoding:NSUTF8StringEncoding];//计算cString的长度，编码NSUTF8StringEncoding 注意：需要对应上哦
//    printf("===%s+++%d===",cString,strlength);

//    // cStr -> NSString
//    NSString *string = [[NSString alloc] initWithUTF8String:cString];
////    NSString *string = [[NSString alloc] initWithCString:cString encoding:NSUTF8StringEncoding];
//    NSLog(@"+++%@===",string);
    
#pragma mark 3、64.4 -> 64.40000000000001
//    NSDictionary *dic = @{@"progress":@64.4};
    // 方式一 错误
//    self.labelTitle.text = [dic[@"progress"] stringValue];
    // 方式二 错误
//    self.labelTitle.text = [NSString stringWithFormat:@"%@", dic[@"progress"]];
    // 方式三 正确
//    double d = [dic[@"progress"] doubleValue];
//    NSString *dStr = [NSString stringWithFormat:@"%f", d];
//    NSDecimalNumber *dn = [NSDecimalNumber decimalNumberWithString:dStr];
//    self.labelTitle.text = [dn stringValue];
    // 方式四 错误
//    double d = [dic[@"progress"] doubleValue];
//    self.labelTitle.text = [NSString stringWithFormat:@"%f", d];
    
    
#pragma mark 2、sentinel
//    atomic_int sentinel = self.sentinel;
//    BOOL (^isCancelled)(void) = ^BOOL() {
//        NSLog(@"=== *** %d - %d",sentinel,self.sentinel);
//        return YES;
//    };
//    sentinel = 11;
//    self.sentinel = 12;
//    isCancelled();
    
//    [self cancelQueue];
//    NSLog(@"=== ***%d",self.sentinel);
    
    
#pragma mark 1、dispatch_queue_set_specific
//    [self.ioQueue runAsync:^{
//        for (int i=0; i<100; i++) {
//            NSLog(@"one === *** %d",i);
//            if (i == 55) {
//                [self.ioQueue runAsync:^{
//                    for (int j=0; j<100; j++) {
//                        NSLog(@"two === *** %d",j);
//                        if (j == 55) {
//
//                        }
//                    }
//                }];
//            }
//        }
//    }];
    
//    [self.ioQueue runSync:^{
//        for (int i=0; i<100; i++) {
//            NSLog(@"one === *** %d",i);
//            if (i == 55) {
//                [self.ioQueue runSync:^{
//                    for (int j=0; j<100; j++) {
//                        NSLog(@"two === *** %d",j);
//                        if (j == 55) {
//
//                        }
//                    }
//                }];
//            }
//        }
//    }];
    
//    for (int i=0; i<100; i++) {
//        NSLog(@"主1 === *** %d",i);
//    }
//    [self.ioQueue runSync:^{
//        for (int i=0; i<100; i++) {
//            NSLog(@"two === *** %d",i);
//        }
//    }];
//    for (int i=0; i<100; i++) {
//        if (i == 50) {
//            [NSThread sleepForTimeInterval:3];
//        }
//        NSLog(@"主2 === *** %d",i);
//    }
//    [self.ioQueue runAsync:^{
//        for (int i=0; i<100; i++) {
//            NSLog(@"three === *** %d",i);
//        }
//    }];
    
    
//    NSLog(@"1");
//    [self.ioQueue runSync:^{
//        NSLog(@"2");
//        [self.ioQueue runSync:^{
//            NSLog(@"3");
//        }];
//        NSLog(@"4");
//    }];
    
    // 串行 一个一个 执行完成
//    NSLog(@"1");
//    [self.ioQueue runSync:^{
//        NSLog(@"111111");
//        sleep(3);
//        NSLog(@"111111");
//    }];
//    NSLog(@"2");
//    [self.ioQueue runSync:^{
//        NSLog(@"3");
//    }];
//    NSLog(@"4");
    
//    NSLog(@"1");
//
//    for (int i = 0; i<100; i++) {
//        [self.ioQueue runAsync:^{
//            NSLog(@"==== ++++:%d",i);
//            NSLog(@"==== ++++:%d",i);
//            NSLog(@"==== ++++:%d",i);
//            NSLog(@"==== ++++:%d",i);
//            NSLog(@"==== ++++:%d",i);
//        }];
//    }
//    NSLog(@"2");
    

    // 并行
    
    
    
    
    
//    static void *queueKey1 = "queueKey1";
//
//    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_set_specific(queue, queueKey1, &queueKey1, NULL);
//    NSLog(@"1");
//    // 异步函数
//    dispatch_async(queue,^{
//        NSLog(@"2");
//
//        // 同步
//        dispatch_sync(queue, ^{
//            NSLog(@"3");
//        });
//
//        for (int i=0; i<100; i++) {
//            NSLog(@"4");
//        }
//    });

    
    NSLog(@"结束啦");
}

- (void)testReturn {
    NSLog(@"%s",__FUNCTION__);
    int a = 30;
    if (a == 30) {
        return;
    }
    NSLog(@"%s",__func__);
}

- (void)cancelQueue {
    atomic_fetch_add(&_sentinel, 1);
}

- (void)p_logEvent1 {
    NSLog(@"p_logEvent1");
}

- (void)p_logEvent:(NSString *)str {
    NSLog(@"p_logEvent:%@",str);
}

#pragma mark NetAssociationDelegate

//- (void)reportFromDelegate {
//    self.labelTitle.text = [NSString stringWithFormat:@"System ahead by: %5.3f mSec",
//                       netAssociation.offset * 1000.0];
//}


@end
