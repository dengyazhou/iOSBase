//
//  InnerManageViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/15.
//

#import "InnerManageViewController.h"
#import "InnerSongObject.h"
#import <objc/runtime.h>
#import "InnerPersonObject.h"
#import "InnerSonObject.h"

extern _objc_autoreleasePoolPrint();

@interface InnerManageViewController ()

@property (nonatomic, strong) InnerSongObject *innerObj;

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation InnerManageViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"内存管理";
    
#pragma mark 验证autoreleasing对象的释放 部分一
    __autoreleasing InnerPersonObject *personObject = [[InnerPersonObject alloc] init];
    NSLog(@"%s",__func__);

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
#pragma mark 验证autoreleasing对象的释放 部分二
    NSLog(@"%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
#pragma mark 验证autoreleasing对象的释放 部分三
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"内存管理开始");
    
//    NSString *str = @"123";
//    NSLog(@"%@",str);
    
    
#pragma mark dealloc 当前类，父类调用顺序
    //先调用子类，然后父类，最后NSObject的子类
    {
        InnerSonObject *obj = [[InnerSonObject alloc] init];
    }
    
    
#pragma mark for 循环，使用 @autoreleasepool {}
    //不使用 @autoreleasepool{},如果是autorelease对象，他们会进入自动释放池，然后会在runloop将要休眠的时候释放，由于现在for循环一直再走，所以runloop不会休眠，这个大量的autorelease临时对象不会释放。
//    __weak id tem;
//    for (NSInteger i = 0; i < 10000000000; i++) {
//        InnerPersonObject *obj = [InnerPersonObject object];
//        _objc_autoreleasePoolPrint();
//        NSLog(@"==========end========%ld",i);
//    }
    
    //使用 @autoreleasepool{}, 会让autorelease对象在for循环中就释放掉
//    __weak id tem;
//    for (NSInteger i = 0; i < 10000000000; i++) {
//        @autoreleasepool {
//            InnerPersonObject *obj = [InnerPersonObject object];
////            _objc_autoreleasePoolPrint();
//        }
////        _objc_autoreleasePoolPrint();
////        NSLog(@"==========end========%ld",i);
//    }

    
#pragma mark for 循环，循环一次释放一次
//    for (NSInteger i = 0; i < 100; i++) {
//        NSLog(@"for 开始 %ld",i);
//        InnerPersonObject *obj = [[InnerPersonObject alloc] init];
//        NSLog(@"for 结束 %ld",i);
//    }
    
#pragma mark 实例四、{} 作用域
//    __weak id tmp = nil;
//    InnerPersonObject *obj = [InnerPersonObject object];
//    tmp = obj;
//    NSLog(@"tmp == %@",tmp);
    /**
     2022-04-28 16:20:34.363216+0800 OCBase[34938:8963424] tmp == <InnerPersonObject: 0x600002e044a0>
     2022-04-28 16:20:34.363491+0800 OCBase[34938:8963424] -[InnerPersonObject dealloc]
     */
    
//    __weak id tmp = nil;
//    InnerPersonObject *obj = [[InnerPersonObject alloc] init];
//    tmp = obj;
//    NSLog(@"tmp == %@",tmp);
    /**
     2022-04-28 16:21:24.226551+0800 OCBase[34977:8964540] tmp == <InnerPersonObject: 0x600001838360>
     2022-04-28 16:21:24.226875+0800 OCBase[34977:8964540] -[InnerPersonObject dealloc]
     */
    
#pragma mark 实例三、为了让autorelease对象提前释放。让实例二提前释放
//    __weak id tmp = nil;
//    @autoreleasepool {
//        InnerPersonObject *obj = [InnerPersonObject object];
//        tmp = obj;
//    }
//    NSLog(@"tmp == %@",tmp);
    /**
     2022-04-28 16:33:34.718610+0800 OCBase[35468:8974797] -[InnerPersonObject dealloc]
     2022-04-28 16:33:34.718766+0800 OCBase[35468:8974797] tmp == (null)
     */
    
#pragma mark 实例二、发送autorelease方法，注册到自动释放池当中；autorelease对象，会在自动释放池销毁的时候释放。这个加到了自动释放池中，_objc_autoreleasePoolPrint可以打印
//    _objc_autoreleasePoolPrint();
//    __weak id tmp = nil;
//    {
//        InnerPersonObject *obj = [InnerPersonObject object];
//        tmp = obj;
//    }
//    NSLog(@"tmp == %@",tmp);
//    _objc_autoreleasePoolPrint();
    /**
     2022-04-28 16:16:48.599322+0800 OCBase[34772:8958891] tmp == <InnerPersonObject: 0x600003e729f0>
     2022-04-28 16:16:48.599669+0800 OCBase[34772:8958891] -[InnerPersonObject dealloc]
     */
    
#pragma mark 实例一、不会发送autorelease方法，不会注册到自动释放池当中；alloc/init/new/copy/mutableCopy开头的方法返回的对象不是autorelease对象，所以会在出了作用域就直接释放了
//    _objc_autoreleasePoolPrint();
//    __weak id tmp = nil;
//    {
//        InnerPersonObject *obj = [[InnerPersonObject alloc] init];
//        tmp = obj;
//    }
//    NSLog(@"tmp == %@",tmp);
//    _objc_autoreleasePoolPrint();
    /**
     2022-04-28 16:15:42.604804+0800 OCBase[34663:8956365] -[InnerPersonObject dealloc]
     2022-04-28 16:15:42.604926+0800 OCBase[34663:8956365] tmp == (null)
     */
    
    
#pragma mark 7、这个为啥不在里面呢。(所有autorelease的对象，在出了作用域之后，会被自动添加到最近创建的自动自动释放池中)这个理解是错误的
    //每使用一次__weak对象，运行时系统都会将其指向的原始对象先retain，之后保存到自动释放池中（ AutoReleasePoolPage的add() 函数）。因此如果大量调用__weak对象，则会重复进行此工作。不仅耗费无意义的性能（重复存储同一对象），还会使内存在短时间内大量增长。
    
//    _objc_autoreleasePoolPrint();
//    __weak id tem = nil;//这一句必须在"InnerPersonObject *obj = [InnerPersonObject object];"之前调用，（这个函数返回自动调用autorelease成为autorelease的）对象，才会被加到自动释放池中
//    InnerPersonObject *obj = [InnerPersonObject object];
////    InnerPersonObject *obj = [InnerPersonObject allocObject];//不会加入到自动释放池
//    NSLog(@"=========obj");
//
//    _objc_autoreleasePoolPrint();
    
    
#pragma mark 6、_objc_autoreleasePoolPrint 子线程 子线程的RunLoop
    //见RunLoopViewController
    
#pragma mark 5、_objc_autoreleasePoolPrint 主线程 主线程的RunLoop
    //@autoreleasepool { } //会把哨兵压栈
    //__autoreleasing NSObject *obj = [[NSObject alloc] init]; //会把obj压栈
    
//    _objc_autoreleasePoolPrint();
//    NSLog(@"===============================================分割线================");
//    __autoreleasing NSObject *obj = [[NSObject alloc] init];
//
////    __autoreleasing InnerSongObject *obj1 = [[InnerSongObject alloc] init];
//    _objc_autoreleasePoolPrint();
//    NSLog(@"===============================================分割线===============obj=");
//    @autoreleasepool {
//        _objc_autoreleasePoolPrint();
//        NSLog(@"===============================================分割线===============auto=");
//        __weak id objweak = nil;
////        InnerPersonObject *obj1 = [[InnerPersonObject alloc] init];
//        InnerPersonObject *obj2 = [InnerPersonObject object];
//        _objc_autoreleasePoolPrint();
//        NSLog(@"===============================================分割线===============obj1=");
//    }
//    _objc_autoreleasePoolPrint();
//
    
//    @autoreleasepool {
//        for (NSInteger i = 0; i<100; i++) {
//            InnerSongObject *obj = [[InnerSongObject alloc] init];
//        }
//        NSLog(@"最后一个");
//    }
    
#pragma mark 4、strong修饰的属性，如果指向了对象([[InnerSongObject alloc] init])。在InnerManageViewController这个VC释放的时候调用InnerManageViewController的dealloc，在InnerManageViewController的dealloc中会调用object_cxxDestruct，这个会释放innerObj。
//    self.innerObj = [[InnerSongObject alloc] init];
    
#pragma mark 3、weak
//    __weak UIView *view;
//    {
//        view = [[UIView alloc] init];
//        NSLog(@"view:%@ address:%p",view,view);
//    }
//    NSLog(@"view:%@ address:%p",view,view);
    

#pragma mark 3、weak imageView
//    在RAC下，不能使用weak修饰的属性直接接收创建的对象，及_imageView = [[UIImageView alloc] init];，会报如下警告：Assigning retained object to weak variable; object will be released after assignment 并且值一直为nil。
//    需要使用中间变量接收一下，中间变量在出了作用区之后会被释放，但是由于[self.view addSubview:imageView]引用计数又增加了1，所以就算出了作用域，weak修饰的属性也不会跟着释放了。
    
    //错误
//    _imageView = [[UIImageView alloc] init];
//    NSLog(@"%@",_imageView);//之前这里直接打印nil，现在可以打印（应该是编译器优化了吧）
//    [self.view addSubview:_imageView];
    
    //错误
//    self.imageView = [[UIImageView alloc] init];
    
    //需要中间变量接收
    //如果把下面的写在ViewDidLoad中，然后再touchesBegan中打印 //这里面（touchesBegan中）打个断点看一下_imageView有没有值。不加[self.view addSubview:imageView];就没有值，加了就有值。
//    UIImageView *imageView = [[UIImageView alloc] init];
//    [self.view addSubview:imageView];
//    _imageView = imageView;
    
#pragma mark 2、__autoreleasing 修饰的对象，会被加到自动释放池中
//    _objc_autoreleasePoolPrint();
//    __autoreleasing InnerSongObject *obj = [[InnerSongObject alloc] init];
//    _objc_autoreleasePoolPrint();
    
#pragma mark 1、局部变量 释放 出了大括号释放
//    InnerSongObject *obj = [[InnerSongObject alloc] init];
//    InnerSongObject *obj1 = [[InnerSongObject alloc] init];
    
    
    NSLog(@"内存管理结束");
}

- (void)dealloc {
    NSLog(@"%s",__func__);
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
