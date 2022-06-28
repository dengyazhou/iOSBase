//
//  NSSetViewController.m
//  OCBase
//
//  Created by yazhoudeng on 2022/6/28.
//

#import "NSSetViewController.h"

@interface NSSetViewController ()

@end

@implementation NSSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NSSet";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[https://blog.csdn.net/potato512/article/details/51482893]
    NSSet *set001 = [[NSSet alloc] initWithObjects:@"1",@"2",@"3",@"4",@"2", nil];
    NSLog(@"===>>>:%@",set001);
    
    NSInteger count = set001.count;
    NSLog(@"===>>>count:%ld",count);
    
    //set 转 array
    NSArray *array = set001.allObjects;
    NSLog(@"===>>>array:%@",array);
    
    //array 转 set
    NSSet *set002 = [NSSet setWithArray:@[@"1",@"3",@"4"]];
    NSLog(@"%@",set002);
    
    //获取任意一对象
    NSString *string = set002.anyObject;
    NSLog(@"%@",string);
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
