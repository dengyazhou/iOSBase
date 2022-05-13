//
//  XMView.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/13.
//

#import "XMView.h"
#import "XMLayer.h"

@implementation XMView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
}


//+ (Class)layerClass{
//    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
//    return [XMLayer class];
//}

#pragma mark 1、布局
//子视图的布局
- (void)layoutSubviews {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    [super layoutSubviews];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    [self layoutSubviews];
}

- (CGContextRef)createContext {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.layer.opaque, self.layer.contentsScale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    return context;
}

- (void)layerWillDraw:(CALayer *)layer {
    //绘制的准备工作,do nontihing
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
}

#pragma mark 2、绘制
//绘制的操作
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    [[UIColor redColor] set];
    //Core Graphics
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.bounds.size.width / 2- 20, self.bounds.size.height / 2- 20, 40, 40)];
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
}

#pragma mark 3、渲染
//layer.contents = (位图)
- (void)displayLayer:(CALayer *)layer {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    dispatch_async(dispatch_get_main_queue(), ^{
        layer.contents = (__bridge id)(image.CGImage);
    });
}

- (void)closeContext {
    NSLog(@"===>UIVIew&Layer>>>>:%s",__func__);
    UIGraphicsEndImageContext();
}

@end
