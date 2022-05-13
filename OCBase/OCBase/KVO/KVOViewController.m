//
//  KVOViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/28.
//

#import "KVOViewController.h"
#import "KVOPerson.h"
#import "KVOStudent.h"
#import "KVOSumObject.h"

struct ThreeFloats {
    float x;
    float y;
    float z;
};

@interface KVOViewController ()

@property (nonatomic, strong) KVOPerson *person;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"KVO";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    KVOPerson *person = [[KVOPerson alloc] init];
    person.dataArray = [NSMutableArray arrayWithCapacity:1];

    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"person1"];
    [person addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"person2"];
    [person addObserver:self forKeyPath:@"type" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:@"person3"];
    
    self.person = person;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == @"person1") {
        NSLog(@"来了 name");
    }
    if (context == @"person2") {
        NSLog(@"来了 dataArray");
    }
    NSLog(@"keyPath:%@ object:%@ change:%@",keyPath,object,change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#pragma mark 成员变量 KVO
    //成员变量也有KVC，成员变量没有KVO，如果让成员变量也有KVO，可以手动添加KVO
//    [self.person setValue:@"你好" forKey:@"type"];
//    self.person.type = @"嘿嘿";
//    NSLog(@"_type:%@",self.person->_type);
    
#pragma mark kvc setValue:forKey: 中的key也可以是_key
//    [self.person setValue:@"嘿嘿" forKey:@"_foo"];//foo或_foo,都可以
//    NSLog(@"foo:%@",self.person.foo);
    
#pragma mark @unionOfArrays
    //@unionOfArrays 并集
    //@distinctUnionOfArrays 并集-去重
    //@distinctUnionOfSets 并集-去重, NSSet 只有并集去重，没有并集
//    NSArray *personArray = [KVOSumObject personArray];
//    NSArray *personArray1 = [KVOSumObject personArray1];
    // 嵌套数组
//    NSArray* nestArr = @[personArray, personArray1];
//    NSLog(@"%@",[nestArr valueForKeyPath:@"@unionOfArrays.age"]);
//    NSLog(@"%@",[nestArr valueForKeyPath:@"@distinctUnionOfArrays.age"]);
    
//    NSSet *personset = [KVOSumObject personSet];
//    NSSet *personset1 = [KVOSumObject personSet1];
//    NSSet *nest = [NSSet setWithObjects:personset, personset1, nil];
//    NSLog(@"%@",[nest valueForKeyPath:@"@distinctUnionOfSets.age"]);
    
    
#pragma mark @unionOfObjects、@distinctUnionOfObjects
    //@unionOfObjects 返回操作对象指定属性的集合
    //@distinctUnionOfObjects 返回操作对象指定属性的集合 ---去重
//    NSArray *personArray = [KVOSumObject personArray];
//    NSLog(@"%@",[personArray valueForKey:@"age"]);
//    NSLog(@"%@",[personArray valueForKeyPath:@"@unionOfObjects.age"]);
//    NSLog(@"%@",[personArray valueForKeyPath:@"@distinctUnionOfObjects.age"]);

    
#pragma mark 聚合操作符，@avg、@count、@max、@min、@sum
    //必须用在集合对象上或普通对象的集合属性上
//    NSArray *personArray = [KVOSumObject personArray];
//    NSLog(@"age:%@", [personArray valueForKey:@"age"]);
//    NSLog(@"nick:%@",[personArray valueForKey:@"nick"]);
//    //平均值avg
//    float avg = [[personArray valueForKeyPath:@"@avg.age"] floatValue];//[[personArray valueForKeyPath:@"@avg.length"] floatValue];
//    NSLog(@"%f", avg);
//    //个数count
//    int count = [[personArray valueForKeyPath:@"@count.age"] intValue];
//    NSLog(@"%d", count);
//    //和sum
//    int sum = [[personArray valueForKeyPath:@"@sum.age"] intValue];
//    NSLog(@"%d",sum);
//    //最大值max
//    int max = [[personArray valueForKeyPath:@"@max.age"] intValue];
//    NSLog(@"%d",max);
//    //最小值min
//    int min = [[personArray valueForKeyPath:@"@min.age"] intValue];
//    NSLog(@"%d",min);
    
#pragma mark
//    NSArray *array = @[@"Janf",@"Roi",@"Goua",@"SV"];
//    NSArray *lenStr= [array valueForKeyPath:@"length"];
//    NSLog(@"%@",lenStr);// 消息从array传递给了string
//    NSArray *lowStr= [array valueForKeyPath:@"lowercaseString"];
//    NSLog(@"%@",lowStr);
    
#pragma mark setValuesForKeysWithDictionary(字典转模型) & dictionaryWithValuesForKeys(键数组转模型到字典)
//    NSDictionary *dic = @{@"name":@"小明",@"age":@(20),@"nick":@"大葱",@"length":@(12)};
//    KVOSumObject *obj = [[KVOSumObject alloc] init];
//    [obj setValuesForKeysWithDictionary:dic];
//    NSLog(@"%@",obj);
//    NSArray *array = @[@"name",@"age"];
//    NSDictionary *dicR = [obj dictionaryWithValuesForKeys:array];
//    NSLog(@"%@",dicR);

#pragma mark array取值
//    KVOPerson *person = [[KVOPerson alloc] init];
//    person.arrayS = [NSMutableArray arrayWithObjects:@"str0",@"str1",@"str2",@"str3", nil];
//    NSArray *arr = [person valueForKey:@"arrayS"];
//    NSLog(@"strs = %@",arr);
//    NSLog(@"%@",arr[0]);
//    NSLog(@"%d",[arr containsObject:@"str8"]);
//    //遍历
//    NSEnumerator *enumerator = [arr objectEnumerator];
//    NSString *str = nil;
//    while (str = [enumerator nextObject]) {
//        NSLog(@"%@",str);
//    }
    
#pragma mark 4、KVC层层访问 - keyPath
//    KVOStudent *stu = [[KVOStudent alloc] init];
//    stu.subject = @"物理";
//    KVOPerson *per = [[KVOPerson alloc] init];
//    per.student = stu;
//    [per setValue:@"Swift" forKeyPath:@"student.subject"];
//    NSLog(@"课程:%@",[per valueForKeyPath:@"student.subject"]);
    
#pragma mark 3、
//    struct ThreeFloats floats = {1.,2.,3.};
//
//    NSValue *value = [NSValue valueWithBytes:&floats objCType:@encode(struct ThreeFloats)];
//    [person setValue:value forKey:@"threeFloats"];
//    NSValue *value1    = [person valueForKey:@"threeFloats"];
//    NSLog(@"%@",value1);
//
//    ThreeFloats th;
//    [value1 getValue:&th];
//    NSLog(@"%f-%f-%f",th.x,th.y,th.z);
    
    
#pragma mark 2、KVC改变一个不可变数组里面的元素
//    KVOPerson *person = [[KVOPerson alloc] init];
//    person.array = @[@"1",@"2",@"3"];
   // 修改数组
//    person.array[0] = @"100";//直接报错
   // 第一种:搞一个新的数组 - KVC 赋值就OK
//   NSArray *array = [person valueForKey:@"array"];
//   array = @[@"100",@"2",@"3"];
//   [person setValue:array forKey:@"array"];
//   NSLog(@"%@",[person valueForKey:@"array"]);
   // 第二种
//   NSMutableArray *mArray = [person mutableArrayValueForKey:@"array"];
//   mArray[0] = @"200";
//   NSLog(@"%@",[person valueForKey:@"array"]);
    
    
#pragma mark 1、name改变
//    self.person.name = [NSString stringWithFormat:@"%@8",self.person.name];
//    NSLog(@"%s:%@",__func__,self.person.name);
    
#pragma mark 配合 KVOPerson.m 3、KVO联动观察
//    self.person.name1 = [NSString stringWithFormat:@"%@8",self.person.name1];
//    NSLog(@"%s:%@",__func__,self.person.name1);
    
#pragma mark 配合 KVOPerson.m 1、KVC 关闭或开启实例变量赋值
//    [self.person setValue:@"123" forKey:@"businessType"];
////    self.person->_businessType = @"123";
//    [self.person printTest];
    
#pragma mark KVO 集合数组观察
//    [self.person.dataArray addObject:@"hello"];//无法观察到
//    [[self.person mutableArrayValueForKey:@"dataArray"] addObject:@"hello"];//正确的
    
}

- (void)dealloc {
    NSLog(@"%s",__func__);
//    [self.person removeObserver:self forKeyPath:@"name"];
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
