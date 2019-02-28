//
//  WQSinaShareHelper.h
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/2/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WQSinaShareHelper : NSObject

/**
 初始化新浪微博参数

 @param appKey 新浪微博开放平台对应的App Key
 @param debug 是否开启debug调试
 */
+ (void)initSinaWeiBo:(NSString *)appKey isDebug:(BOOL)debug;

+ (BOOL)shareToSinaWeiBo:(NSString *)content singleImage:(UIImage *)image;
    
@end

NS_ASSUME_NONNULL_END
