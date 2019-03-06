//
//  WQShareSinaHelp.h
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/4.
//

#import <Foundation/Foundation.h>
#import <Weibo_SDK/WeiboSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface WQShareSinaHelp : NSObject


/**
 初始化新浪微博参数
 
 @param appKey 新浪微博开放平台对应的App Key
 @param debug 是否开启debug调试
 */
+ (void)initSinaWeiBo:(NSString *)appKey isDebug:(BOOL)debug;

+ (instancetype)shareHelp;
    
/**
 分享单独文字内容

 @param content 文字内容
 @return 分享数据是否通过
 */
- (BOOL)shareToSinaText:(NSString *)content;
 
    
/**
 分享多图片

 @param content 文字内容
 @param images 图片数组【1-9】
 @param isShareToStory 是否分享到故事
 @return 分享数据是否通过
 */
- (BOOL)shareToSinaWeiBo:(NSString *)content images:(NSArray *)images shareToStory:(BOOL)isShareToStory;

+ (BOOL)handleUrl:(NSURL *)url delegate:(id<WeiboSDKDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
