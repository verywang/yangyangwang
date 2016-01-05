//
//  Test.h
//  煎饼xia闻
//
//  Created by huanghaiyang on 16/1/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#ifndef Test_h
#define Test_h
//定义一个测试的宏，控制控制台是否有输出
#define Test 0
//使用条件编译来控制输出
#if Test
#define TestLog(...) NSLog(__VA_ARGS__)
#else
#define TestLog(...)
#endif



#endif /* Test_h */
