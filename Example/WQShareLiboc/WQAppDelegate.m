//
//  WQAppDelegate.m
//  WQShareLiboc
//
//  Created by hwqforapple@163.com on 03/04/2019.
//  Copyright (c) 2019 hwqforapple@163.com. All rights reserved.
//

#import "WQAppDelegate.h"
#import <WQShareLiboc/WQShareHelp.h>

#define SINA_APPKEY @"782556629"
#define WECHAT_APPKEY @"wx3a78c50d9fbb1970"
#define QQ_APPID @"101558092"

@implementation WQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [WQShareSinaHelp initSinaWeiBo:SINA_APPKEY isDebug:YES];
    [WQWechatHelp initWechat:WECHAT_APPKEY universalLink:@""];
    [[WQShareQQHelp shareQQHelp] initQQ:QQ_APPID];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    if ([url.absoluteString containsString:WECHAT_APPKEY]) {
        [WXApi handleOpenURL:url delegate:[WQWXApiManager shareManager]];
        return YES;
    } else if ([url.absoluteString containsString:QQ_APPID]) {
        return [[WQShareQQHelp shareQQHelp] application:app openURL:url options:options];
    }
    [[WQShareSinaHelp shareHelp] application:app openURL:url options:options];
    return YES;
}
    
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([url.absoluteString containsString:WECHAT_APPKEY]) {
        [WXApi handleOpenURL:url delegate:[WQWXApiManager shareManager]];
        return YES;
    } else if ([url.absoluteString containsString:QQ_APPID]) {
        
        return [[WQShareQQHelp shareQQHelp] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    }
    return [[WQShareSinaHelp shareHelp] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    return YES;
}
@end
