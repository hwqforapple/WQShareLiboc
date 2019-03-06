//
//  WQWXApiManager.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/5.
//

#import "WQWXApiManager.h"
#import <MBProgressHUD.h>
#define IS_IPHONE_X (IS_IOS_11 && IS_IPHONE && (MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 375 && MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) >= 812))


@implementation WQWXApiManager

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
     static WQWXApiManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[WQWXApiManager alloc] init];
    });
    return instance;
}

- (void)onReq:(BaseReq *)req {
    NSLog(@"%s",__func__);
}

- (void)onResp:(BaseResp *)resp {
    //微信调整后 分享事件一律返回为成功 不再区别失败和取消
    if(![resp isKindOfClass:[SendMessageToWXResp class]]){
        //分享事件后回到本应用
        [[NSNotificationCenter defaultCenter] postNotificationName:@"WQWeChatShareBackToApp" object:nil];
    }
}

@end
