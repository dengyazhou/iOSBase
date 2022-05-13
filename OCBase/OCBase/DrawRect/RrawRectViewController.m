//
//  RrawRectViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/4.
//

#import "RrawRectViewController.h"
#import "DrawInRectView.h"
#import "XMView.h"
#import "XMViewLayout.h"

@interface RrawRectViewController ()

@property (nonatomic, strong) XMViewLayout *viewLayout;


@end

@implementation RrawRectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);
    
    self.title = @"DrawRect";
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark 7、layoutSubviews(布局) && drawRect(绘制)
    XMViewLayout *viewLayout = [[XMViewLayout alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    viewLayout.backgroundColor = [UIColor redColor];
    self.viewLayout = viewLayout;
    [self.view addSubview:viewLayout];
    
    
#pragma mark 6、UIView 和 CALayer
//    {
//        XMView *view = [[XMView alloc] init];
//        view.frame = CGRectMake(10, 100, 100, 100);
//        view.backgroundColor = [UIColor redColor];
//        [self.view addSubview:view];
//    }
    
#pragma mark 5、drawRect
//    {
//        DrawInRectView *drawView = [[DrawInRectView alloc] init];
//
//        drawView.frame = CGRectMake(10, 100, 100, 100);
//        drawView.backgroundColor = [UIColor cyanColor];
//        [self.view addSubview:drawView];
//
////        NSLog(@"layer:%@",drawView.layer);
////        NSLog(@"layerClass:%@",[DrawInRectView layerClass]);
////        [drawView mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.centerY.equalTo(self.view.mas_centerY);
////            make.leftMargin.mas_equalTo(self.view);
////            make.size.mas_equalTo(CGSizeMake(100, 100));
////        }];
//    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
#pragma mark 触发 sizeThatFits
    //sizeToFit: 会自动调用sizeThatFits:方法
//    [self.viewLayout sizeToFit];
    
#pragma mark 触发 drawRect
    //setNeedsDisplay: 标记为需要重绘，异步调用drawRect，在下一个draw周期自动重绘，iphone device的刷新频率是60hz，也就是1/60秒后重绘
    //setNeedsDisplayInRect: 标记为需要局部重绘，异步调用drawRect
    [self.viewLayout setNeedsDisplay];
//    [self.viewLayout setNeedsDisplayInRect:CGRectMake(0, 0, 20, 20)];
    
#pragma mark 触发 layoutSubviews 情景
#pragma mark 1、addSubview
//    [self.view addSubview:self.viewLayout];//第一次添加的时候才会触发哦
    
#pragma mark 2、frame修改，且frame的值改变了
//    self.viewLayout.frame = CGRectMake(100, 300, 40, 30);
    
#pragma mark 3、setNeedsLayout && layoutIfNeeded
    //setNeedsLayout: 标记为需要重新布局，不立即刷新，在系统runloop的下一个周期自动调用layoutSubviews
    //layoutIfNeeded: 如果有需要刷新的标记，立即调用layoutSubviews进行布局（如果没有标记，就不会调用layoutSubviews）
//    [self.viewLayout setNeedsLayout];
//    [self.viewLayout layoutIfNeeded];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
