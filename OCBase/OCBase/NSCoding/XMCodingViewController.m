//
//  XMCodingViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/17.
//

#import "XMCodingViewController.h"
#import <Masonry/Masonry.h>

#import "XMCodeingObj.h"

static NSString *fileName = @"Array_XMCodeingObj.data";

@interface XMCodingViewController ()

@end

@implementation XMCodingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"序列化";
    
    UIButton *btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.backgroundColor = [UIColor redColor];
    [btnSave setTitle:@"存" forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
    [btnSave mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *btnChange = [UIButton buttonWithType:UIButtonTypeCustom];
    btnChange.backgroundColor = [UIColor cyanColor];
    [btnChange setTitle:@"变" forState:UIControlStateNormal];
    [btnChange addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChange];
    [btnChange mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnSave.mas_right).offset(10);
        make.top.equalTo(btnSave);
        make.size.equalTo(btnSave);
    }];
    
    UIButton *btnGet = [UIButton buttonWithType:UIButtonTypeCustom];
    btnGet.backgroundColor = [UIColor orangeColor];
    [btnGet setTitle:@"取" forState:UIControlStateNormal];
    [btnGet addTarget:self action:@selector(getOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGet];
    [btnGet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnChange.mas_right).offset(10);
        make.top.equalTo(btnSave);
        make.size.equalTo(btnSave);
        make.right.offset(-10);
    }];
    
    
}

- (void)save:(UIButton *)sender {
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:10];
    
    XMCodeingObj *obj = [[XMCodeingObj alloc] init];
    obj.name = @"小明";
//    obj.sex = YES;
    obj.age = 12;
    obj.isHave = YES;
    
    XMCodeingObj *obj1 = [[XMCodeingObj alloc] init];
    obj1.name = @"小红";
    
    [array addObject:obj];
    [array addObject:obj1];
    
    [NSKeyedArchiver archiveRootObject:array toFile:path];
}

- (void)change:(UIButton *)sender {
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
    
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    XMCodeingObj *obj = array[0];
    obj.name = @"你好，世界";
    
    [NSKeyedArchiver archiveRootObject:array toFile:path]; //必须要再次存储一下
}

- (void)getOut:(UIButton *)sender {
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
    
    NSMutableArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if (array == nil) {
        NSLog(@"===>>>:nil");
    } else {
        NSLog(@"===>>>:array");
    }
    
    NSLog(@"===>>>:%ld",array.count);
    
    XMCodeingObj *obj = array[0];
    XMCodeingObj *obj1 = array[1];
    
    NSLog(@"===>>>:%@",obj);
    NSLog(@"===>>>:%@",obj1);

    if (!obj.name) {
        NSLog(@"===>>>:没有 name");
    } else {
        NSLog(@"===>>>:name : %@",obj.name);
    }
    if (!obj.age) {
        NSLog(@"===>>>:没有 age");
    } else {
        NSLog(@"===>>>:age : %ld",obj.age);
    }
//    if (!obj.sex) {
//        NSLog(@"===>>>:没有 year");
//    } else {
//        NSLog(@"===>>>:sex : %d",obj.sex);
//    }
    if (!obj.year) {
        NSLog(@"===>>>:没有 year");
    } else {
        NSLog(@"===>>>:year : %@",obj.year);
    }
    if (!obj.isHave) {
        NSLog(@"===>>>:没有 isHave");
    } else {
        NSLog(@"===>>>:isHave : %hhu",obj.isHave);
    }
    if (!obj.weight) {
        NSLog(@"===>>>:没有 weight");
    } else {
        NSLog(@"===>>>:weight : %@",obj.weight);
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
