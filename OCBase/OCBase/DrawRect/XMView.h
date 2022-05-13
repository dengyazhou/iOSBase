//
//  XMView.h
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XMView : UIView

- (CGContextRef)createContext;

- (void)closeContext;

@end

NS_ASSUME_NONNULL_END
