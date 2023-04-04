//
//  PrintInteractionVC.m
//  OCBase
//
//  Created by yazhoudeng on 2022/12/21.
//

#import "PrintInteractionVC.h"
#import <WebKit/WebKit.h>

@interface PrintInteractionVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet WKWebView *wkWebView;
@property (weak, nonatomic) IBOutlet UIView *printView;


@end

@implementation PrintInteractionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.wkWebView.navigationDelegate = self;

}

- (IBAction)buttonClick:(id)sender {
    
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
}


#pragma mark WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"%s",__FUNCTION__);
    
    UIPrintInteractionController *controller = [UIPrintInteractionController sharedPrintController];
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
        ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if(!completed && error){
            NSLog(@"FAILED! due to error in domain %@ with error code %ld",error.domain, (long)error.code);
//            [[MyAlertCenter defaultCenter] postAlertWithMessage:DYZString(@"打印出错！")];
            NSLog(@"=======>>>>>打印出错！");
        }
//        [self successBack];
            NSLog(@"=======>>>>>打印成功！");
    };
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
//    printInfo.jobName = [urlField text];
    printInfo.jobName = @"webView打印";
    printInfo.duplex = UIPrintInfoDuplexLongEdge;
    controller.printInfo = printInfo;
//    controller.showsPageRange = YES;

//    UIViewPrintFormatter *viewFormatter = [self.imageView viewPrintFormatter];
//    UIViewPrintFormatter *viewFormatter = [self.wkWebView viewPrintFormatter];
//    UIViewPrintFormatter *viewFormatter = [self.printView viewPrintFormatter];//直接打印 View，不行
    UIViewPrintFormatter *viewFormatter = [[self getImageViewFromView] viewPrintFormatter];//View转image，image添加到imageView上
    viewFormatter.startPage = 0;
    controller.printFormatter = viewFormatter;
 
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//        [controller presentFromBarButtonItem:sender animated:YES completionHandler:completionHandler];
    } else {
        [controller presentAnimated:YES completionHandler:completionHandler];
    }
    
}

- (UIImageView *)getImageViewFromView{
  
    UIImageView *imageView = [[UIImageView alloc] init];

//    UIImage *image = [UIImage imageNamed:@"默认头像1.png"];
    UIImage *image = [self makeImageWithView:self.printView withSize:self.printView.bounds.size];
    
    imageView.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    
    imageView.image = image;
    
    return imageView;
};

#pragma mark view 转 image
- (UIImage *)makeImageWithView:(UIView *)view withSize:(CGSize)size
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
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
