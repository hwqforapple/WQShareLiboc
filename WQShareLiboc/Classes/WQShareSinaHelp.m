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

+ (BOOL)shareToSinaWeiBo:(NSString *)content singleImage:(UIImage *)image {
    if ([WeiboSDK isWeiboAppInstalled]) {
        WBMessageObject *wbmsg = [[WBMessageObject alloc] init];
        wbmsg.text = content;
        WBImageObject *wbImage = [[WBImageObject alloc] init];
        NSData *imageData = UIImagePNGRepresentation(image);
        wbImage.imageData = imageData;
        wbmsg.imageObject = wbImage;
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

@end
