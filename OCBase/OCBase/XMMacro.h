//
//  XMMacro.h
//  OCBase
//
//  Created by xmly on 2022/3/7.
//

#ifndef XMMacro_h
#define XMMacro_h

static inline void dispatch_async_on_main_queue_dyz(void (^block)(void)) {
    NSLog(@"Macro 开始");
    block();
    NSLog(@"Macro 结束");
}


#endif /* XMMacro_h */
