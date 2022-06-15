//
//  REViewController.m
//  OCBase
//
//  Created by xmly on 2022/6/15.
//

#import "REViewController.h"

@interface REViewController ()

@end

@implementation REViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NSRegularExpression 正则";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchBegan 开始");
    
    // [https://github.com/pro648/tips/wiki/iOS%E6%AD%A3%E5%88%99%E8%A1%A8%E8%BE%BE%E5%BC%8F%E8%AF%AD%E6%B3%95%E5%85%A8%E9%9B%86]
    
    NSString *p1 = @"L[A-C]";//匹配 LA LB LC
    NSString *s1 = @"w29LBjswLCnkow";
    
    [self validateString:s1 withPattern:p1];
    
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
        
    NSLog(@"touchBegan 结束");
}

- (void)validateString:(NSString *)string withPattern:(NSString *)pattern {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSRange textRange = NSMakeRange(0, string.length);
    
#pragma mark 1.返回第一个正确匹配结果字符串的NSRange
//    NSRange matchRange = [regex rangeOfFirstMatchInString:string options:NSMatchingReportProgress range:textRange];
//    NSLog(@"%@",NSStringFromRange(matchRange));
    
#pragma mark 2.返回第一个匹配的结果，结果保存在
//    NSTextCheckingResult *textCheck = [regex firstMatchInString:string options:NSMatchingReportProgress range:textRange];
//    NSLog(@"%@",NSStringFromRange(textCheck.range));
    
#pragma mark 3.返回匹配个数
//    NSUInteger number = [regex numberOfMatchesInString:string options:NSMatchingReportProgress range:textRange];
//    NSLog(@"%lu",(unsigned long)number);
    
#pragma mark 4.返回所有匹配的结果
//    NSArray <NSTextCheckingResult *> *results = [regex matchesInString:string options:NSMatchingReportProgress range:textRange];
//    for (NSTextCheckingResult *ret in results) {
//        NSLog(@"%@",NSStringFromRange(ret.range));
//    }
    
#pragma mark 5.block方式遍历出合适的结果
//    [regex enumerateMatchesInString:string options:NSMatchingReportProgress range:textRange usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
//        if (result) {
//            NSLog(@"%@",NSStringFromRange(result.range));
//        }
//    }];
    
#pragma mark 6.替换匹配的值
//    NSString *newString = [regex stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:textRange withTemplate:@"Replace-100"];
//    NSLog(@"%@",newString);
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
