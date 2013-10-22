//
//  ViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "ShowAlert.h"
#import "MyService.h"
#import "GlobalVar.h"
#import "InvokeWebService.h"
#import "LoginViewController.h"
#import "EntrustViewController.h"
#import "StorageViewController.h"
#import "IssueInfoViewController.h"
#import "StaffInfoViewController.h"
#import "OwnSelfInfoViewController.h"
#import "SendLetterInfoViewController.h"
#import "WriteLetterInfoViewController.h"
#import "ReceiveLetterInfoViewController.h"
#import "ApprovalIssueInfoViewController.h"
#import "CollectLetterInfoViewController.h"
#import "ApplicationHistotyIssueViewController.h"
@implementation LoginViewController
NSString * const ADD_BUTTON_IMAGE = @"add.png";
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_Iphone"]];//设置背景图片
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else 
    {
        return YES;
    }
}
-(void)dealloc//内存清理
{
    [super dealloc];
    [psdTxt release];
    [actTxt release];
}
#pragma mark  DoLogin
-(IBAction)clickBg:(id)sender//消除键盘
{
    [actTxt resignFirstResponder];
    [psdTxt resignFirstResponder];
}
-(IBAction)doLogin:(id)sender//进行登陆
{
    infoRemindLb.alpha=0.0f;//每次登陆前将错误提示隐藏
    if (actTxt.text.length==0) 
    {
        infoRemindLb.text=@"用户名为空";
        infoRemindLb.alpha=1.0f;//alpha显示透明度,显示错误提示
        infoRemindLb.textColor=[UIColor redColor];
        return;
    }
    if (psdTxt.text.length==0) 
    {
        infoRemindLb.text=@"密码为空";
        infoRemindLb.alpha=1.0f;//显示错误提示
        infoRemindLb.textColor=[UIColor redColor];
        return;
    }//保护程序
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding ] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];//进行连接
    binding.logXMLInOut=YES;//允许访问数据.很终要
    MyService_Login *request=[[MyService_Login alloc] init];//创建请求
    [[GlobalVar shareGlobalVar]setLoginId:actTxt.text];//把ID传给全局变量
    request.loginid=actTxt.text;//传值
    request.loginpsw=psdTxt.text;
    USBoolean *rsStr;
    MyServiceSoapBindingResponse *resp=[binding LoginUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_LoginResponse class]]) 
        {
            rsStr=[mine LoginResult];
        }
    }
    if ([[rsStr stringValue]isEqualToString:@"true"])
    {
        [self loginSucced];//成功登陆
    }   
    else
    {
        [self loginFailed];//登陆失败
    }
    [request release];//内存释放
}
-(void)loginFailed//登陆失败
{
    infoRemindLb.alpha=1.0f;
    infoRemindLb.textColor=[UIColor redColor];
    infoRemindLb.text=@"登陆失败,请检查密码和用户名";
}
#pragma mark - LIExposeControllerDelegate Methods

- (BOOL)canAddViewControllersForExposeController:(LIExposeController *)exposeController {
    return NO;
}

- (BOOL)exposeController:(LIExposeController *)exposeController canDeleteViewController:(UIViewController *)viewController {
    return NO;
}


#pragma mark - LIExposeControllerDataSource Methods

- (UIView *)backgroundViewForExposeController:(LIExposeController *)exposeController {
    UIView *v = [[[UIView alloc] initWithFrame:CGRectMake(0, 
                                                          0, 
                                                          exposeController.view.frame.size.width, 
                                                          exposeController.view.frame.size.height)] autorelease];
    v.backgroundColor = [UIColor whiteColor];
    return v;
}
/*
- (void)shouldAddViewControllerForExposeController:(LIExposeController *)exposeController {
    [exposeController addNewViewController:[self newViewControllerForExposeController:exposeController] 
                                  animated:YES];
}
*/
- (UIView *)addViewForExposeController:(LIExposeController *)exposeController {
    UIView *addView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:ADD_BUTTON_IMAGE]] autorelease];
    return addView;
}

- (UIView *)exposeController:(LIExposeController *)exposeController overlayViewForViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        viewController = [(UINavigationController *)viewController topViewController];
    }
    if ([viewController isKindOfClass:[UIViewController class]]) {
        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 
                                                                    0, 
                                                                    viewController.view.bounds.size.width, 
                                                                    viewController.view.bounds.size.height)] autorelease];
        label.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        //label.text = viewController.title;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:48];
        label.adjustsFontSizeToFitWidth = YES;
        label.shadowColor = [UIColor blackColor];
        label.shadowOffset = CGSizeMake(1, 1);
        return label;
    } else {
        return nil;
    }
}

- (UILabel *)exposeController:(LIExposeController *)exposeController labelForViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        viewController = [(UINavigationController *)viewController topViewController];
    }
    if ([viewController isKindOfClass:[UIViewController class]]) {
        UILabel *label = [[[UILabel alloc] init] autorelease];
        label.backgroundColor = [UIColor clearColor];
        label.text = viewController.title;
        label.textColor = [UIColor whiteColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:14];
        label.shadowColor = [UIColor blackColor];
        label.shadowOffset = CGSizeMake(1, 1);
        [label sizeToFit];
        CGRect frame = label.frame;
        frame.origin.y = 4;
        label.frame = frame;
        return label;
    } else {
        return nil;
    }
}

#pragma mark - mainView Methods
- (void)loginSucced//跳转到主界面
{
    infoRemindLb.alpha=0.0f;//消除错误显示
    /*做一些准备工作,获取现在服务器上的时间*/
    /*
    InvokeWebService *invokeWeb=[[InvokeWebService alloc]init];
    [invokeWeb getServceTime];
    [invokeWeb release];
     */
    /*添加界面*/
    LIExposeController *exposeController = [[[LIExposeController alloc] init] autorelease];
    exposeController.exposeDelegate = self;
    exposeController.exposeDataSource = self;
    //exposeController.editing = YES;
    
    //员工信息界面初始化
    StaffInfoViewController *staffViewCtr=[[StaffInfoViewController alloc] init];
    [staffViewCtr dataProcessing];
    UINavigationController *staffNavCtr=[[[UINavigationController alloc]initWithRootViewController:staffViewCtr]autorelease];
    //好友通讯录界面初始化
    OwnSelfInfoViewController *ownInfoViewCtr=[[OwnSelfInfoViewController alloc] init];
    UINavigationController *ownInfoNavCtr=[[[UINavigationController alloc]autorelease]initWithRootViewController:ownInfoViewCtr];
    //通讯录
    UITabBarController *addressBookTabCtr=[[[UITabBarController alloc]init]autorelease];
    addressBookTabCtr.title=@"通讯录";
    addressBookTabCtr.viewControllers=[[NSMutableArray alloc] 
                                       initWithObjects:                                         staffNavCtr,
                                           ownInfoNavCtr,
                                            nil];
    
    //委托界面
    EntrustViewController *entrustViewCtr=[[EntrustViewController alloc] init];
    entrustViewCtr.title=@"委托界面";
    UINavigationController *entrustNacVtr=[[[UINavigationController alloc] initWithRootViewController:entrustViewCtr]autorelease];
    
    //写信界面
    WriteLetterInfoViewController *writeLtrCtr=[[WriteLetterInfoViewController alloc] init];
    UINavigationController *writrLtrNavCtr=[[[UINavigationController alloc] initWithRootViewController:writeLtrCtr]autorelease];
    //处理审批
    IssueInfoViewController *issueInfoViewCtr=[[IssueInfoViewController alloc]init];
    UINavigationController *issueInfoNavCtr=[[[UINavigationController alloc] initWithRootViewController:issueInfoViewCtr]autorelease];
    
    //已发信息
    SendLetterInfoViewController *sendLtrViewCtr=[[SendLetterInfoViewController alloc] init];
    UINavigationController *sendLtrNavCtr=[[UINavigationController alloc]initWithRootViewController:sendLtrViewCtr];
    //已收信息
    ReceiveLetterInfoViewController*receiveViewCtr=[[ReceiveLetterInfoViewController alloc]init];
    UINavigationController * receiveNavCtr=[[UINavigationController alloc] initWithRootViewController:receiveViewCtr];
    //收藏信息
    CollectLetterInfoViewController *collectLtrCtr=[[CollectLetterInfoViewController alloc]init];
    UINavigationController *collectLtrNavCtr=[[UINavigationController alloc]initWithRootViewController:collectLtrCtr];
    
    UITabBarController * letterTabCtr=[[[UITabBarController alloc] init]autorelease];
    letterTabCtr.viewControllers=[[NSMutableArray alloc]
                                  initWithObjects:
                                  receiveNavCtr,
                                  sendLtrNavCtr,
                                  collectLtrNavCtr,
                                  nil];//站内信页面
    letterTabCtr.title=@"站内信";
    
    StorageViewController *storageViewCtr=[[StorageViewController alloc]init];
    UINavigationController *storageNavCtr=[[UINavigationController alloc]initWithRootViewController:storageViewCtr];
    storageViewCtr.title=@"网盘";
    exposeController.viewControllers = [NSMutableArray arrayWithObjects:
                                        letterTabCtr,
                                        issueInfoNavCtr,
                                        writrLtrNavCtr,
                                        addressBookTabCtr,
                                        entrustNacVtr,
                                        storageNavCtr,
                                        nil];
   
    
    [self presentModalViewController:exposeController animated:YES];//界面跳转
    /*内存释放*/
    [staffViewCtr release];
    [ownInfoViewCtr release];
    [entrustViewCtr release];
    [writeLtrCtr release];
    [issueInfoViewCtr release];
    [sendLtrViewCtr release];
    [sendLtrNavCtr release];
    [receiveNavCtr release];
    [receiveViewCtr release];
    [collectLtrCtr release];
    [collectLtrNavCtr release];
    [storageViewCtr release];
    [storageNavCtr release];
}


@end
