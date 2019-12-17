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

typedef enum : NSUInteger {
    WQShareTypeChat,//聊天列表
    WQShareTypeTimeLine,//朋友圈
    WQShareTypeCollection,//收藏
} WQShareType;

NS_ASSUME_NONNULL_BEGIN

@interface WQWechatHelp : NSObject

+ (void)initWechat:(NSString *)appKey universalLink:(NSString *)link;

/**
 分享大图

 @param image t大图 <25M
 @param thumbImage 缩略图
 @param type 分享到朋友圈或者聊天列表或者收藏夹
 @return 返回失败的错误提示
 */
+ (WQShareReturnType)shareImage:(UIImage *)image thumbData:(UIImage *)thumbImage shareType:(WQShareType)type;
/**
 分享网页

 @param webUrl 网址链接
 @param title 标题
 @param description 描述信息
 @param thumbImage 缩略图
 @param type WQShareTypeChat - 聊天列表 ，WQShareTypeTimeLine-朋友圈
 @return 检测数据异常时候返回提示
 */
+ (WQShareReturnType)shareWeb:(NSString *)webUrl title:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)thumbImage shareType:(WQShareType)type;

@end

NS_ASSUME_NONNULL_END
