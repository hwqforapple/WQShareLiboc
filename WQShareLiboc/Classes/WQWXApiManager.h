//
//  WQWXApiManager.h
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/5.
//

#import <Foundation/Foundation.h>
#import <WXApi.h>

NS_ASSUME_NONNULL_BEGIN

@interface WQWXApiManager : NSObject<WXApiDelegate>

+ (instancetype)shareManager;

@end

NS_ASSUME_NONNULL_END
