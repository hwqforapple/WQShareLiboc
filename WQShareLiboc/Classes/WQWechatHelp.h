//
//  WQWechatHelp.h
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/4.
//

#import <Foundation/Foundation.h>
#import <WechatOpenSDK/WXApi.h>

typedef enum : NSUInteger {
    WQShareReturnTypeImageSize,//图片尺寸过大
    WQShareReturnTypeThumbImageSizeError,//缩略图尺寸过大
    WQShareReturnTypeTitle,//title不能为空
    WQShareReturnTypeURLError,//分享网址不能为空且长度不能超过10K
    WQShareReturnTypeDescription,//description长度不能超过1K
    WQShareReturnTypeSucceed,//数据成功通过
} WQShareReturnType;

NS_ASSUME_NONNULL_BEGIN

@interface WQWechatHelp : NSObject

+ (void)initWechat:(NSString *)appKey;

@end

NS_ASSUME_NONNULL_END
