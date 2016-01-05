//
//  TabBarController.m
//  煎饼xia闻
//
//  Created by huanghaiyang on 16/1/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configLogCount];
}
//配置用户启动程序的次数
- (void)configLogCount {
    //1 先拿到以前用户登录的次数
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *str = [ud valueForKey:@"logCount"];
    int logCount = [str intValue];
    //2 让次数＋＋
    logCount++;
    //3 把登陆次数再放回去
    [ud setValue:[NSString stringWithFormat:@"%d",logCount] forKey:@"logCount"];
    
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
