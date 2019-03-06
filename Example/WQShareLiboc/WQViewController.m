//
//  WQViewController.m
//  WQShareLiboc
//
//  Created by hwqforapple@163.com on 03/04/2019.
//  Copyright (c) 2019 hwqforapple@163.com. All rights reserved.
//

#import "WQViewController.h"
#import <WQShareLiboc/WQShareHelp.h>

@interface WQViewController ()

@property (weak, nonatomic) UIButton *wechatButton;
@property (weak, nonatomic) UIButton *sinaButton;

@end

@implementation WQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.wechatButton.frame = CGRectMake(0, 0, 200, 50);
    self.wechatButton.center = self.view.center;
    self.sinaButton.frame = CGRectMake(0, 0, 200, 50);
    self.sinaButton.center = CGPointMake(self.view.center.x, self.view.center.y + 70);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)wechatButton {
    if (_wechatButton == nil) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundColor:[UIColor purpleColor]];
        [button setTitle:@"分享到微信" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(shareToWeChat) forControlEvents:UIControlEventTouchUpInside];
        _wechatButton = button;
        [self.view addSubview:_wechatButton];
    }
    return _wechatButton;
}

- (void)shareToWeChat {
    WQShareReturnType type = [WQWechatHelp shareImage:[UIImage imageNamed:@"6shitu-bizhi324"] thumbData:[UIImage imageNamed:@"6shitu-bizhi324thu"] shareType:WQShareTypeChat];
//    [WQWechatHelp shareWeb:@"http://6shitu.com" title:@"6视图网-高清壁纸图片素材下载站" description:@"免费高清素材下载,美女高清壁纸下载" thumbImage:[UIImage imageNamed:@"6shitu-bizhi324"] shareType:WQShareTypeChat];
    switch (type) {
        case WQShareReturnTypeThumbImageSizeError:
            {
                NSLog(@"缩略图尺寸不对");
            }
            break;
            
        default:
            break;
    }
}
    
- (UIButton *)sinaButton {
    if (_sinaButton == nil) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundColor:[UIColor purpleColor]];
        [button setTitle:@"分享到微博" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(shareToSina) forControlEvents:UIControlEventTouchUpInside];
        _sinaButton = button;
        [self.view addSubview:_sinaButton];
    }
    return _sinaButton;
}
    
- (void)shareToSina {
    [[WQShareSinaHelp shareHelp] shareToSinaWeiBo:@"高清图片资源站-http://www.6shitu.com" images:@[[UIImage imageNamed:@"6shitu-bizhi324thu"],[UIImage imageNamed:@"6shitu-bizhi324thu"]] shareToStory:NO];
}
    
@end
