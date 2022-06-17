//
//  PragmaClangVC.m
//  OCBase
//
//  Created by xmly on 2022/6/14.
//

#import "PragmaClangVC.h"

@interface PragmaClangVC ()

@end

@implementation PragmaClangVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"#pragma clang diagnostic";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // [https://www.jianshu.com/p/4720fc9e991a]
    //1.在iOS开发当中我们经常会用到一些废弃的系统方法，或者声明一些没有用到的变量，此时编译器就回报黄色的⚠️警告，在这时我们就会用到#pragma进行处理，#pragma 声明主要由 Xcode 用来完成两个主要任务：整理代码和防止编译器警告。

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-相关命令"
    // 需要处理的警告代码
#pragma clang diagnostic pop
    
//    iOS常用的忽略警告类型
//    1.未使用的变量
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    NSString *string;
#pragma clang diagnostic pop
    
//    2.弃用的方法
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // 过期的方法
#pragma clang diagnostic pop
    
//    3.未声明的选择器，使用performSelector到运行时才绑定方法
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
// if (self.delegate && [self.delegate respondsToSelector:@selector(textViewTextDidLimited:)]) {
//        [self.delegate performSelector:@selector(textViewTextDidLimited:) withObject:self];
//    }
#pragma clang diagnostic pop
    
//    -Warc-performSelector-leaks
    
    
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
