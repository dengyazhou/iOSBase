//
//  XMViewLayout.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/4.
//

#import "XMViewLayout.h"

@implementation XMViewLayout

- (void)layoutSubviews {
    NSLog(@"%s",__func__);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
}

- (CGSize)sizeThatFits:(CGSize)size {
    //传入的参数是当前的size，返回一个适合的size
    NSLog(@"%s",__func__);
//    return CGSizeMake(size.width + 100, size.height - 20);
    return size;
}



- (void)displayLayer:(CALayer *)layer {
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
}


@end
