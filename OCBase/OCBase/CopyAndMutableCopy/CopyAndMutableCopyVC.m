//
//  CopyAndMutableCopyVC.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/27.
//

#import "CopyAndMutableCopyVC.h"

@interface CopyAndMutableCopyVC ()

@end

@implementation CopyAndMutableCopyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"深浅拷贝";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#pragma mark 3、p 打印
    //p str 会打印对象本身的内存地址和对象内容
    //p &str 则打印的是引用对象的指针所在的地址
//    NSString *str = @"string";
//    str = @"newString";
    /**
     (lldb) p str
     (__NSCFConstantString *) $0 = 0x000000010a531368 @"string"
     (lldb) p &str
     (NSString **) $1 = 0x00007ff7b59e3678
     (lldb) p str
     (__NSCFConstantString *) $2 = 0x000000010a531388 @"newString"
     (lldb) p &str
     (NSString **) $3 = 0x00007ff7b59e3678
     */
    
#pragma mark 2、对非集合类对象的copy操作
    //2.1 对不可变对象copy, 浅复制指针赋值，因为原对象就是不可变，你copy一份的目的也是防止原对象在外界被修改了而印象自己，现在原对象没法变，你这个也肯定变不了，为了节约内存所以完全不用在copy一份出来，所以为浅复制。
//    NSString *string = @"origin";
//    NSString *stringCopy = [string copy];
    
    //2.2 对可变对象copy,是深复制,即是内容拷贝，因为原对象是可以变，所以为了防止被修改，所以复制了一份。
//    NSMutableString *string = [NSMutableString stringWithString:@"origin"];
//    NSString *stringCopy = [string copy];
    
    //2.3 对可变对象copy,是深复制,即是内容拷贝
    //2.4 对可变对象mutableCopy,是深复制,即是内容拷贝
    
    //2.3 copy 和 mutableCopy功能差不多都是复制，不同的地方在于生成的是可变对象还是不可变对象
//    NSMutableString *stringMCopy = [string mutableCopy];
//    [string appendFormat:@"123"];
    
    
#pragma mark 1、地址有两种情况
    //1、指针指向的对象的内存地址，也就是这个指针保存的内容
    //2、指针自己的内存地址
//    NSString * a = @"OK";
//    //打印对象的内存地址
//    NSLog(@"内存地址1：%p",a);
//    //打印指针自己的内存地址
//    NSLog(@"内存地址2：%p",&a);
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
