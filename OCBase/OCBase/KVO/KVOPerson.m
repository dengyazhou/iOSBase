//
//  KVOPerson.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/28.
//

#import "KVOPerson.h"

@implementation KVOPerson


#pragma mark 成员变量 KVO //手动添加KVO
//- (void)setType:(NSString *)type {
//    [self willChangeValueForKey:@"type"];
//    _type = type;
//    [self didChangeValueForKey:@"type"];
//}
//
//- (NSString *)type {
//    return _type;
//}

#pragma mark 1、KVC 关闭或开启实例变量赋值
//+ (BOOL)accessInstanceVariablesDirectly {
//    return NO;
//}
//
- (void)printTest {
//    NSLog(@"===>:%@",_businessType);
}

#pragma mark 2、KVC 赋值过程、取值过程
/**
 1. 先找相关方法  set<Key>:, _set<Key>:, setIs<Key>:
 2. 若没有相关方法 + (BOOL)accessInstanceVariablesDirectly，判断是否可以直接访问成员变量
 3. 如果是判断是NO,直接执行KVC的setValue:forUndefinedKey:(系统抛出一个异常，未定义key)
 4. 如果是YES，继续找相关变量_<key>, _is<Key>, <key>, is<Key>
 5. 方法或成员都不存在，setValue:forUndefinedKey:方法，默认是抛出异常
 */

/**
 1. 先找相关方法 get<Key>, <key>, is<Key>, _<key>, countOfKey & objectInKeyAtIndex
 2. 若没有相关方法 + (BOOL)accessInstanceVariablesDirectly，判断是否可以直接方法成员变量
 3. 如果上面的判断是NO, 直接执行KVC的valueForUnderfinedKey：（系统抛出一个异常，未定义key）
 4. 如果上面的判断是YES, 继续找相关变量_<key>, _is<Key>, <key>, is<Key>
 5. 方法或成员都不存在，valueForUndefinedKey：方法 默认抛出异常
 */

#pragma mark 1、KVO属性观察默认是自动的
//默认是自动
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    return YES;//默认返回YES
//}

#pragma mark 2、KVO属性观察 改成手动观察
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    if ([key isEqualToString:@"name"]) {
//        return NO;
//    }
//    return YES;
//}
//
//- (void)setName:(NSString *)name {
//    [self willChangeValueForKey:@"name"];
//    _name = name;
//    [self didChangeValueForKey:@"name"];
//}

#pragma mark 3、KVO联动观察
//+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
//    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
//    if ([key isEqualToString:@"name"]) {
//        NSArray *array = @[@"name1",@"name2"];
//        keyPaths = [keyPaths setByAddingObjectsFromArray:array];
//    }
//    return keyPaths;
//}


- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
