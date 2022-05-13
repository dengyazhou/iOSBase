//
//  UIHitTestView21.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import "UIHitTestView21.h"

@implementation UIHitTestView21

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    return [super hitTest:point withEvent:event];
}

@end
