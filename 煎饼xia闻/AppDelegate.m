//
//  AppDelegate.m
//  煎饼xia闻
//
//  Created by huanghaiyang on 16/1/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initWindow];
    
    return YES;
}
//初始化窗口
- (void)initWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //当第一次启动程序的时候，进入欢迎界面，否者直接进入主界面
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *str = [ud valueForKey:@"logCount"];
    int logCount = [str intValue];
    TestLog(@"logCount = %d",logCount);
    if (logCount == 0) {
        WelcomeViewController *welcome = [[WelcomeViewController alloc] init];
        self.window.rootViewController = welcome;
    } else {
        TabBarController *tabBar = [[TabBarController alloc] init];
        self.window.rootViewController = tabBar;
    }
    
    
    [self.window makeKeyAndVisible];
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
