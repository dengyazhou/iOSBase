//
//  UIHitTestTheoryView.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "UIHitTestTheoryView.h"

@implementation UIHitTestTheoryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//事件传递（从上到下）
//    UIApplication、UIWindow、UIViewController、UIView、父视图、子视图
//事件响应 响应机制（从下到上）
//    视图、父视图、UIView、UIViewController、UIWindow、UIApplication
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 如果交互未打开，或者透明度小于0.05 或者 视图被隐藏
    if (self.userInteractionEnabled == NO || self.alpha < 0.05 || self.hidden == YES) {
       return nil;
    }
    // 如果 touch 的point 在 self 的bounds 内
    if ([self pointInside:point withEvent:event]) {
       for (UIView *subView in self.subviews){
           //进行坐标转化
           CGPoint coverPoint = [subView convertPoint:point fromView:self];
           // 调用子视图的 hitTest 重复上面的步骤。找到了，返回hitTest view ,没找到返回有自身处理
           UIView *hitTestView = [subView hitTest:coverPoint withEvent:event];
           if (hitTestView) {
               return hitTestView;
           }
       }
       return self;
    }
    return nil;
}



@end
