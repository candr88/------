//
//  ShowAlert.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ShowAlert : NSObject
+(void)showAlert:(NSString *)title:(NSString *)message;
//用于消息确认的界面。。。（只有一个选项）
+(void)disMissAlert:(NSString *)title:(NSString*)message;//自动消失的界面
@end
