//
//  XMCodeingObj.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/17.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface XMCodeingObj : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;//可以用encodeObject和decodeObjectForKey
//@property (nonatomic, assign) BOOL sex;//不能用encodeObject和decodeObjectForKey
//@property (nonatomic, assign) int num;//不能用encodeObject和decodeObjectForKey

@property (nonatomic, strong) NSNumber *year;
@property (nonatomic, assign) Boolean isHave;//Boolean 可以相当于"OC对象"，可以用encodeObject和decodeObjectForKey
@property (nonatomic, copy) NSString *weight;



@end

NS_ASSUME_NONNULL_END
