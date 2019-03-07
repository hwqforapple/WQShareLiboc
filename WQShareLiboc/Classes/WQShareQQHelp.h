//
//  WQShareQQHelp.h
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WQShareQQHelp : NSObject

+ (instancetype)shareQQHelp;

- (void)initQQ:(NSString *)appId;

- (void)shareText:(NSString *)content;

- (void)shareWeburl:(NSString *)url title:(NSString *)title description:(NSString *)description previewImageUrl:(NSString *)previewImageUrl;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation NS_DEPRECATED_IOS(4_2, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED;

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

@end

NS_ASSUME_NONNULL_END
