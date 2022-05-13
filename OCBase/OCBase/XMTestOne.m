//
//  XMOCBase.m
//  OCBase
//
//  Created by xmly on 2022/2/28.
//

#import "XMTestOne.h"

@implementation XMTestOne

+ (void)putWithTag:(NSString *)tag path:(NSString *)path Format:(NSString *)format, ...{
    
    va_list ap;
    va_start(ap, format);
    
    NSString *body = [[NSString alloc] initWithFormat:format arguments:ap];
    NSLog(@"format:%@,body:%@",format,body);
    
    va_end(ap);
    
}

@end
