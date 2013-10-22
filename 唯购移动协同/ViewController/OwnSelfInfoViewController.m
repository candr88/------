//
//  OwnSelfInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "MyService.h"
#import "GlobalVar.h"
#import "ShowAlert.h"
#import "InvokeWebService.h"
#import "AddFriendViewController.h"
#import "DetailInfoViewController.h"
#import "OwnSelfInfoViewController.h"
@implementation OwnSelfInfoViewController
@synthesize ownSelfInfoArray;
@synthesize flagArray=_flagArray;
@synthesize groupTitleArray;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) 
    {
        self.tabBarItem.title=@"员工通讯录";
        self.tabBarItem.image=[UIImage imageNamed:@"OwnSelf"];
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
    if (self.navigationItem.leftBarButtonItem==nil)
    {
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
                                                   initWithTitle:NSLocalizedString(@"添加", @"添加")
                                                   style:UIBarButtonItemStyleBordered
                                                   target:self
                                                   action:@selector(addFriendToContacts)] autorelease];
        
    }
      [self ownSelfdataProcessing];//数据的处理,在一个方法里面有利于代码的几个的清晰和逻辑的合理和减少错误
}
-(void)ownSelfdataProcessing//数据的处理
{
    self.ownSelfInfoArray=[[GlobalVar shareGlobalVar] ownSelfInfoArray];//从全局变量里面获取在StafInfoViewCtr处理好的数据
    _flagArray=[[NSMutableArray alloc] init];//用于树状菜单的展开和收缩
    NSString *groupInfo;
    NSMutableArray * groupTitleArrayTmp=[[NSMutableArray alloc]init];
	for (int i=0; i<[self.ownSelfInfoArray count]; i++) 
    {
        groupInfo=[[[[self.ownSelfInfoArray objectAtIndex:i]objectAtIndex:0]componentsSeparatedByString:@"ψ"] objectAtIndex:1];//获取每组队员的信息
		[_flagArray addObject:[NSNumber numberWithInt:1]];
        [groupTitleArrayTmp addObject:groupInfo];
	}
    self.groupTitleArray=groupTitleArrayTmp;
    [groupTitleArrayTmp release];//内存释放
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc//记得调用父类进行清理工作,不然会存在内存泄露的问题
{
    [super dealloc];
    [ownSelfInfoArray release];
    [_flagArray release];
}
#pragma mark -AddInfoToContent
-(void)addFriendToContacts//界面的跳转
{
    AddFriendViewController *addFriendViewCtr=[[AddFriendViewController alloc]init];
    addFriendViewCtr.groupTitleArray=self.groupTitleArray;
    [self.navigationController pushViewController:addFriendViewCtr animated:YES];
}
#pragma mark -Table_Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section//一个分区有多少行
{
    return [self numberCountOfSection:section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView//有几个分区
{
    return [self.ownSelfInfoArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }//数据的赋值
    cell.textLabel.text=[[[[self.ownSelfInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"] objectAtIndex:1];
    cell.textLabel.text=[[cell.textLabel.text componentsSeparatedByString:@"ψ"] objectAtIndex:0];//数据的分割
    // Configure the cell...
    
    return cell;
}
//跳转到详细数据界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   NSString *userID=
    [[[[self.ownSelfInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"] objectAtIndex:0];
    //被点击用户的ID
    DetailInfoViewController *detailInfoViewCtr=[[DetailInfoViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailInfoViewCtr.judge=@"wd";//进行判断
    InvokeWebService *invokeWebService=[[InvokeWebService alloc] init];
    detailInfoViewCtr.detailInfoArray=(NSMutableArray*)[invokeWebService getOneTxlDtInfo:userID :@"wd"];//获取详细数据
    // NSLog(@"%d",detailInfoViewCtr.detailInfoArray.count);
    [self.navigationController pushViewController:detailInfoViewCtr animated:YES];//界面跳转
    [detailInfoViewCtr release];
    [invokeWebService release];
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
	label.text=[[[self.groupTitleArray objectAtIndex:section]componentsSeparatedByString:@"@"]objectAtIndex:1];
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
	[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:tag] withRowAnimation:UITableViewRowAnimationTop];
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
        //NSLog(@"%d",[[self.ownSelfInfoArray objectAtIndex:0] count]);
		return [[self.ownSelfInfoArray objectAtIndex:section] count];
	}
}
#pragma mark -DeleteContacts
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath//允许编辑
{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath//进行删除
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSString *txlId=[[[[self.ownSelfInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:0];
        [[self.ownSelfInfoArray objectAtIndex:indexPath.section]removeObjectAtIndex:indexPath.row];
        [self delteContactsFromWeb:txlId];
        [tableView reloadData];
    }   
}
-(void)delteContactsFromWeb:(NSString *)txlId//调用接口
{
    USBoolean * flag;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_DelTxl *request=[[MyService_DelTxl alloc]init];
    request.txl_id=txlId;
    MyServiceSoapBindingResponse *resp=[binding DelTxlUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_DelTxlResponse class]]) 
        {
            flag=[mine DelTxlResult];
        }
    }
    if ([flag.stringValue isEqualToString:@"true"]) 
    {
        [ShowAlert showAlert:@"成功" :@"删除好友成功"];
    }
    else
    {
        [ShowAlert showAlert:@"失败" :@"好友删除失败"];
    }
}
@end
