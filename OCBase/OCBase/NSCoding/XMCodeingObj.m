//
//  XMCodeingObj.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/17.
//

#import "XMCodeingObj.h"
//#import <objc/runtime.h>
#import <YYModel.h>

@interface XMCodeingObj () <NSCoding>

@end

@implementation XMCodeingObj

#pragma mark 3、方式三 YYModel
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [self yy_modelEncodeWithCoder:coder];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    return [self yy_modelInitWithCoder:coder];
}

#pragma mark 2、方式二 runtime
//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    unsigned int count = 0;
//    Ivar* ivars = class_copyIvarList([self class], &count);
//
//    for (int i = 0; i < count; i++) {
//        Ivar var = ivars[i];
//        const char* name = ivar_getName(var);
//        NSString* key = [NSString stringWithUTF8String:name];
//        id value = [self valueForKey:key];
//        [coder encodeObject:value forKey:key];
//    }
//    free(ivars);
//}
//
//- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
//    self = [super init];
//    if (self) {
//        unsigned int count = 0;
//        Ivar* ivars = class_copyIvarList([self class], &count);
//
//        for (int i = 0; i < count; i++) {
//            Ivar var = ivars[i];
//            const char* name = ivar_getName(var);
//            NSString* key = [NSString stringWithUTF8String:name];
//            id value = [coder decodeObjectForKey:key];
//            [self setValue:value forKey:key];
//        }
//        free(ivars);
//    }
//    return self;
//}

#pragma mark 1、方式一 直接手写
////编码方法，当对象被编码成二进制数据时调用
//- (void)encodeWithCoder:(nonnull NSCoder *)coder {
//    [coder encodeObject:_name forKey:@"name_1"];//@"name",这个随便写，只要和"decodeObjectForKey"中写的一样就行
//    [coder encodeInteger:_age forKey:@"age"];
//    [coder encodeBool:_sex forKey:@"sex"];
//
//    [coder encodeObject:_year forKey:@"year"];
//    [coder encodeBool:_isHave forKey:@"isHave"];
//    [coder encodeObject:_weight forKey:@"weight"];
//}
//
////解码方法，当把二进制数据转成对象时调用
//- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
//    self = [super init];
//    if (self) {
//        _name = [coder decodeObjectForKey:@"name_1"];
//        _age = [coder decodeIntegerForKey:@"age"];
//        _sex = [coder decodeBoolForKey:@"sex"];
//
//        _year = [coder decodeObjectForKey:@"year"];
//        _isHave = [coder decodeBoolForKey:@"isHave"];
//        _weight = [coder decodeObjectForKey:@"weight"];
//    }
//    return self;
//}

- (NSString *)description {
    return [NSString stringWithFormat:@"姓名:%@,年龄:%ld",_name,_age];
}

@end
