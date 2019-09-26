//
//  AppDelegate.m
//  GoodWeather
//
//  Created by zhangys on 2017/5/4.
//  Copyright © 2017年 张茨一飞. All rights reserved.
//

#import "AppDelegate.h"
#import "AppConstants.h"
#import <XHLaunchAd.h>
#import <UIImageView+WebCache.h>

#import "HomeMainViewController.h"

@interface AppDelegate ()<XHLaunchAdDelegate>

@property (nonatomic, strong) UIImageView * customLaunchImageView;
@property (nonatomic, strong) UIImageView * yourImageView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    [self setUpLaunchScreen];
    
    HomeMainViewController * mainVC = [[HomeMainViewController alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    
    return YES;
}

//添加启动图
- (void)setUpLaunchScreen{
    //1.使用默认配置初始化
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
    imageAdconfiguration.frame = CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height - 105 * AutoSizeScaleX);
    imageAdconfiguration.duration = 3;
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"https://io.lookyes.cn/bing/";
    imageAdconfiguration.contentMode = UIViewContentModeScaleAspectFill;
    //广告点击打开链接
    //imageAdconfiguration.openURLString = @"http://www.returnoc.com";
    //显示图片开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];

}

-(void)xhLaunchAdShowFinish:(XHLaunchAd *)launchAd{
    
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
