//
//  KVOSumObject.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/1.
//

#import "KVOSumObject.h"

@implementation KVOSumObject

//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, strong) NSNumber *age;
//@property (nonatomic, copy) NSString *nick;
//@property (nonatomic, assign) NSInteger length;


+ (instancetype)createObject:(NSString *)name age:(NSNumber *)age nick:(NSString *)nick length:(NSInteger)length {
    KVOSumObject *obj = [[KVOSumObject alloc] init];
    obj.name = name;
    obj.age = age;
    obj.nick = nick;
    obj.length = length;
    return obj;
}

+ (NSArray *)personArray {
    KVOSumObject *obj1 = [KVOSumObject createObject:@"小明" age:@(23) nick:@"明明" length:170];
    KVOSumObject *obj2 = [KVOSumObject createObject:@"刘备" age:@(24) nick:@"备备" length:171];
    KVOSumObject *obj3 = [KVOSumObject createObject:@"孙尚香" age:@(25) nick:@"香香" length:172];
    KVOSumObject *obj4 = [KVOSumObject createObject:@"太史慈" age:@(25) nick:@"慈慈" length:173];
    KVOSumObject *obj5 = [KVOSumObject createObject:@"诸葛亮" age:@(27) nick:@"亮亮" length:174];
    return @[obj1,obj2,obj3,obj4,obj5];
}

+ (NSArray *)personArray1 {
    KVOSumObject *obj1 = [KVOSumObject createObject:@"小明1" age:@(23) nick:@"明明1" length:175];
    KVOSumObject *obj2 = [KVOSumObject createObject:@"刘备1" age:@(26) nick:@"备备1" length:176];
    KVOSumObject *obj3 = [KVOSumObject createObject:@"孙尚香1" age:@(27) nick:@"香香1" length:177];
    KVOSumObject *obj4 = [KVOSumObject createObject:@"太史慈1" age:@(28) nick:@"慈慈1" length:178];
    KVOSumObject *obj5 = [KVOSumObject createObject:@"诸葛亮1" age:@(29) nick:@"亮亮1" length:179];
    return @[obj1,obj2,obj3,obj4,obj5];
}

+ (NSSet *)personSet {
    KVOSumObject *obj1 = [KVOSumObject createObject:@"小明" age:@(23) nick:@"明明" length:170];
    KVOSumObject *obj2 = [KVOSumObject createObject:@"刘备" age:@(24) nick:@"备备" length:171];
    KVOSumObject *obj3 = [KVOSumObject createObject:@"孙尚香" age:@(25) nick:@"香香" length:172];
    KVOSumObject *obj4 = [KVOSumObject createObject:@"太史慈" age:@(25) nick:@"慈慈" length:173];
    KVOSumObject *obj5 = [KVOSumObject createObject:@"诸葛亮" age:@(27) nick:@"亮亮" length:174];
    return [NSSet setWithArray:@[obj1,obj2,obj3,obj4,obj5]];
}

+ (NSSet *)personSet1 {
    KVOSumObject *obj1 = [KVOSumObject createObject:@"小明1" age:@(23) nick:@"明明1" length:175];
    KVOSumObject *obj2 = [KVOSumObject createObject:@"刘备1" age:@(26) nick:@"备备1" length:176];
    KVOSumObject *obj3 = [KVOSumObject createObject:@"孙尚香1" age:@(27) nick:@"香香1" length:177];
    KVOSumObject *obj4 = [KVOSumObject createObject:@"太史慈1" age:@(28) nick:@"慈慈1" length:178];
    KVOSumObject *obj5 = [KVOSumObject createObject:@"诸葛亮1" age:@(29) nick:@"亮亮1" length:179];
    return [NSSet setWithArray:@[obj1,obj2,obj3,obj4,obj5]];
}


- (NSString *)description {

    return [NSString stringWithFormat:@"===>:%@ %@ %@ %ld",self.name,self.age,self.nick,self.length];
}

@end
