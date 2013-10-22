//
//  WriteLetterInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface WriteLetterInfoViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,LIExposeControllerChildViewControllerDelegate,UITextFieldDelegate>
@property(nonatomic,retain)IBOutlet UITableView *receiverTable;//联系人图表
@property(nonatomic,retain)NSMutableArray * staffInfoArray;
@property(nonatomic,retain)NSMutableArray *flagArray;
@property(nonatomic,retain)IBOutlet UITextField *receviceTxt;//接收者的姓名
@property(nonatomic,retain)IBOutlet UITextField *titletTxt;//标题
@property(nonatomic,retain)IBOutlet UITextView *mainTextTxt;//正文内容
@property(nonatomic,retain)IBOutlet UILabel *errorLb;//错误信息提醒
@property(nonatomic,retain)NSString *receviceIds;//接受的ID

/*发送信息*/
-(IBAction)sendLetter:(id)sender;
-(void)sendLtrToWeb;//调用接口发送信件
/*数据处理*/
-(void)writeLtrDataProcessing;

/*树状菜单的显示*/
-(int)numberCountOfSection:(NSInteger)section;
-(void)btnClick:(id)sender;//段头按钮点击响应事件

/*消除键盘*/
-(IBAction)clickBg:(id)sender;
@end
