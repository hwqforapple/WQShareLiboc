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

@end

NS_ASSUME_NONNULL_END
