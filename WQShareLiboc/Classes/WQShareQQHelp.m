//
//  WQShareQQHelp.m
//  Pods-WQShareLiboc_Example
//
//  Created by huwenqiang on 2019/3/5.
//

#import "WQShareQQHelp.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "WQShareHUD.h"

@interface WQShareQQHelp()<TencentSessionDelegate,QQApiInterfaceDelegate>

@end

@implementation WQShareQQHelp

+ (instancetype)shareQQHelp {
    static dispatch_once_t onceToken;
    static WQShareQQHelp *stance = nil;
    dispatch_once(&onceToken, ^{
        stance = [[WQShareQQHelp alloc] init];
    });
    return stance;
}

- (void)initQQ:(NSString *)appId {
//   TencentOAuth *tencentOAuth =
    [[TencentOAuth alloc] initWithAppId:appId andDelegate:self];
//    NSArray *permissions = [NSArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo", @"add_t", nil];
//    [tencentOAuth authorize:permissions inSafari:NO];

                           
}

- (void)tencentDidLogin {
    NSLog(@" 登录完成");
}

- (void)tencentDidNotLogin:(BOOL)cancelled {
    NSLog(@" %s",__func__);
}

- (void)tencentDidNotNetWork {
    NSLog(@" %s",__func__);
}

- (void)shareText:(NSString *)content {
    QQApiTextObject *txtObj = [QQApiTextObject objectWithText:content];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:txtObj];
    //将内容分享到qq
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

- (void)shareWeburl:(NSString *)url title:(NSString *)title description:(NSString *)description previewImageUrl:(NSString *)previewImageUrl {
    QQApiNewsObject *newsObj = [QQApiNewsObject
                                objectWithURL:[NSURL URLWithString:url]
                                title:title
                                description:description
                                previewImageURL:[NSURL URLWithString:previewImageUrl]];
    SendMessageToQQReq *req = [SendMessageToQQReq reqWithContent:newsObj];
    //将内容分享到qq
    QQApiSendResultCode sent = [QQApiInterface sendReq:req];
    [self handleSendResult:sent];
}

- (void)handleSendResult:(QQApiSendResultCode)sendResult
{
    switch (sendResult)
    {
        case EQQAPIAPPNOTREGISTED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"App未注册" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPIMESSAGECONTENTINVALID:
        case EQQAPIMESSAGECONTENTNULL:
        case EQQAPIMESSAGETYPEINVALID:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"发送参数错误" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPIQQNOTINSTALLED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"未安装手Q" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPIQQNOTSUPPORTAPI:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"手Q API接口不支持" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPISENDFAILD:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"发送失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPIQZONENOTSUPPORTTEXT:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"空间分享不支持QQApiTextObject，请使用QQApiImageArrayForQZoneObject分享" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPIQZONENOTSUPPORTIMAGE:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"空间分享不支持QQApiImageObject，请使用QQApiImageArrayForQZoneObject分享" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPIVERSIONNEEDUPDATE:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"当前QQ版本太低，需要更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case ETIMAPIVERSIONNEEDUPDATE:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"当前TIM版本太低，需要更新" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPITIMNOTINSTALLED:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"未安装TIM" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPITIMNOTSUPPORTAPI:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"TIM API接口不支持" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
            break;
        }
        case EQQAPISHAREDESTUNKNOWN:
        {
            UIAlertView *msgbox = [[UIAlertView alloc] initWithTitle:@"Error" message:@"未指定分享到QQ或TIM" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil];
            [msgbox show];
        }
            break;
        default:
        {
            break;
        }
    }
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [QQApiInterface handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    return [QQApiInterface handleOpenURL:url delegate:self];
}


- (void)isOnlineResponse:(NSDictionary *)response {
    
}

- (void)onReq:(QQBaseReq *)req {
    NSLog(@"%s",__func__);
}

- (void)onResp:(QQBaseResp *)resp {
    if(resp.type == ESENDMESSAGETOQQRESPTYPE) {
        if ([resp.result isEqualToString:@"0"]) {
            [WQShareHUD showTips:@"分享成功"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"WQShareQQSucceed" object:nil];
        } else if ([resp.result isEqualToString:@"-4"]) {
            [WQShareHUD showTips:@"取消分享"];
        } else {
            [WQShareHUD showTips:@"分享失败"];
        }
    }
}

@end
