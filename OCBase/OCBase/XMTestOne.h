//
//  XMOCBase.h
//  OCBase
//
//  Created by xmly on 2022/2/28.
//

#import <Foundation/Foundation.h>

//##__VA_ARGS__ 代表多参数
//... 代表多参数

#define XMTestOneLog(_tag, _path ,_format, ...)     [XMTestOne putWithTag:_tag path:_path Format:_format, ##__VA_ARGS__];

NS_ASSUME_NONNULL_BEGIN

@interface XMTestOne : NSObject

//"(NSString *)format, ..." 一起组成字符一个字符串
//format 代表第一个字符串
+ (void)putWithTag:(NSString *)tag path:(nullable NSString *)path Format:(NSString *)format, ...;

@end

NS_ASSUME_NONNULL_END
