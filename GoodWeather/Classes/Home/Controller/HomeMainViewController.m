//
//  HomeMainViewController.m
//  GoodWeather
//
//  Created by zhangys on 2019/9/26.
//  Copyright © 2019 张茨一飞. All rights reserved.
//

#import "HomeMainViewController.h"
#import "AppConstants.h"
#import <WebKit/WebKit.h>
#import<Plugin_SDK_iOS/Plugin_SDK_iOS.h>

@interface HomeMainViewController ()<WKUIDelegate, WKNavigationDelegate>

@property (nonatomic, strong) WKWebView * webView;

@end

@implementation HomeMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好天气";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    //2.2 初始化（此处用户key必填）
//    SynopticNetworkCustomView *view = [[SynopticNetworkCustomView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) ViewType:SynopticNetworkCustomViewTypeHorizontal UserKey:@"ENrL4ifApn" Location:@""];
//    //2.3 属性设置
//    view.viewPosition = SynopticNetworkCustomViewPositionTopLeft;//悬浮位置
//    view.contentViewAlignmen = SynopticNetworkContentViewAlignmentCenter;//内容水平方向显示对齐方式
//    view.iconType = SynopticNetworkCustomViewIconTypeDark;//图标样式
//    view.padding = UIEdgeInsetsMake(0, 0, 0, 0);//SynopticNetworkCustomView的内边距
//    view.backgroundColor = [UIColor redColor];//视图背景颜色
//    view.contentViewBackgroundImage = [UIImage imageNamed:@""];//视图背景图片
//    view.navigationBarBackgroundColor = [UIColor redColor];//导航条背景颜色
//    view.progressColor = [UIColor blueColor];//进度条颜色
//    view.textColor = [UIColor greenColor];//文字颜色
//    view.dragEnable = YES;//是不是能拖曳
//    view.freeRect = CGRectMake(0, 0, 0, 0);//拖拽范围
//    view.dragDirection = SynopticNetworkCustomViewDragDirectionAny;//拖拽的方向
//    view.isKeepBounds = YES;//黏贴边界效果
//    //2.4 将插件视图添加到需要显示的视图上
//    [self.view addSubview:view];
    
    
    [self.view addSubview:self.webView];
    //可返回的页面列表, 存储已打开过的网页
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://apip.weatherdt.com/h5.html?id=RTqcu81vlw"]];
    [_webView loadRequest:request];
}

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        // UI代理
        _webView.UIDelegate = self;
        // 导航代理
        _webView.navigationDelegate = self;
               // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
        _webView.allowsBackForwardNavigationGestures = YES;
        //页面后退
        [_webView goBack];
        //页面前进
        [_webView goForward];
        //刷新当前页面
        [_webView reload];
    }
    return _webView;
}

@end
