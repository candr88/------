//
//  IssueDetailInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DropDownList.h"

@interface IssueDetailInfoViewController : UIViewController
@property(nonatomic,retain)UIWebView *webView;
@property(nonatomic,retain)NSString *issueId;//委托的Id用于显示独一无二的网页
@property(nonatomic,retain)DropDownList *dropDownList;//下拉列表
@property(nonatomic,retain)IBOutlet UIView *processView;//进行审批的界面
@property(nonatomic,retain)IBOutlet UITextField *processAttitudeTxt;//处理意见的文本框 
@property(nonatomic,retain) NSArray *btnArray;//处理一件存储的地方
@property(nonatomic,retain)IBOutlet UILabel *errorLb;//错误信息提示框
/*进行审批*/
-(NSString*)getNextBtn;//获取下一步的按钮的值
-(NSString*)getCLrList:(NSString *)attitude;
//获取不同操作方式对应的处理人(就是根据不同的审批意见来返回不同的处理人)

-(IBAction)doProcess:(id)sender;//继续审批
-(void)approvalIssue:(NSString*)clrid:(NSString*)btnTxt:(NSString*)btnValue;
//调用接口进行审批

/*把webView添加到界面中*/
-(void)addWebViewToView;

/*把审批的界面添加到界面中*/
-(void)addProcessViewToView;

@end
