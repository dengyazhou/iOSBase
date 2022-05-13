//
//  NullViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/4.
//

#import "NullViewController.h"
#import "NullObject.h"

@interface NullViewController ()

@end

@implementation NullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"nil Nil NULL NSNull";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#pragma mark 6、nil 发送 消息，不会有任何作用
    NullObject *obj = [NullObject nullObj];
    [obj OCBase];
    
    
    
#pragma mark 1、dic  [NSNull null] ===>>> "<null>"
    //oc中数组、字典等对象中插入nil会crash，但是我们可以插入值为空的对象[NSNull null].
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
//    dic[@"deviceid"] = [NSNull null];
//    dic[@"appid"] = nil;
//    dic[@"item"] = @"";
//    dic[@"name"] = @"dengyazhou";
//
//    NSLog(@"dic:%@",dic);
    
#pragma mark 2、@(1) 是 NSNumber
//    NSDictionary * param = @{@"code":@(1),@"des":@"abcd"};
////    NSDictionary * param = @{@"code":@"1",@"des":@"abcd"};
//    NSLog(@"dic:%@",@{@"data":param});
    
#pragma mark 3、nil、Nil、NULL、NSNull
    //nil 是一个"空对象", 已经完全从内存中消失了
    //Nil 定义一个空的类, 在iOS中，Nil完全等同于nil
    //NULL C语言或C++中的一个空指针
    //[NSNull null] 是值为"空的对象"
    /**
     “空对象”是已经释放了内存地址的对象，即不存在的对象。
     “值为空的对象”是分配了地址，但是没有值得对象，是实际存在的对象。
     */
//    if (nil == Nil) {
//        NSLog(@"nil == Nil");
//    }
//    if (nil == NULL) {
//        NSLog(@"nil == NULL");
//    }
//    if (nil == [NSNull null]) {
//        NSLog(@"nil == [NSNull null]");
//    } else {
//        NSLog(@"nil != [NSNull null]");
//    }
    
    
#pragma mark 4、
//    NSDictionary *dic = @{@"key1":@"value1",@"key2":@"value2"};
//    id obj = dic[@"key3"];
//    if (obj == nil) {//字典没有这个键，值则为nil
//        NSLog(@"obj == nil");//对
//    } else {
//        NSLog(@"obj != nil");
//    }
    
#pragma mark 5、[NSNull null] 是一个空对象，接口返回返回了这个键但是值为空对象。nil值不存在，接口返回没有返回这个键
//    if (dic[@"tpfUser"] != [NSNull null] && dic[@"tpfUser"] != nil) {
//        NSData *jsonTpfUser = [NSJSONSerialization dataWithJSONObject:dic[@"tpfUser"] options:NSJSONWritingPrettyPrinted error:nil];
//        obj.tpfUser = [[NSString alloc] initWithData:jsonTpfUser encoding:NSUTF8StringEncoding];
//    } else {
//        obj.tpfUser = nil;
//    }
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
