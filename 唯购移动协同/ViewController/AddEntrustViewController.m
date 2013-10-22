//
//  AddEntrustViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "AddEntrustViewController.h"
@implementation AddEntrustViewController
@synthesize staffTable;
@synthesize staffInfoArray;
@synthesize errorLb;
@synthesize flagArray;
@synthesize entrustId;
@synthesize entrustInfo;
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
-(id)init
{
    self=[super init];
    if (self) 
    {
        self.title=@"委托处理";
    }
    return self;
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(20, 142, 131, 34)];
    label.tag=101;
    label.text=@"";
    label.layer.borderWidth=2.0f;
    label.layer.borderColor=[[UIColor grayColor]CGColor];
    [self.view addSubview:label];
    [self addEntrustDataProcessing];//数据的处理
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)addEntrustDataProcessing//
{
    self.staffInfoArray=[[NSMutableArray alloc]init];
    self.staffInfoArray=[[GlobalVar shareGlobalVar]staffInfoArray];
    self.flagArray=[[NSMutableArray alloc] init];//用于树状菜单的展开和收缩
	for (int i=0; i<[self.staffInfoArray count]; i++) 
    {
		[self.flagArray addObject:[NSNumber numberWithInt:1]];
	}

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.staffInfoArray=nil;
    self.staffTable=nil;
    self.errorLb=nil;
    self.flagArray=nil;
    self.entrustId=nil;
    self.entrustInfo=nil;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc//内存清空
{
    [super dealloc];
    [staffInfoArray release];
    [staffTable release];
    [errorLb release];
    [flagArray release];
    [entrustInfo release];
    [entrustId release];
}
#pragma mark -AddEntrust
-(IBAction)addEntrustBtnClick:(id)sender//委托按钮的点击
{
    errorLb.text=@"";
    errorLb.alpha=1.0f;//错误信息的清空
    if (entrustId.length==0)
    {
        errorLb.textColor=[UIColor redColor];
        errorLb.text=@"请选择委托人";
        return;
    }
    USBoolean *  rsStr;
    MyServiceSoapBinding *bing=[[MyService MyServiceSoapBinding ]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    bing.logXMLInOut=YES;
    MyService_WFDelegAdd *request=[[MyService_WFDelegAdd alloc] init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.deleg_str_id=self.entrustId;
    MyServiceSoapBindingResponse *resp=[bing WFDelegAddUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_WFDelegAddResponse class]])
        {
            rsStr=[mine WFDelegAddResult];
        }
    }
    if ([[rsStr stringValue] isEqualToString:@"true"])
    {
        [ShowAlert showAlert:@"成功" :@"成功的添加了委托"];
        [[GlobalVar shareGlobalVar]setEntrustInfo:self.entrustInfo];
    }
    else
    {
        [ShowAlert showAlert:@"失败了" :@"添加委托失败"];
    }
    [self.navigationController popViewControllerAnimated:YES];
    [request release];
    

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
    cell.textLabel.text=[[cell.textLabel.text componentsSeparatedByString:@"ψ"] objectAtIndex:0];//数据的分割
    // Configure the cell...
    
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
	int flagNum=[[self.flagArray objectAtIndex:section] intValue];
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
-(void)btnClick:(id)sender
{
	UIButton *btn=(UIButton *)sender;
	int tag=(int)btn.tag;
	int flagNum=[[self.flagArray objectAtIndex:tag] intValue];
    
	if (flagNum==1) 
    {
		[self.flagArray replaceObjectAtIndex:tag withObject:[NSNumber numberWithInt:0]];		
	}else {
		[self.flagArray replaceObjectAtIndex:tag withObject:[NSNumber numberWithInt:1]];
	}
	[self.staffTable reloadSections:[NSIndexSet indexSetWithIndex:tag] withRowAnimation:UITableViewRowAnimationTop];
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
	int num=[[self.flagArray objectAtIndex:section] intValue];
	if (num==1) {
		return 0;
	}else {
		return [[self.staffInfoArray objectAtIndex:section] count];
	}
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray * detailInfoArray=[[[self.staffInfoArray objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"];
    self.entrustId=[detailInfoArray objectAtIndex:0];
    UILabel *label=(UILabel*)[self.view viewWithTag:101];
    label.text=[[[detailInfoArray objectAtIndex:1] componentsSeparatedByString:@"ψ"]objectAtIndex:0];
    [self.entrustInfo stringByAppendingFormat:@"%@",[label text]];//数据的合成


    
}

@end
