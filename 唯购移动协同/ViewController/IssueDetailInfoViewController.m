//
//  IssueDetailInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "IssueDetailInfoViewController.h"
@implementation IssueDetailInfoViewController
@synthesize webView,issueId,processView;
@synthesize dropDownList,processAttitudeTxt,btnArray,errorLb;
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.navigationItem.rightBarButtonItem==nil)
    {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
                                                   initWithTitle:NSLocalizedString(@"审批", @"审批")
                                                   style:UIBarButtonItemStyleBordered
                                                   target:self
                                                   action:@selector(addProcessViewToView)] autorelease];
        
    }
    self.processAttitudeTxt.text=@"";
    self.processView.alpha=0.0f;//把审批界面隐藏
    [self addWebViewToView];//添加webview
        // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)addWebViewToView//把webView添加到视图中
{
    if (self.webView ==nil&&self.issueId!=nil&&self.issueId.length!=0)//进行判断
    {
        NSString * issueUrl=[NSString stringWithFormat:@"http://wztx2007.gnway.net:8090/WorkFlow/WFShow?task_id=%@",issueId];//处理网址
        self.webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 500, 660)];
        NSURL *url= [[[NSURL alloc] initWithString:issueUrl] autorelease];//设置URl
        NSURLRequest *rqst= [[[NSURLRequest alloc] initWithURL:url] autorelease];
        [self.webView loadRequest:rqst];
        self.webView.backgroundColor=[UIColor clearColor];
        self.webView.scalesPageToFit= YES;
        self.webView.multipleTouchEnabled=YES;//
        [self.view addSubview:self.webView];
    }
 
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.issueId=nil;
    self.webView=nil;
    self.dropDownList=nil;
    self.processView=nil;
    self.processAttitudeTxt=nil;
    self.btnArray=nil;
    self.errorLb=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc
{
    [super dealloc];
    [issueId release];
    [webView release];
    [btnArray release];
    [processView release];
    [dropDownList release];
    [processAttitudeTxt release];
    [errorLb release];
}
#pragma mark -DoProcess
-(void)addProcessViewToView
{
    if (self.processView.alpha==0.0f)
    {
        self.processView.alpha=0.8f;
        self.processView.backgroundColor=[UIColor blackColor];
        [self.view addSubview:self.processView];
    }
    else
    {
        self.processView.alpha=0.0f;
    }
    /*数据的处理,把获取到Btn.text Ben.vale 进行操作*/
    NSString * nextBtn=[self getNextBtn];
    self.btnArray=[nextBtn componentsSeparatedByString:@","];
    NSMutableArray * btnTextArray=[[[NSMutableArray alloc]init]autorelease];
    for (int i=0; i<[btnArray count]-1; i++)//数据的处理
    {
        [btnTextArray addObject:[[[self.btnArray objectAtIndex:i]componentsSeparatedByString:@"@"]objectAtIndex:0]];
    }
    dropDownList=[[DropDownList alloc] initWithFrame:CGRectMake(93, 32, 210, 31)];
    self.dropDownList.list=(NSArray*)btnTextArray;//下拉列表的数据
    [self.processView addSubview:self.dropDownList];//把列表添加到proccess界面
}
-(IBAction)doProcess:(id)sender//进行审批
{
    //NSLog(@"%@", self.dropDownList.textField.text);
    NSString * btnText=self.dropDownList.textField.text;
    if (btnText.length==0)//保护措施
    {
        errorLb.text=@"请选择审批意见";
        errorLb.textColor=[UIColor redColor];
        return;
    }
    NSString * btnVale=[[NSString alloc]init];
    for (int i=0; i<[self.btnArray count]-1; i++)//通过判断获取BtnVale的值
    {
        if ([btnText isEqualToString:[[[self.btnArray objectAtIndex:i]componentsSeparatedByString:@"@"]objectAtIndex:0]])
        {
            btnVale=[[[self.btnArray objectAtIndex:i]componentsSeparatedByString:@"@"] objectAtIndex:1];//这是Btn vale
        }
    }
    NSString *lTmp = [NSString stringWithFormat:@"%s"," "];
    NSString  *dicStr=[btnVale stringByReplacingOccurrencesOfString:lTmp withString:@""];
    btnVale=dicStr;
    //NSLog(@"%d",btnVale.length);
    NSString *clristTmp=[self getCLrList:btnVale];//获取处理人list
    //NSLog(@"%@%@%@",clristTmp,btnVale,btnText);
    [self approvalIssue:clristTmp :btnText :btnVale];
    [btnText release];
   

}
#pragma mark -WebSerVice
-(NSString *)getNextBtn//获取审批意见,即获取
{
    NSString * nextStepInfo=[[[NSString alloc] init] autorelease];
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetNextStep *request=[[MyService_GetNextStep alloc]init];
    request.task_id=self.issueId;
    MyServiceSoapBindingResponse* resp=[binding GetNextStepUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetNextStepResponse class]]) 
        {
            nextStepInfo=[mine GetNextStepResult];
        }
    }
    return nextStepInfo;
}
-(NSString*)getCLrList:(NSString *)attitude//解释见定义....(太长了)
{//attitude是审批的意见
    NSString * clrListTmp=[[[NSString alloc]init]autorelease];
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetClrList *request=[[[MyService_GetClrList alloc]init]autorelease];
    request.task_id=self.issueId;
    request.processvalue=attitude;
    MyServiceSoapBindingResponse *resp=[binding GetClrListUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetClrListResponse class]])
        {
            clrListTmp=[mine GetClrListResult];
        }
    }
    return clrListTmp;
}
-(void)approvalIssue:(NSString*)clrid:(NSString*)btnTxt:(NSString*)btnValue//调用接口进行审批
{
    NSString *doProcess;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_DoProcess *request=[[[MyService_DoProcess alloc]init]autorelease];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.task_id=issueId;
    request.processvalue=btnValue;
    request.processname=btnTxt;
    request.processclyj=@"";
    request.clrids=clrid;
    MyServiceSoapBindingResponse *resp=[binding DoProcessUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_DoProcessResponse class]]) 
        {
            doProcess=[mine DoProcessResult];
        }
    }
    if (doProcess.length==0||doProcess==nil||[doProcess isEqualToString:@"false"])
    {
        [ShowAlert showAlert:@"失败了" :@"审批失败了"];
    }
    else
    {
        [ShowAlert showAlert:@"成功了" :@"成功审批"];
        /*设置图标上面的数字*/
        int iconVale=[[UIApplication sharedApplication]applicationIconBadgeNumber];
        iconVale--;
        [[UIApplication sharedApplication]setApplicationIconBadgeNumber:iconVale];
        [self.navigationController popViewControllerAnimated:YES];//跳转回上个界面
    
    }
}
@end
