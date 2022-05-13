//
//  UIHitTestViewSuper.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "UIHitTestViewSuper.h"

@implementation UIHitTestViewSuper

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//先写好，然后往xib上拖。如果直接从HitTestViewController.xib上往这里拖不行。
- (IBAction)buttonClick:(UIButton *)sender {
    NSLog(@"%s",__func__);
}



#pragma mark 实例一 子视图超出父视图范围
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
//    CGPoint newp = [self convertPoint:point toView:self.button];
////    CGPoint newp = [self.button convertPoint:point fromView:self];
//    if ([self.button pointInside:newp withEvent:event]) {
//        return self.button;
//    }
    return [super hitTest:point withEvent:event];
}

// 该方法判断触摸点是否在控件身上，是则返回YES，否则返回NO，point参数必须是方法调用者的坐标系
#pragma mark 实例二 可以控制点击的 部区域有效
//https://gsl201600.github.io/2019/12/25/iOS%E4%B8%AD%E4%BA%8B%E4%BB%B6%E7%9A%84%E5%93%8D%E5%BA%94%E9%93%BE%E5%92%8C%E4%BC%A0%E9%80%92%E9%93%BE/
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//
//    return NO;
//}

//- (CGPoint)convertPoint:(CGPoint)point toView:(nullable UIView *)view;
//将 相对于【 调用这个方法的View（方法的调用者）的坐标】的point，转换到 相对于 【参数view的坐标】的点。相对于 都是bounds，不是frame

//- (CGPoint)convertPoint:(CGPoint)point fromView:(nullable UIView *)view;
//将 相对于 【参数view的坐标】的point，转换到 相对于【 调用这个方法的View（方法的调用者）的坐标】的点。

//- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event;
//判断这个point点，是否在 【调用这个方法的View（方法的调用者）】【相对于 调用这个方法的View 的 bounds 坐标】里面。

//CGPoint point = CGPointMake(30, 20);
//CGPoint point1 = [self.view1 convertPoint:point toView:self.view2];
//CGPoint point2 = [self.view2 convertPoint:point fromView:self.view1];
//将view1上面的点point（相对于view1的坐标点），转换到 相对于view2上面的点point（相对于view2的坐标点）
//    point1和point2一样，都是view2上面的点

//CGPoint point11 = [self.view2 convertPoint:point toView:self.view1];
//CGPoint point22 = [self.view1 convertPoint:point fromView:self.view2];
//将view2上面的点point（相对于view2的坐标点），转换到 相对于view1上面的点point（相对于view1的坐标点）
//    point11和point22一样，都是view1上面的点

@end
