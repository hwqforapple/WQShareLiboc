//
//  WQViewController.m
//  WQShareLiboc
//
//  Created by huwenqiang on 02/27/2019.
//  Copyright (c) 2019 huwenqiang. All rights reserved.
//

#import "WQViewController.h"
#import <WQShareLiboc/WQSinaShareHelper.h>
//#import <WQShareLiboc/>

@interface WQViewController ()
@property (weak, nonatomic) UIButton *shareButton;
@property (weak, nonatomic) UIButton *wechatButton;
@end

@implementation WQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.shareButton.frame = CGRectMake(0, 0, 200, 50);
    self.shareButton.center = self.view.center;
    self.wechatButton.frame = CGRectMake(0, 0, 200, 50);
    self.wechatButton.center = CGPointMake(self.view.center.x, self.view.center.y + 60);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (UIButton *)shareButton {
    if (_shareButton == nil) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundColor:[UIColor purpleColor]];
        [button setTitle:@"分享到微博" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(shareToWeiBo) forControlEvents:UIControlEventTouchUpInside];
        _shareButton = button;
        [self.view addSubview:_shareButton];
    }
    return _shareButton;
}


    
- (void)shareToWeiBo {
    //com.6shitu.res.WQTestSina
   BOOL isShare = [WQSinaShareHelper shareToSinaWeiBo:@"http://6shitu.com/2019/02/28/1753/" singleImage:[UIImage imageNamed:@"6shitu-sucai22810"]];
    if (!isShare) {
        NSLog(@"未安装微博客户端");
    }
}


- (UIButton *)wechatButton {
    if (_wechatButton == nil) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundColor:[UIColor purpleColor]];
        [button setTitle:@"分享到微信" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(shareToWechat) forControlEvents:UIControlEventTouchUpInside];
        _wechatButton = button;
        [self.view addSubview:_wechatButton];
    }
    return _wechatButton;
}

- (void)shareToWechat {
    
}
@end
