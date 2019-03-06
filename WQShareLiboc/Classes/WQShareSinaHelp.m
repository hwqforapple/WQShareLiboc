//
//  WQShareSinaHelp.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/4.
//

#import "WQShareSinaHelp.h"
@interface WQShareSinaHelp()<WeiboSDKDelegate,WBMediaTransferProtocol>
    
@property (strong, nonatomic) WBSendMessageToWeiboRequest *request;
    
@property (strong, nonatomic) WBMessageObject* message;
    
@end

@implementation WQShareSinaHelp

- (WBMessageObject *)message {
    if (_message == nil) {
        _message = [WBMessageObject message];
    }
    return _message;
}
    
- (WBSendMessageToWeiboRequest *)request {
    if (_request == nil) {
        _request = [WBSendMessageToWeiboRequest requestWithMessage:self.message];
    }
    return _request;
}

+ (instancetype)shareHelp {
    static dispatch_once_t onceToken;
    static WQShareSinaHelp* instance;
    dispatch_once(&onceToken, ^{
        instance = [[WQShareSinaHelp alloc] init];
    });
    return instance;
}
    
+ (void)initSinaWeiBo:(NSString *)appKey isDebug:(BOOL)debug {
    [WeiboSDK registerApp:appKey];
    [WeiboSDK enableDebugMode:YES];
}

- (BOOL)shareToSinaText:(NSString *)content {
    if ([WeiboSDK isWeiboAppInstalled]) {
        self.message.text = content;
        [WeiboSDK sendRequest:self.request];
        return YES;
    }
     return NO;
}
    
- (BOOL)shareToSinaWeiBo:(NSString *)content images:(NSArray *)images shareToStory:(BOOL)isShareToStory {
    if ([WeiboSDK isWeiboAppInstalled]) {
        WBImageObject* obj = [WBImageObject object];
        obj.imageData = nil;
        obj.delegate = self;
        obj.isShareToStory = isShareToStory;
        [obj addImages:images];
        self.message.imageObject = obj;
        self.message.text = content;
        return YES;
    }
    return NO;
}

+ (BOOL)handleUrl:(NSURL *)url delegate:(id<WeiboSDKDelegate>)delegate {
    return [WeiboSDK handleOpenURL:url delegate:delegate];
}


+ (void)handleBackData {
    
}

- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}
    
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    self.request = nil;
    self.message = nil;
}
    
- (void)wbsdk_TransferDidFailWithErrorCode:(WBSDKMediaTransferErrorCode)errorCode andError:(NSError *)error {
    
}
    
- (void)wbsdk_TransferDidReceiveObject:(id)object {
      [WeiboSDK sendRequest:self.request];
}
    
    @end
