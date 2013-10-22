//
//  WriteLetterInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "WriteLetterInfoViewController.h"
@implementation WriteLetterInfoViewController
@synthesize receiverTable;
@synthesize titletTxt;
@synthesize mainTextTxt;
@synthesize receviceIds;
@synthesize receviceTxt;
@synthesize errorLb;
@synthesize flagArray=_flagArray;
@synthesize staffInfoArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.title=@"写信";
        // Custom initialization
    }
    return self;
}

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
                                                   initWithTitle:NSLocalizedString(@"回到主界面", @"回到主界面")
                                                   style:UIBarButtonItemStyleBordered
                                                   target:self.navigationController.exposeController
                                                   action:@selector(toggleExpose)] autorelease];
    }
    [self writeLtrDataProcessing];//数据的处理
    // Do any additional setup after loading the view from its nib.
}
-(void)writeLtrDataProcessing
{
    self.staffInfoArray=[[NSMutableArray alloc]init];
    self.staffInfoArray=[[GlobalVar shareGlobalVar]staffInfoArray];//数据的传递
    //NSLog(@"%d",[[[GlobalVar shareGlobalVar]staffInfoArray] count]);
    _flagArray=[[NSMutableArray alloc] init];//用于树状菜单的展开和收缩
	for (int i=0; i<[self.staffInfoArray count]; i++) 
    {
		[_flagArray addObject:[NSNumber numberWithInt:1]];
	}
    self.errorLb.textColor=[UIColor redColor];
    receviceIds=[[NSString alloc] init];
    self.mainTextTxt.layer.borderColor=[[UIColor grayColor]CGColor];
    self.mainTextTxt.delegate=self;
    self.mainTextTxt.layer.borderWidth=2.0f;//跟文本款加上边框
    self.titletTxt.text=@"";//数据的初始化
    self.mainTextTxt.text=@"";
    self.receviceTxt.text=@"";
    self.receviceTxt.delegate=self;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.receviceIds=nil;
    self.receviceTxt=nil;
    self.titletTxt=nil;
    self.mainTextTxt=nil;
    self.receiverTable=nil;
    self.staffInfoArray=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)dealloc
{
    [super dealloc];
    [receviceIds release];
    [receviceTxt release];
    [titletTxt release];
    [mainTextTxt release];
    [receiverTable release];
    [staffInfoArray release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark-SendLettr
-(IBAction)sendLetter:(id)sender
{
    if (self.receviceTxt.text.length==0)
    {
        self.errorLb.text=@"联系人不能为空";
        return;
    }
    if (self.titletTxt.text.length==0)
    {
        self.errorLb.text=@"标题不能为空";
        return;
    }
    if (self.mainTextTxt.text.length==0)
    {
        self.errorLb.text=@"正文不能为空";
        return;
    }
    [self sendLtrToWeb];//发送信件
}
-(void)sendLtrToWeb
{
    NSString *sendLtrInfo;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_MsgSend *request=[[MyService_MsgSend alloc] init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.receiver_ids=self.receviceIds;
    request.msg_title=self.titletTxt.text;
    request.msg_content=self.mainTextTxt.text;
    MyServiceSoapBindingResponse *resp=[binding MsgSendUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_MsgSendResponse class]])
        {
            sendLtrInfo=[mine MsgSendResult];
        }
    }
    if ([sendLtrInfo isEqualToString:@"false"]) 
    {
        [ShowAlert showAlert:@"失败" :@"发送失败"];
        
    }
    else
    {
        [ShowAlert showAlert:@"成功" :@"成功发送"];
        /*数据的清空*/
        [self.mainTextTxt setText:@""];
        [self.receviceTxt setText:@""];
        [self.titletTxt setText:@""];
        self.receviceIds=@"";
    }
}
#pragma mark - removeKeyBoard
-(IBAction)clickBg:(id)sender//通过点击背景消除键盘
{
    [mainTextTxt resignFirstResponder];
    [titletTxt resignFirstResponder];
    [receviceTxt resignFirstResponder];//通过解除第一反应者,来消除键盘
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField//开始编辑
{
    if(textField==self.receviceTxt)
    {
        return NO;
    }
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField//结束编辑
{
    return YES;
}
#pragma mark -Table_Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section//一个分区有多少行
{
    return [self numberCountOfSection:section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView//有几个分区
{
    return [self.staffInfoArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }//数据的赋值
    cell.textLabel.text=[[[[self.staffInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"] objectAtIndex:1];
    cell.textLabel.text=[[cell.textLabel.text componentsSeparatedByString:@"ψ"] objectAtIndex:0];
    BOOL flag=NO;
    if (self.receviceTxt.text.length!=0)//检查这个cell是否被选中
    {
        NSArray * recevieTxtArrayTmp=[self.receviceTxt.text componentsSeparatedByString:@","];
        for (int i=0; i<recevieTxtArrayTmp.count-1; i++)
        {
            if ([cell.textLabel.text isEqualToString:[recevieTxtArrayTmp objectAtIndex:i]])
            {
                flag=YES;
                break;
            }
        }
    }
    if (flag)//这个数据已经被选中
    {
        cell.textLabel.textColor=[UIColor blueColor];//改变字体状态
    }
    //数据的分割
    return cell;
}
//段头返回一个view，添加点击按钮
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.tag = section;
	
	[button setBackgroundImage:[UIImage imageNamed:@"bgd1.png"] forState:UIControlStateNormal];//设置背景图片
	[button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];//调用的方法
	UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
	int flagNum=[[_flagArray objectAtIndex:section] intValue];
	if(flagNum!=1)
		image.image = [UIImage imageNamed:@"normal.png"];
	else 
		image.image = [UIImage imageNamed:@"pressed.png"];
	[UIView beginAnimations:@"animatecomeout" context:NULL];
	[UIView setAnimationDuration:.25f];
	if(flagNum==1)
		image.transform=CGAffineTransformMakeRotation(-1.58);
	else
		image.transform=CGAffineTransformMakeRotation(1.58);
	[UIView commitAnimations];
	[button addSubview:image];
	[image release];
	CGFloat size = 16;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 200, 30)];
	label.backgroundColor = [UIColor clearColor];
	label.textColor = [UIColor whiteColor];
	label.font = [UIFont boldSystemFontOfSize:size];
	label.text =[[[[self.staffInfoArray objectAtIndex:section]objectAtIndex:0]componentsSeparatedByString:@"@"]objectAtIndex:2];
	[button addSubview:label];
	[label release];
	return button;
    
}
//段头按钮点击响应事件
-(void)btnClick:(id)sender{
    
	UIButton *btn=(UIButton *)sender;
	int tag=(int)btn.tag;
	int flagNum=[[_flagArray objectAtIndex:tag] intValue];
    
	if (flagNum==1) {
		[_flagArray replaceObjectAtIndex:tag withObject:[NSNumber numberWithInt:0]];		
	}else {
		[_flagArray replaceObjectAtIndex:tag withObject:[NSNumber numberWithInt:1]];
	}
	[self.receiverTable reloadSections:[NSIndexSet indexSetWithIndex:tag] withRowAnimation:UITableViewRowAnimationTop];
}
//每段头高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section 
{
	return 50;
}
-(int)numberCountOfSection:(NSInteger)section
{
	int num=[[_flagArray objectAtIndex:section] intValue];
	if (num==1) 
    {
		return 0;
	}else
    {
		return [[self.staffInfoArray objectAtIndex:section] count];
	}
}
#pragma mark -TableView delge
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * detailInfoArray=[[[self.staffInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"];
    NSString *txlId=[detailInfoArray objectAtIndex:0];
    NSString *txlName=[[[detailInfoArray objectAtIndex:1]componentsSeparatedByString:@"ψ"] objectAtIndex:0];//数据的处理
    
    UITableViewCell *cell=[receiverTable cellForRowAtIndexPath:indexPath];
    if (cell.textLabel.textColor==[UIColor blueColor])//已经被选中了,再次选择则取消选择
    {
        cell.textLabel.textColor=[UIColor blackColor];
        NSMutableArray * txlIdArrayTmp=(NSMutableArray*)[self.receviceIds componentsSeparatedByString:@","];
        NSMutableArray * txlNameArrayTmp=(NSMutableArray*)[self.receviceTxt.text componentsSeparatedByString:@","];
        //[txlIdArrayTmp removeLastObject];//去除最后为空的那项数据
        //[txlNameArrayTmp removeLastObject];
        
        [txlIdArrayTmp removeObject:txlId];//去除那项被重复点击的行
        [txlNameArrayTmp removeObject:txlName];
        
        self.receviceIds=[txlIdArrayTmp componentsJoinedByString:@","];//把数组组合成字符串
        self.receviceTxt.text=[txlNameArrayTmp componentsJoinedByString:@","];
    }
    else
    {
        self.receviceIds=[self.receviceIds stringByAppendingFormat:@"%@,",txlId];
        //把Id进行拼接在一起
        self.receviceTxt.text=[self.receviceTxt.text stringByAppendingFormat:@"%@,",txlName];
        /*数据的处理*/
        cell.textLabel.textColor=[UIColor blueColor];
       
    }
}
#pragma mark -TextView
-(BOOL)textViewShouldBeginEditing:(UITextView *)textView//点击开始编辑
{
    
    //整个界面向上移动一定的高度
    //设置判断键盘的高度释放遮住文本框
    //设置动画
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"keyBorad" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame=CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height);//界面的上移
    [UIView commitAnimations];//结束动画
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView//结束编辑
{
    //还原键盘
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"resizeKeyBorad" context:nil];
    [UIView setAnimationDuration:animationDuration];
          self.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);//界面的还原
    [UIView commitAnimations];
    return YES;
}

@end
