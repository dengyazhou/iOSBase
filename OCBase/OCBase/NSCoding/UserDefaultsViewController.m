//
//  UserDefaultsViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/5/8.
//

#import "UserDefaultsViewController.h"
#import <Masonry/Masonry.h>

@interface UserDefaultsViewController ()

@end

@implementation UserDefaultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NSUserDefaults";
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
        make.right.offset(-10);
    }];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#pragma mark 1、沙盒目录
    //1、Documents: 存放应用程序的数据 (苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录);
    //2、Library
    //2.1、Library/Caches: 保存用户使用应用程序时产生的缓存文件, 比如网络请求的数据. 应用程序通常还需要负责删除这些文件. 不会被iTunes同步;
    //2.2、Library/Preferences: 应用程序的偏好设置文件. 我们使用NSUserDefaults写的设置数据都会保存到该目录下的一个plist文件中，这就是所谓的写入plist中. 会被iTunes同步;
    //3、SystemData
    //4、tmp: 应用程序存储的临时文件(应用程序再次启动时不需要的文件). 比如系统磁盘存储空间不足的时候, 该目录下的文件随时有可能被系统清理掉.不会被iTunes同步.
}

- (void)save:(UIButton *)sender {
    //Library->Preferences
    [[NSUserDefaults standardUserDefaults] setValue:@"nihao" forKey:@"AB_key"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)change:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setValue:nil forKey:@"AB_key"];//赋值为nil相当于清空
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)getOut:(UIButton *)sender {
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"AB_key"];
    NSLog(@"%@",str);
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
