//
//  KCViewController.m
//  OCBase
//
//  Created by xmly on 2022/6/16.
//

#import "KCViewController.h"
#import <Masonry/Masonry.h>

static NSString * const TDKeychainService = @"com.ime.analy.service";
static NSString * const TDKeychainIdentifier = @"userIdentifier";

@interface KCViewController ()

@end

@implementation KCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"keyChain 钥匙串";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSave.backgroundColor = [UIColor redColor];
    [btnSave setTitle:@"存" forState:UIControlStateNormal];
    [btnSave addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSave];
    [btnSave mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.offset(0);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *btnChange = [UIButton buttonWithType:UIButtonTypeCustom];
    btnChange.backgroundColor = [UIColor cyanColor];
    [btnChange setTitle:@"变" forState:UIControlStateNormal];
    [btnChange addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChange];
    [btnChange mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnSave.mas_right).offset(10);
        make.top.equalTo(btnSave);
        make.size.equalTo(btnSave);
    }];
    
    UIButton *btnGet = [UIButton buttonWithType:UIButtonTypeCustom];
    btnGet.backgroundColor = [UIColor orangeColor];
    [btnGet setTitle:@"取" forState:UIControlStateNormal];
    [btnGet addTarget:self action:@selector(getOut:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGet];
    [btnGet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnChange.mas_right).offset(10);
        make.top.equalTo(btnSave);
        make.size.equalTo(btnSave);
    }];
    
    UIButton *btnDet = [UIButton buttonWithType:UIButtonTypeCustom];
    btnDet.backgroundColor = [UIColor yellowColor];
    [btnDet setTitle:@"删" forState:UIControlStateNormal];
    [btnDet addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnDet];
    [btnDet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnGet.mas_right).offset(10);
        make.top.equalTo(btnSave);
        make.size.equalTo(btnSave);
        make.right.offset(-10);
    }];
    
}

- (void)save:(UIButton *)sender {
    NSString *password = @"abc";
    NSData *data = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = @{(__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword,
                          (__bridge id)kSecAttrService:TDKeychainService,
                          (__bridge id)kSecAttrAccount:TDKeychainIdentifier,
                          (__bridge id)kSecValueData:data,
    };
    OSStatus status = SecItemAdd((__bridge CFDictionaryRef)dic, NULL);
    if (status == noErr) {
        NSLog(@"===>>>:保存成功");
    }
}

- (void)change:(UIButton *)sender {
    NSString *password = @"newPasswordOrUserIdentifier";
    NSData *data = [password dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *param = @{(__bridge id)kSecValueData:data};
    NSDictionary *dic = @{(__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword,
                          (__bridge id)kSecAttrService:TDKeychainService,
                          (__bridge id)kSecAttrAccount:TDKeychainIdentifier};
    OSStatus status = SecItemUpdate((__bridge CFDictionaryRef)dic, (__bridge CFDictionaryRef)param);
    if (status == noErr) {
        NSLog(@"===>>>:更新成功");
    }
    
}

- (void)getOut:(UIButton *)sender {
    NSDictionary *dic = @{(__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword,
                          (__bridge id)kSecAttrService:TDKeychainService,
                          (__bridge id)kSecAttrAccount:TDKeychainIdentifier,
                          (__bridge id)kSecMatchLimit:(__bridge id)kSecMatchLimitOne,
                          (__bridge id)kSecReturnData:(__bridge id)kCFBooleanTrue,
    };
    CFTypeRef data = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)dic, &data);
    if (status == noErr) {
        NSData *encoderData = [NSData dataWithData:(__bridge  NSData *)data];
        if (data) {
            CFRelease(data);
        }
        if (encoderData) {
            NSString *str = [[NSString alloc] initWithData:encoderData encoding:NSUTF8StringEncoding];
            NSLog(@"====>>>>:%@",str);
        }
    }

}

- (void)delete:(UIButton *)sender {
    NSDictionary *dic = @{(__bridge id)kSecClass:(__bridge id)kSecClassGenericPassword,
                          (__bridge id)kSecAttrService:TDKeychainService,
                          (__bridge id)kSecAttrAccount:TDKeychainIdentifier};
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)dic);
    if (status == noErr) {
        NSLog(@"===>>>:删除成功");
    }
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
