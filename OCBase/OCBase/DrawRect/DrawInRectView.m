//
//  DrawInRectView.m
//  OCBase
//
//  Created by xmly on 2021/10/18.
//

#import "DrawInRectView.h"

@interface DrawInRectView ()


@end

@implementation DrawInRectView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 30, 30);
        btn.backgroundColor = [UIColor redColor];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

#pragma mark -- 布局
- (void)layoutSubviews {
    NSLog(@"--- === %s %@",__FUNCTION__,[NSThread currentThread]);
}

//如果实现了CALayerDelegate的layoutSublayersOfLayer:代理方法，就走layoutSublayersOfLayer:，没实现就走layoutSubviews
//- (void)layoutSublayersOfLayer:(CALayer *)layer {
//    NSLog(@"--- === %s",__FUNCTION__);
//}

#pragma mark -- 绘制
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
//    NSLog(@"--- === %s %@",__FUNCTION__, [NSThread currentThread]);
//    UIImage *bg_mid = [UIImage imageNamed:@"默认头像1"];
////    UIView *view = [[UIView alloc] init];
////    view.backgroundColor = [UIColor redColor];
//
//    CGRect mrect = CGRectMake(20, 20, 50, 40);
//    [bg_mid drawInRect:mrect];
    
    // 这个算是异步绘制吗??? 有问题
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"--- === %s %@",__FUNCTION__, [NSThread currentThread]);
//        UIImage *bg_mid = [UIImage imageNamed:@"默认头像1"];
//    //    UIView *view = [[UIView alloc] init];
//    //    view.backgroundColor = [UIColor redColor];
//
//        CGRect mrect = CGRectMake(20, 20, 50, 40);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"--- === %s %@",__FUNCTION__, [NSThread currentThread]);
//            [bg_mid drawInRect:mrect];
//        });
//    });

}

//如果实现了CALayerDelegate的drawLayer:inContext:代理方法，就走drawLayer:inContext:，没实现就走drawRect:
//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
//    NSLog(@"--- === %s",__FUNCTION__);
//}

- (void)buttonClick:(UIButton *)sender {
    NSLog(@"--- === %s",__FUNCTION__);
}

@end
