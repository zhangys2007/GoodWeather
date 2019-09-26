//
//  AppConstants.h
//  GoodWeather
//
//  Created by zhangys on 2019/9/26.
//  Copyright © 2019 上海永同资产管理有限公司. All rights reserved.
//

#ifndef AppConstants_h
#define AppConstants_h




//屏幕尺寸
// tabbar高度
#define SCREEN_IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height //手机屏幕高度

#define kTabBarHeight (IS_IPhoneX_All ? 83.0 : 49.0)
//导航栏高度
#define SafeAreaTopHeight (IS_IPhoneX_All ? 88 : 64)
#define SafeAreaTopHeightSTATUS (IS_IPhoneX_All ? 44 : 20)
/// 底部宏，吃一见长一智吧，别写数字了
#define SafeAreaBottomHeight (IS_IPhoneX_All ? 34 : 0)

#define APP_STATUSBAR_HEIGHT [UIApplication sharedApplication].statusBarFrame.size.height //热点栏高度+电池信息栏

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height - APP_STATUSBAR_HEIGHT + SafeAreaTopHeightSTATUS)

#define SCREEN_FRAME [UIScreen mainScreen].bounds

//尺寸比例数据 [7  4.0]
#define AutoSizeScaleX SCREEN_WIDTH / 375.0f

// 判断iPhoneX
#define isiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)]? CGSizeEqualToSize(CGSizeMake(1125, 2436),[[UIScreen mainScreen] currentMode].size): NO)
//判断iPHoneXr
#define SCREENSIZE_IS_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size): NO)

//判断iPHoneX、iPHoneXs
#define SCREENSIZE_IS_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define SCREENSIZE_IS_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iPhoneXs Max
#define SCREENSIZE_IS_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)


#endif /* AppConstants_h */
