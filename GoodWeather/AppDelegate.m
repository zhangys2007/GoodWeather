//
//  AppDelegate.m
//  GoodWeather
//
//  Created by zhangys on 2017/5/4.
//  Copyright © 2017年 上海永同资产管理有限公司. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImageView+WebCache.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIImageView * customLaunchImageView;
@property (nonatomic, strong) UIImageView * yourImageView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    [self setUpLaunchScreen];
    
    return YES;
}

//添加启动图
- (void)setUpLaunchScreen{
    
    self.customLaunchImageView = [[UIImageView alloc]initWithFrame:self.window.bounds];
    self.customLaunchImageView.userInteractionEnabled = YES;
    self.customLaunchImageView.backgroundColor = [UIColor redColor];
    self.yourImageView = [[UIImageView alloc]initWithFrame:self.window.bounds];
    self.yourImageView.backgroundColor = [UIColor greenColor];
    
    self.customLaunchImageView.image = [UIImage imageNamed:@"Louch"];
    
    //自定义控件我就略了
//    [self.customLaunchImageView addSubview: yourLabel];
//    
    [self.customLaunchImageView addSubview: self.yourImageView];
    
    [self.yourImageView sd_setImageWithURL:[NSURL URLWithString:@"https://cn.bing.com/az/hprichbg/rb/SSAtlantis_ZH-CN10429588926_1920x1080.jpg"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        image = [UIImage imageNamed:@"Louch"];
    }];

//    [yourButton addTarget:self action:@selector(yourButtonClick) forControlEvents:UIControlEventTouchDown];
//    [self.customLaunchImageView addSubview:yourButton];
    
    [self.window addSubview:self.customLaunchImageView];
    [self.window bringSubviewToFront:self.customLaunchImageView];
    
    //5秒后自动关闭
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self yourButtonClick];
    });
}

- (void)yourButtonClick {
    
    //是否显示新版本引导页加在这里
    
    //移动自定义启动图
    if (self.customLaunchImageView) {
        [UIView animateWithDuration:0.3 animations:^{
            self.customLaunchImageView.alpha = 0;
        } completion:^(BOOL finished) {
            [self.customLaunchImageView removeFromSuperview];
            self.customLaunchImageView = nil;
        }];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
