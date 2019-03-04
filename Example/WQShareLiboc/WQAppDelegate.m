//
//  WQAppDelegate.m
//  WQShareLiboc
//
//  Created by huwenqiang on 02/27/2019.
//  Copyright (c) 2019 huwenqiang. All rights reserved.
//

#import "WQAppDelegate.h"
#import <WQShareLiboc/WQSinaShareHelper.h>
//#import <WQShareLiboc/WQWeCha>

#define WEIBO_APPKEY @"782556629"
#define WECHAT_APPKEY @"wx575ca3588cc6f19e"

@implementation WQAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [WQSinaShareHelper initSinaWeiBo:WEIBO_APPKEY isDebug:YES];
//    [WQWeChatHelper initWechat:WECHAT_APPKEY];
    
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
    if ([url.absoluteString containsString:[NSString stringWithFormat:@"wb%@",WEIBO_APPKEY]]) {
        
    }
        return YES;
}
    
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation {
    if ([url.absoluteString containsString:[NSString stringWithFormat:@"wb%@",WEIBO_APPKEY]]) {
        
    }
    return YES;
}

@end
