//
//  BlockViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/28.
//

#import "BlockViewController.h"
#import "BlockObj.h"

int globalA = 20;

@interface BlockViewController () {
    BlockObj *blockObj;
}

//atomic 修饰 在set get 方法的时候都会锁
//copy 修饰 在set 方法的时候，会在_name = [参数 copy];
@property (nonatomic, copy) NSString *name;

@property (nonatomic,copy) void(^block)(void);
@property (nonatomic,copy) void(^block1)(BlockViewController *);//如果是一个block，不管属性修饰符是copy还是strong，都会在被赋值的时候runtime自动copy到堆上。

@property (nonatomic) id blockId;
//@property (nonatomic) BlockObj *blockObj;

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"block";
    self.view.backgroundColor = [UIColor whiteColor];
    self.name = @"yazhou.deng";
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"block 开始");
    
    

    
//    int a = 10;
//    NSLog(@"block:%@",^{a;});//<__NSMallocBlock__: 0x600000e80930>
//    NSLog(@"block:%@",[^{a;} class]);//__NSStackBlock__

//    NSLog(@"block:%@",^{});//<__NSGlobalBlock__: 0x100273528>
//    NSLog(@"block:%@",[^{} class]);//__NSGlobalBlock__

//    void(^block)(void) = ^{
//        a;
//    };
//    NSLog(@"block:%@",block);//<__NSMallocBlock__: 0x60000378aa90>
//    NSLog(@"block:%@",[block class]);//__NSMallocBlock__

//    int a = 10;
//    self->blockObj = (BlockObj *)^{
//        a;
//    };
//    NSLog(@"%@",self->blockObj);//<__NSMallocBlock__: 0x60000364e490>
    
    
#pragma mark block 修改全局变量的值
//    int a = 10;
//    __block NSString *str = @"abc";
//    void(^block)(void) = ^(){
////        a = 11;
//        globalA = 20;
//        str = @"def";
//        NSLog(@"globalA:%d",globalA);
//        NSLog(@"str:%@",str);
//    };
//    block();
    
#pragma mark block 底层原理
    //block底层是一个对象，它有一个属性FuncPtr，这个属性FuncPtr是一个函数指针，指向block保存的代码块，当需要执行保存的代码块时，用block这个对象调用这个函数即可。
    
#pragma mark 解决Block循环引用
#pragma mark 3、self.block1 = ^(BlockViewController *vc) {} //执行完毕释放
    //传值 -- 传参数的方式
    //性能最高，但是变量的值和传参的形式更加麻烦
//    self.block1 = ^(BlockViewController *vc) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@",vc.name);
//        });
//    };
//    self.block1(self);

#pragma mark 2、__block BlockViewController *blockSelf = self; 和 blockSelf = nil; //执行完毕释放
    //必须要调用，否则没法置为nil，就法发释放
//    __block BlockViewController *blockSelf = self;//产生一个新的blockSelf的结构体
//    //self ---> block ---> blockSelf(使用完置为nil) ---> self
//    self.block = ^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@",blockSelf.name);
//            blockSelf = nil;//置为nil
//        });
//    };
//    self.block();//必须要调用，否则没法置为nil，就法发释放

#pragma mark 1、__weak typeof(self) weakSelf = self; 和 __strong typeof(weakSelf) strongSelf = weakSelf; //如果加了__strong,执行完毕释放;不加,立刻释放。
    //typeof 直接查看 typeof使用
    //使用最多，更加直接
//    __weak typeof(self) weakSelf = self;
//    // self ---> block ---> weakSelf ---> strongSelf(临时变量出了作用域区间就没了)
//    self.block = ^{
//        __strong typeof(weakSelf) strongSelf = weakSelf;//__strong 让 weakSelf引用计数加一，strongSelf是临时变量，出了作用域区间就没了
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@",strongSelf.name);
//        });
//    };
//    self.block();
    
//    __weak BlockViewController *weakSelf = self;
//    self.block = ^{
//        __strong BlockViewController *strongSelf = weakSelf;
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"%@",strongSelf.name);
//        });
//    };
//    self.block();
    
#pragma mark Block三种类型
#pragma mark 1、NSGlobalBlock 全局 静态
//    void(^block)(void) = ^{
//
//    };
//    block();
//    NSLog(@"block = %@",block);//全局 静态 : __NSGlobalBlock__
    
#pragma mark 重点:一个block，如果捕获了变量，它会变成栈block。如果这个栈block没有赋值给一个变量，它就一直是一个栈block，只有当赋值给一个变量的时候，runtime才会把block拷贝到堆上，变成堆block。
    //如果没有被变量接收，那么这个block也不会存在出了作用域之后，再被调用的情况，所以这个block里面捕获的外界值，也不会存在被调用的情况，所以也没有必要拷贝到堆上 变成堆block。
    //为什么需要拷贝到堆上呢，因为block捕获的值是在栈上的，出了作用域就自动释放了，所以block里面就没法在访问了，为了让block里面能继续访问，所以block捕获之后会拷贝在堆上。
#pragma mark 2、NSStackBlock 栈block
    //MRC:一经捕获就变成了 栈block
    //ARC:一经捕获就变成了 栈block，之后被赋值给一个变量后，然后才会自动拷贝到堆上成为 堆block。
    
    //MRC
////    __block a = 10;
//    int a = 10;
//    void(^block)(void) = ^{
//        a;
//        NSLog(@"hello block");
//    };
//    block();
//    NSLog(@"block = %@",block);//__NSStackBlock__ 栈block
//
//    NSLog(@"block = %@",^{
//        a;
//        NSLog(@"hello block");
//    });// __NSStackBlock__
    
    //ARC
////    __block a = 10;
//    int a = 10;
//    void(^block)(void) = ^{
//        a;
//        NSLog(@"hello block");
//    };
//    block();
//    NSLog(@"block = %@",block);//__NSMallocBlock__ 堆block
//
//    NSLog(@"block = %@",^{
//        a;
//    s    NSLog(@"hello block");
//    });// __NSStackBlock__
    
    //ARC  升级了
//    __block a = 10;
//    int a = 10;
//    void(^block)(void) = ^{
//        a;
//    };
//    block();
//    NSLog(@"block = %@",block);//__NSMallocBlock__ 堆block
//
//    NSLog(@"block = %@",^{a;});// __NSMallocBlock__ //其实这里还是一个栈block,请看下面class打印。但是这里为什么打印栈block呢，可能是description方法做了特殊处理
//    NSLog(@"block = %@",[^{a;} class]);//__NSStackBlock__

#pragma mark  __weak
//    int a = 10;
//    void(__weak ^block)(void) = ^{
//        a;
//        NSLog(@"hello block");
//    };
//    block();
//    NSLog(@"block = %@",block);//__NSStackBlock__
//    NSLog(@"block = %@",[block class]);
    
#pragma mark 默认使用 __strong
//    int a = 10;
//    void(__strong ^block)(void) = ^{
//        a;
//        NSLog(@"hello block");
//    };
//    block();
//    NSLog(@"block = %@",block);//__NSMallocBlock__
    
#pragma mark 3.NSMallocBlock 堆block
    //ARC
//    int a = 10;
//    void(^block1)(void) = ^{
//        NSLog(@"hello block - %d",a);
//    };
//    block1();
//    NSLog(@"block = %@",block1);//__NSMallocBlock__ 堆block

    
#pragma mark 2、有__block 是什么底层原理 指针传递 read write
    //总结：当在block内修改一个值类型变量的时候，需要加上“__block”，在block内修改一个引用类型变量的时候分情况讨论，如果需要将这个变量完全指向另一个内存对象，加上“__block”，如果只是单纯的修改指针所指向的对象则不需要使用“__block”。
//    __block int a = 10;
//    __block NSString *str = @"123";
//    __block NSMutableString *mStr = [NSMutableString stringWithFormat:@"block"];
//    void(^block)(void) = ^{
//        a++;
//        NSLog(@"a---%d",a);
//        mStr = [NSMutableString stringWithFormat:@"block123"];
//        NSLog(@"mStr---%@",mStr);
//        str = @"1234";
//        NSLog(@"str---%@",str);
//    };
//    block();
    
#pragma mark 1、没有__block 是什么底层原理 值传递 only read
//    int a = 10;
//    NSString *str = @"123";
//    NSMutableString *mStr = [NSMutableString stringWithFormat:@"block"];
//    void(^block)(void) = ^{
//        NSLog(@"a---%d",a);
//        [mStr appendString:@"123"];
//        NSLog(@"mStr---%@",mStr);
//        NSLog(@"str---%@",str);
//    };
//    block();
    
    NSLog(@"block 结束");
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
