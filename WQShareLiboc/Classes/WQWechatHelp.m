//
//  WQWechatHelp.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/4.
//

#import "WQWechatHelp.h"

@implementation WQWechatHelp

+ (void)initWechat:(NSString *)appKey {
    [WXApi registerApp:appKey];
}

+ (void)shareContent:(NSString *)content {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.text = content;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
}

+ (WQShareReturnType)shareImage:(UIImage *)image thumbData:(UIImage *)thumbImage shareType:(WQShareType)type {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.7);
    WXImageObject *imageObject = [WXImageObject object];
    imageObject.imageData = imageData;
    WXMediaMessage *message = [WXMediaMessage message];
    NSData *thumbData = UIImageJPEGRepresentation(thumbImage, 0.7);
    if (thumbData.length > 32 * 1024) {
        return WQShareReturnTypeThumbImageSizeError;
    }
    message.thumbData = thumbData;
    message.mediaObject = imageObject;
    [self sendMessage:message shareType:type];
    return WQShareReturnTypeSucceed;
}

+ (WQShareReturnType)shareWeb:(NSString *)webUrl title:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)thumbImage shareType:(WQShareType)type {
    NSData *urlData = [webUrl dataUsingEncoding:NSUTF8StringEncoding];
    if (webUrl == nil || [webUrl isKindOfClass:[NSNull class]] || webUrl.length < 1|| urlData.length > 10*1024) {
        return WQShareReturnTypeURLError;
    }
    NSData *titleData = [title dataUsingEncoding:NSUTF8StringEncoding];
    if (title == nil || [title isKindOfClass:[NSNull class]] || title.length < 1|| titleData.length > 512) {
        return WQShareReturnTypeURLError;
    }
    WXWebpageObject *webobject = [WXWebpageObject object];
    webobject.webpageUrl = webUrl;
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    message.mediaObject = webobject;
    [self sendMessage:message shareType:type];
    return  WQShareReturnTypeSucceed;
}

/**发送媒体类消息*/
+ (void)sendMessage:(WXMediaMessage *)message shareType:(WQShareType)type {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    switch (type) {
        case WQShareTypeChat:
        { req.scene = WXSceneSession;}
            break;
        case WQShareTypeTimeLine:
        { req.scene = WXSceneTimeline;}
            break;
        case WQShareTypeCollection:
        { req.scene = WXSceneFavorite;}
            break;
        default:
             req.scene = WXSceneTimeline;
            break;
    }
    [WXApi sendReq:req];
}
@end
