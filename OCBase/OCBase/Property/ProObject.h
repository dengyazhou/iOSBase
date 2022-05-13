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


@end

NS_ASSUME_NONNULL_END
