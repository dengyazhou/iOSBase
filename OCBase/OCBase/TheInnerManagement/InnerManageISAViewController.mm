//
//  InnerManageISAViewController.m
//  OCBase
//
//  Created by 邓亚洲 on 2022/4/17.
//

#import "InnerManageISAViewController.h"
#import "InnerSongObject.h"
#import "InnerSonObject.h"


//真机
struct isa_t_dyz_struct {
    uintptr_t nonpointer        : 1;                                       \
    uintptr_t has_assoc         : 1;                                       \
    uintptr_t has_cxx_dtor      : 1;                                       \
    uintptr_t shiftcls          : 33; /*MACH_VM_MAX_ADDRESS 0x1000000000*/ \
    uintptr_t magic             : 6;                                       \
    uintptr_t weakly_referenced : 1;                                       \
    uintptr_t unused            : 1;                                       \
    uintptr_t has_sidetable_rc  : 1;                                       \
    uintptr_t extra_rc          : 19;
};

//模拟器
//struct isa_t_dyz_struct {
//    uintptr_t nonpointer        : 1;                                         \
//    uintptr_t has_assoc         : 1;                                         \
//    uintptr_t has_cxx_dtor      : 1;                                         \
//    uintptr_t shiftcls          : 44; /*MACH_VM_MAX_ADDRESS 0x7fffffe00000*/ \
//    uintptr_t magic             : 6;                                         \
//    uintptr_t weakly_referenced : 1;                                         \
//    uintptr_t unused            : 1;                                         \
//    uintptr_t has_sidetable_rc  : 1;                                         \
//    uintptr_t extra_rc          : 8;
//};

union isa_t_dyz {
    uintptr_t bits;
    struct isa_t_dyz_struct aaa;
    isa_t_dyz() { } //必须是.mm 文件哦，这里是C++
    isa_t_dyz(uintptr_t value) : bits(value) { } //必须是.mm 文件哦，这里是C++
};

@interface InnerManageISAViewController ()

@property (nonatomic, strong) InnerSongObject *song;
@property (nonatomic, strong) InnerSongObject *song1;
@property (nonatomic, copy) InnerSongObject *songCopy;

@property (nonatomic, weak) InnerSongObject *songWeak;
@property (nonatomic, weak) InnerSongObject *songWeak1;

@end

@implementation InnerManageISAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"打印ISA";
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"isa 开始");
    
#pragma mark 1、isa打印
    isa_t_dyz aa = isa_t_dyz(120);

//    InnerSongObject *obj = [[InnerSongObject alloc] init];

#pragma mark 2、关联对象 调用之后，has_assoc才会改变
//    obj.car = @"kkk";//关联对象 调用之后，has_assoc才会改变
//    NSLog(@"%@",obj.car);
    
//    self.song = obj;//extra_rc 加1

//    self.song1 = obj;//extra_rc 加1

#pragma mark 3、copy 属性  【XMCopySong】
//    self.songCopy = obj;//需要"copyWithZone"里面的返回。如果直接返回self，obj的extra_rc 加1，如果返回一个新对象，新对象的extra_rc 加1。

#pragma mark 4、__weak 和 属性weak 一样，现在改变的是第三位 has_cxx_dtor，是isa结构变了？还是has_cxx_dtor里面做了什么处理？
//    __weak InnerSongObject * sWeak = obj;
    
//    self.songWeak = obj;

#pragma mark 2222、打印类结构
    InnerSonObject *obj = [[InnerSonObject alloc] init];
    obj.name = @"dengyazhou";
    obj.nickName = @"邓亚洲";
    obj.nameSon = @"heihei";
    obj.nickNameSon = @"嘿嘿";
    
    
    NSLog(@"isa 结束");
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
