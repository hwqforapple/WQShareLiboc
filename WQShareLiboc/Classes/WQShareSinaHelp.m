//
//  WQShareSinaHelp.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/4.
//

#import "WQShareSinaHelp.h"
@interface WQShareSinaHelp()<WeiboSDKDelegate>

@end

@implementation WQShareSinaHelp

+ (void)initSinaWeiBo:(NSString *)appKey isDebug:(BOOL)debug {
    [WeiboSDK registerApp:appKey];
    [WeiboSDK enableDebugMode:YES];
}

+ (BOOL)shareToSinaWeiBo:(NSString *)content images:(NSArray *)images shareToStory:(BOOL)isShareToStory {
    if ([WeiboSDK isWeiboAppInstalled]) {
        WBMessageObject *wbmsg = [[WBMessageObject alloc] init];
        wbmsg.text = content;
        WBImageObject* obj = [WBImageObject object];
        obj.isShareToStory = isShareToStory;
        [obj addImages:images];
        wbmsg.imageObject = obj;
        WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:wbmsg];
        [WeiboSDK sendRequest:request];
        return YES;
    }
    return NO;
}

+ (BOOL)handleUrl:(NSURL *)url delegate:(id<WeiboSDKDelegate>)delegate {
    return [WeiboSDK handleOpenURL:url delegate:delegate];
}


+ (void)handleBackData {
    
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}
    
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    
}
    
    @end
