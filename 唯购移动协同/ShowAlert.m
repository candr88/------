//
//  ShowAlert.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShowAlert.h"
@interface ShowAlert ()//私有方法不能被外部调用
+(void) misAlert:(UIAlertView *)alert;
@end
@implementation ShowAlert
+(void)showAlert:(NSString *)title :(NSString *)message
{
    UIAlertView *showAlert=[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [showAlert show];
    [showAlert release];

}
+(void)disMissAlert:(NSString *)title :(NSString *)message
{
    UIAlertView *showAlert=[[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    [showAlert show];
    
    [self performSelector:@selector(misAlert:) withObject:showAlert afterDelay:1.0f];
    
}
+(void)misAlert:(UIAlertView *)alert
{
    if (alert) 
    {
        [alert dismissWithClickedButtonIndex:[alert cancelButtonIndex] animated:YES];
        [alert release];
        //表示alert已经被触碰。。。就可以消失了
    }
}
@end
