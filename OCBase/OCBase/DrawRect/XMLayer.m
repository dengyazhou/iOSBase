//
//  XMLayer.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/13.
//

#import "XMLayer.h"

@implementation XMLayer

//前面断点调用写下的代码
- (void)layoutSublayers {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    if (self.delegate && [self.delegate respondsToSelector:@selector(layoutSublayersOfLayer:)]) {
        [self.delegate layoutSublayersOfLayer:self];
    } else {
        [super layoutSublayers];
    }
}

//绘制流程的发起函数
- (void)display {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    CGContextRef context = (__bridge  CGContextRef)([self.delegate performSelector:@selector(createContext)]);
    [self.delegate layerWillDraw:self];
    [self drawInContext:context];
    [self.delegate displayLayer:self];
    [self.delegate performSelector:@selector(closeContext)];
}

@end
