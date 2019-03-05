//
//  WQWXApiManager.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/5.
//

#import "WQWXApiManager.h"

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
    if(![resp isKindOfClass:[SendMessageToWXResp class]]) return;
    NSLog(@"%d",resp.errCode);
    switch (resp.errCode) {
        case 0:{
            NSLog(@"分享成功");
        }
        default:
        {
            NSLog(@"分享失败");
        }
            break;
    }
    
}

@end
