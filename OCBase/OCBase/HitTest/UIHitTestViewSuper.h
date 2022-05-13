//
//  UIHitTestViewSuper.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIHitTestViewSuper : UIView

//先写好，然后往xib上拖。如果直接从HitTestViewController.xib上往这里拖不行。
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

NS_ASSUME_NONNULL_END
