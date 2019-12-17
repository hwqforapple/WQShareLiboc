//
//  WQWechatHelp.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/4.
//

#import "WQWechatHelp.h"

@implementation WQWechatHelp

+ (void)initWechat:(NSString *)appKey universalLink:(NSString *)link {
    [WXApi registerApp:appKey universalLink:link];
}

+ (void)shareContent:(NSString *)content {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.text = content;
    req.scene = WXSceneSession;
    [WXApi sendReq:req completion:^(BOOL success) {
        if (success) {
            
        } else {
            
        }
    }];
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
    thumbImage = [self compressImage:thumbImage toByte:27*1024];
    [message setThumbImage:thumbImage];
    message.mediaObject = webobject;
    [self sendMessage:message shareType:type];
    return  WQShareReturnTypeSucceed;
}

+ (UIImage *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength) return image;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    UIImage *resultImage = [UIImage imageWithData:data];
    if (data.length < maxLength) return resultImage;
    
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return resultImage;
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
    [WXApi sendReq:req completion:^(BOOL success) {
        if (success) {
            
        } else {
            
        }
    }];
}
@end
