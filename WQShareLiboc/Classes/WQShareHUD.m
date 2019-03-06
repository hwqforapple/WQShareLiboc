//
//  WQShareHUD.m
//  MBProgressHUD
//
//  Created by huwenqiang on 2019/3/6.
//

#import "WQShareHUD.h"
#import <MBProgressHUD.h>

@implementation WQShareHUD
    
+ (void)showTips:(NSString *)tips {
    UIApplication *application = UIApplication.sharedApplication;
    UIWindow *window = [application keyWindow];
    if([application.delegate respondsToSelector:@selector(window)]) {
        window = [application.delegate window];
    }
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    hud.mode = MBProgressHUDModeText;
    [hud removeFromSuperViewOnHide];
    hud.label.text = tips;
    [hud setOffset:CGPointMake(hud.offset.x, window.frame.size.height*3/5)];
    [window addSubview:hud];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:1];
    
}
    
@end
