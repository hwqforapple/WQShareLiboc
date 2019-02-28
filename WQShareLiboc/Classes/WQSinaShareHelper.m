//
//  WQSinaShareHelper.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/2/27.
//

#import "WQSinaShareHelper.h"
#import <Weibo_SDK/WeiboSDK.h>

@implementation WQSinaShareHelper
    
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
    
 
    @end
