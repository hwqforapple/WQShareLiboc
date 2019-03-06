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

+ (BOOL)shareToSinaWeiBo:(NSString *)content images:(NSArray *)images shareToStory:(BOOL)isShareToStory;

+ (BOOL)handleUrl:(NSURL *)url delegate:(id<WeiboSDKDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
