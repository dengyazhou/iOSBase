//
//  ProObject.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "ProObject.h"

@implementation ProObject

//@dynamic
//    不生成对应的set、get方法的实现，但是有set、get方法的声明
//    注意点：1、没有了对应的成员变量
//    2、调用self.xx，编译时可以过，运行时会崩溃
//    3、使用场景是在分类中添加了属性，.m中需要加@dynamic
@dynamic name;

//@dynamic cAge;

//@synthesize
//    注意点：1、如果想同时自己实现set、get方法，需要@synthesize name = _name;然后才能在set、get方法中使用_name。
//    2、如果只实现一个set或get方法，则不需要@synthesize name = _name; 可以直接在set、get方法中使用_name。
//@synthesize car = _car;
//- (NSString *)car {
//    return _car;
//}
//
//- (void)setCar:(NSString *)car {
//    _car = car;
//}

@synthesize car;


//查看类结构
//    image lookup -t Person


@end
