//
//  StaffInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "MyService.h"
#import "GlobalVar.h"
#import "CoreData_Method.h"
#import "InvokeWebService.h"
#import "StaffInfoViewController.h"
#import "DetailInfoViewController.h"
@implementation StaffInfoViewController
@synthesize allTxtInfoArray=_allTxtInfoArray;
@synthesize ownSelfInfoArray=_ownSelfInfoArray;
@synthesize staffInfoArray=_staffInfoArray;
@synthesize flagArray=_flagArray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.tabBarItem.title=@"员工通讯录";
        self.tabBarItem.image=[UIImage imageNamed:@"Company"];
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
   // [self dataProcessing];//数据的处理,在一个方法里面有利于代码的几个的清晰和逻辑的合理和减少错误
    // Do any additional setup after loading the view from its nib.
}
-(void)dataProcessing//所有数据的处理
{
    [self getAllStaffInfo];
    [self splitAllTxlInfo];
    _flagArray=[[NSMutableArray alloc] init];//用于树状菜单的展开和收缩
	for (int i=0; i<[_staffInfoArray count]; i++) 
    {
		[_flagArray addObject:[NSNumber numberWithInt:1]];
	}

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.flagArray=nil;
    self.ownSelfInfoArray=nil;
    self.staffInfoArray=nil;
    self.allTxtInfoArray=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)dealloc//记得调用父类进行清理工作,不然会存在内存泄露的问题
{
    [super dealloc];
    [_flagArray release];
    [_ownSelfInfoArray release];
    [_staffInfoArray release];
    [_allTxtInfoArray release];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark - WebService
-(void)getAllStaffInfo//获取信息
{
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding ]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    NSString *rsStr;
    MyService_GetAllTxl *request=[[MyService_GetAllTxl alloc]init];
    request.loginid=[[GlobalVar shareGlobalVar] loginId];
    MyServiceSoapBindingResponse *resp=[binding GetAllTxlUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetAllTxlResponse class]])
        {
            rsStr=[mine GetAllTxlResult];
        }
    }
    _allTxtInfoArray=[[NSArray alloc] init];
    NSMutableArray *allTxlInfoTmp=(NSMutableArray*)[rsStr componentsSeparatedByString:@","];
    [allTxlInfoTmp removeLastObject];//去掉最后为空的哪项数据
    _allTxtInfoArray=(NSArray *)allTxlInfoTmp;//数据的传递
    [request release];
    
}
#pragma mark -SplitData
-(void)splitAllTxlInfo//把数据分割成我的通讯录和公司通讯录
{
    NSMutableArray *ownSelfInfoArrayTmp=[[[NSMutableArray alloc]init]autorelease];
    NSMutableArray *staffInfoArrayTmp=[[[NSMutableArray alloc]init]autorelease];
    for (int i=0; i<[_allTxtInfoArray count]; i++) //把两个组的数据进行分组
    {
        if ([[[[_allTxtInfoArray objectAtIndex:i] componentsSeparatedByString:@"@"]objectAtIndex:3] isEqualToString:@"wd "]) 
        {
            [ownSelfInfoArrayTmp addObject:[_allTxtInfoArray objectAtIndex:i]];
        }
        if ([[[[_allTxtInfoArray objectAtIndex:i] componentsSeparatedByString:@"@"]objectAtIndex:3] isEqualToString:@"gs "]) 
        {
            [staffInfoArrayTmp addObject:[_allTxtInfoArray objectAtIndex:i]];
        }
    }
    if (ownSelfInfoArrayTmp.count!=0)//保护措施
    {
        _ownSelfInfoArray=[self splitDtTxlInfo:ownSelfInfoArrayTmp];
        [[GlobalVar shareGlobalVar]setOwnSelfInfoArray:_ownSelfInfoArray];   
    }
    if (staffInfoArrayTmp.count!=0)
    {
        _staffInfoArray=[self splitDtTxlInfo :staffInfoArrayTmp];
        [[GlobalVar shareGlobalVar]setStaffInfoArray:_staffInfoArray];
    }
    //NSLog(@"%d",[[GlobalVar shareGlobalVar]staffInfoArray].count);
    //把处理好的数据传递给全局变量

    //NSLog(@"%d",info.count);

}
-(NSMutableArray*)splitDtTxlInfo:(NSMutableArray*)infoArray;//把详细信息进行分组
{
    NSString *groupName;
    NSMutableArray *groupTitleArray=[[NSMutableArray alloc] init];
    NSMutableArray *groupArray=[[NSMutableArray alloc] init];
    BOOL flag;//定义一个旗帜
    if ([groupTitleArray count]==0)//添加第一个类别
    {
        groupName=[[[infoArray objectAtIndex:0] componentsSeparatedByString:@"@"] objectAtIndex:2];
        [groupTitleArray addObject:groupName];
    }
    //循环判断添加其余类别,跳过重复项
    for (int i=0; i<[infoArray count]; i++)
    {
        flag=YES;
        groupName=[[[infoArray objectAtIndex:i] componentsSeparatedByString:@"@"] objectAtIndex:2];
        for (int t=0; t<[groupTitleArray count]; t++) 
        {
            if ([[groupTitleArray objectAtIndex:t]isEqualToString:groupName]) 
            {//如果存在相同的项就跳出循环
                flag=NO;
                break;
            }
        }
        if (flag)//如果没有相同的一项就进行添加
        {
            [groupTitleArray addObject:groupName];
        }
    }
    
    for (int z=0; z<[groupTitleArray count]; z++)
    {
        NSMutableArray *arraytTmp=[[NSMutableArray alloc] init];
        for (int k=0; k <infoArray.count; k++) 
        {
            groupName=[[[infoArray objectAtIndex:k] componentsSeparatedByString:@"@"] objectAtIndex:2];
            if ([groupName isEqualToString:[groupTitleArray objectAtIndex:z]])
            {//比较两个数据是否相同,如果相同就进行添加操作
                [arraytTmp addObject:[infoArray objectAtIndex:k]];     
            }
         
        }
        [groupArray addObject: arraytTmp];
        [arraytTmp release];
    }
    return groupArray;

}
#pragma mark -Table_Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section//一个分区有多少行
{
    return [self numberCountOfSection:section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView//有几个分区
{
    return [_staffInfoArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }//数据的赋值
    cell.textLabel.text=[[[[_staffInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"] objectAtIndex:1];
    cell.textLabel.text=[[cell.textLabel.text componentsSeparatedByString:@"ψ"] objectAtIndex:0];//数据的分割
    // Configure the cell...
    
    return cell;
}
//段头返回一个view，设置每个section的标题为button,通过添加的label显示section标题
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
	label.text =[[[[_staffInfoArray objectAtIndex:section]objectAtIndex:0]componentsSeparatedByString:@"@"]objectAtIndex:2];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 40;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
	return 50;
	
}
-(int)numberCountOfSection:(NSInteger)section
{
	int num=[[_flagArray objectAtIndex:section] intValue];
	if (num==1) {
		return 0;
	}else {
		return [[_staffInfoArray objectAtIndex:section] count];
	}
    
}
#pragma mark -Table-Method
//跳转到详细数据界面
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *userID=
    [[[[_staffInfoArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"] objectAtIndex:0];
    //被点击用户的ID
    DetailInfoViewController *detailInfoViewCtr=[[DetailInfoViewController alloc] initWithStyle:UITableViewStyleGrouped];
    InvokeWebService *invokeWebService=[[InvokeWebService alloc] init];
    detailInfoViewCtr.detailInfoArray=(NSMutableArray*)[invokeWebService getOneTxlDtInfo:userID :@"gs"];//获取详细数据
    // NSLog(@"%d",detailInfoViewCtr.detailInfoArray.count);
    [self.navigationController pushViewController:detailInfoViewCtr animated:YES];
    [detailInfoViewCtr release];
    [invokeWebService release];
}
#pragma mark-CoreDataMethod
-(void)storeInfoToCoreData//把数据存放到数据库里面(总的方法)
{
    
}
-(NSArray*)getAllContactInfoFromWeb//从网络上获取数据
{
    NSArray * allContactInfoArray=[[[NSArray alloc]init]autorelease];
    NSString *rsstr;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetAllTxlDetial *request=[[MyService_GetAllTxlDetial alloc]init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    MyServiceSoapBindingResponse *resp=
                            [binding GetAllTxlDetialUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetAllTxlDetialResponse class]])
        {
            rsstr=[mine GetAllTxlDetialResult];
        }
    }
    allContactInfoArray=[rsstr componentsSeparatedByString:@","];
    return allContactInfoArray;
}
-(NSArray*)getAllGsContactInfoFromWeb//从网络上获取所有公司里面人的信息
{
    NSArray * allGsContactInfoArray=[[[NSArray alloc]init]autorelease];
    NSString *gsInforsStr;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetAllTxlGsDetial *request=[[MyService_GetAllTxlGsDetial alloc]init];
    MyServiceSoapBindingResponse *resp=
            [binding GetAllTxlGsDetialUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetAllTxlGsDetialResponse class]])
        {
            gsInforsStr=[mine GetAllTxlGsDetialResult];
        }
    }
    allGsContactInfoArray=[gsInforsStr componentsSeparatedByString:@","];
    return allGsContactInfoArray;
}
-(void)checkInfoExiist:(NSArray*)contactInfoArray//检查数据是否存在
{
    CoreData_Method * coreData=[[CoreData_Method alloc]init];
    [coreData initCoreData];
    for (int i=0; i<[contactInfoArray count]-1; i++)
    {
       // [coreData fetchObjects:@"" :<#(NSString *)#> :<#(NSPredicate *)#>]
    }
}
-(void)upcontactInfo//更新数据
{

}
-(void)addInfoToCoreData//把数据添加到数据库里面去
{

}
@end
