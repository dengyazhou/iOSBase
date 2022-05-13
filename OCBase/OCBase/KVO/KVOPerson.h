//
//  KVOPerson.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/28.
//

#import <Foundation/Foundation.h>
#import "KVOStudent.h"

NS_ASSUME_NONNULL_BEGIN

@interface KVOPerson : NSObject {
    @public
//    NSString *_businessType;//1、KVC 关闭或开启实例变量赋值
    
//    NSString *_foo;
//    NSString *_type;//成员变量 KVO
}

//成员变量 KVO
//- (void)setType:(NSString *)type;
//- (NSString *)type;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *name1;
@property (nonatomic, copy) NSString *name2;

@property (nonatomic, copy) NSString *foo;

@property (nonatomic, strong) KVOStudent *student;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSArray *array;
@property (nonatomic, strong) NSMutableArray *arrayS;




- (void)printTest;

@end

NS_ASSUME_NONNULL_END
