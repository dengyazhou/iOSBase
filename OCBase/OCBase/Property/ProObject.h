//
//  ProObject.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProObject : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *car;

@property (nonatomic, unsafe_unretained) NSString *strUnsafe;
@property (nonatomic, copy) NSString *strCopy;

@property (nonatomic, class) NSInteger cAge;//类属性 需要自己手动实现set、get方法，不然会崩溃

@end

NS_ASSUME_NONNULL_END
