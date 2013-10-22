//
//  ViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"

@interface LoginViewController : UIViewController<LIExposeControllerDelegate,LIExposeControllerDataSource>
{
    IBOutlet UITextField *actTxt;
    IBOutlet UITextField *psdTxt;//密码和账号输入框
    IBOutlet UILabel *infoRemindLb;//消息提醒框
}
-(IBAction)doLogin:(id)sender;//点击进行登陆
-(IBAction)clickBg:(id)sender;//消除键盘
-(void)loginSucced;//登陆成功
-(void)loginFailed;//登陆失败 

@end
