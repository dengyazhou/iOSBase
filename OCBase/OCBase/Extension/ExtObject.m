//
//  ExtObject.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/19.
//

#import "ExtObject.h"
#import "ExtObject+XMObject.h" //必须这里引入，否则声明的属性会找不到崩溃，方法会因为没有实现而崩溃

@implementation ExtObject

- (void)extObTest:(NSString *)name {
    NSLog(@"%s %@",__func__,name);
}

@end
