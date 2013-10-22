//
//  ReceiveLetterInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "DetailLetterInfoViewController.h"
#import "ReceiveLetterInfoViewController.h"
@implementation ReceiveLetterInfoViewController
@synthesize recevieInfoArray;
@synthesize unReadLtrCount,startRow;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) 
    {
        self.tabBarItem.title=@"已收信件";
        self.tabBarItem.image=[UIImage imageNamed:@"receive"];
        // Custom initialization
    }
    return self;
}
-(id)init
{
    self = [super init];
    if (self) 
    {
        self.tabBarItem.title=@"已收信件";
        self.tabBarItem.image=[UIImage imageNamed:@"receive"];
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
    if (_refreshHeaderView == nil)//下拉刷新界面的添加
    {
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
		view.delegate = self;
		[self.tableView addSubview:view];
		_refreshHeaderView = view;
		[view release];
	}
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];//最近一次刷新的时间
    [self receiveLetterDataProcessing];//所有数据的处理
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)receiveLetterDataProcessing//所有数据的处理
{
    self.recevieInfoArray=[self getReceiveLetterInfo];
    [self getUnReadLettetCount];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.recevieInfoArray=nil;
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
    [recevieInfoArray release];
}
#pragma mark -ClickLoadMoreRow
//点击加载更多的项
-(void)addMoreLetterInfoToArray
{
    NSMutableArray * letteraddArray=[self getReceiveLetterInfo];
    [self performSelectorOnMainThread:@selector(addMoreLetterToTable:) withObject:letteraddArray waitUntilDone:NO];
    //调用主线程把数据添加到表格里面去,一定要主线程,不然会报错.
}
-(void)addMoreLetterToTable:(NSMutableArray *)letteraddArray//
{
    for(int i=0 ;i<[letteraddArray count];i++)//把数据添加到数组中
    {
        [self.recevieInfoArray addObject:[letteraddArray objectAtIndex:i]];    
    }
    [self.tableView reloadData];
}
#pragma mark -Refresh 
-(void)reFreashView//刷新界面
{
    [self viewDidLoad];
    [self.tableView reloadData];
}
#pragma mark -UnReadLetterCount
-(void)getUnReadLettetCount//获取未读信件的数量
{
    if (self.recevieInfoArray.count==0) 
    {
        return;//保护程序
    }
    NSString * readInfo;
    [UIApplication sharedApplication].applicationIconBadgeNumber-=unReadLtrCount;
    unReadLtrCount=0;//每次获取前对数据进行清空
    for (int i=0; i<self.recevieInfoArray.count; i++) 
    {
        readInfo=[[[self.recevieInfoArray objectAtIndex:i]componentsSeparatedByString:@"@"] objectAtIndex:5];
        if ([readInfo isEqualToString:@"0"])
        {
            unReadLtrCount++;
        }
    }
    [UIApplication sharedApplication].applicationIconBadgeNumber+=unReadLtrCount;
    if (unReadLtrCount==0)
    {
        self.tabBarItem.badgeValue=nil;
    }
    else
    {
        self.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",unReadLtrCount];
    }
}
#pragma mark -WebService
-(NSMutableArray*)getReceiveLetterInfo//获取收到的信件的数量
{
    NSMutableArray *letterInfoArray=[[NSMutableArray alloc]init];
    NSString * rsStr;
    MyServiceSoapBinding*binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_MsgReceiveList *request=
                            [[[MyService_MsgReceiveList alloc] init]autorelease];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.stime=@"";
    request.etime=@"";
    request.title=@"";
    request.content=@"";
    request.firstRecorder=[NSNumber numberWithInt:startRow*20];//设置数据的第一行
    request.rowLength=[NSNumber numberWithInt:20];
    request.readflag=@"";
    MyServiceSoapBindingResponse *resp=[binding MsgReceiveListUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_MsgReceiveListResponse class]]) 
        {
            rsStr=[mine MsgReceiveListResult];
        }
    }
    self.startRow++;//防止出现站内信的数量刚好20*的时候,
    letterInfoArray=(NSMutableArray*)[rsStr componentsSeparatedByString:@"§"];
    [letterInfoArray removeLastObject];//去掉最后为空的哪项
    return letterInfoArray;
}
-(NSString*)msgRead:(NSString *)letterId//对信件的阅读信息进行修改
{
    USBoolean *readInfo;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_MsgRead *request=[[[MyService_MsgRead alloc] init]autorelease];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.msg_id=letterId;
    MyServiceSoapBindingResponse *resp=[binding MsgReadUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_MsgReadResponse class]]) 
        {
            readInfo=[mine MsgReadResult];
        }
    }
    
    if ([readInfo.stringValue isEqualToString:@"true"])
    {
        unReadLtrCount--;
        if (unReadLtrCount==0)
        {
            self.tabBarItem.badgeValue=nil;
            //[UIApplication sharedApplication].applicationIconBadgeNumber--;
        }
        else
        {
            self.tabBarItem.badgeValue=[NSString stringWithFormat:@"%d",unReadLtrCount];
            [UIApplication sharedApplication].applicationIconBadgeNumber--;
        }
        return @"YES";
    }
    else
    {
        return @"NO"; 
    }
 
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int count=[self.recevieInfoArray count];
    if (count==(self.startRow)*20)
    {
        return count+1;//判断是否到了20项
    }
    //NSLog(@"%d",count);
    return [self.recevieInfoArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    if (indexPath.row==(self.startRow)*20)//判断这个相是不是点击加载的项
    {
        cell.textLabel.text=@"点击加载更多";
        cell.textLabel.textColor=[UIColor blackColor];
        cell.detailTextLabel.text=@"";
        return cell;
    }
    //正常的Cell
    NSString *letterInfo=[self.recevieInfoArray objectAtIndex:indexPath.row];
    if ([[[letterInfo componentsSeparatedByString:@"@"]objectAtIndex:5]isEqualToString:@"0"])
    {
        cell.textLabel.textColor=[UIColor redColor];
    }
    else
    {
        cell.textLabel.textColor=[UIColor blackColor];
    }
    NSString *title=@"标题: ";
    NSString *sender=@"发送人: ";
    cell.textLabel.text=[[[self.recevieInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:1];
    cell.textLabel.text=[title stringByAppendingFormat:@"%@",cell.textLabel.text];
    cell.detailTextLabel.text=[[[self.recevieInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:4];
    cell.detailTextLabel.text=[sender stringByAppendingFormat:@"%@",cell.detailTextLabel.text];
    // Configure the cell...
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    if (indexPath.row==(self.startRow)*20)//判断这个相是不是点击加载的项
    {
        UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
        
        cell.textLabel.text=@"添加中....";
        [self performSelectorInBackground:@selector(addMoreLetterInfoToArray) withObject:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //[self addMoreLetterInfoToArray];//把数据添加
        return ;
    }
    NSString *letterInfo=[self.recevieInfoArray objectAtIndex:indexPath.row];
    NSMutableArray * letterInfoArrayTmp=
                        (NSMutableArray*)[letterInfo componentsSeparatedByString:@"@"];
    
    if ([[letterInfoArrayTmp objectAtIndex:5] isEqualToString:@"0"])//判断信件是否被阅读
    {
        [self unReadLetterProcessing:[[letterInfo componentsSeparatedByString:@"@"]objectAtIndex:0]];//对网络上的信件信息进行更改
        [letterInfoArrayTmp replaceObjectAtIndex:5 withObject:@"1"];
        letterInfo=[letterInfoArrayTmp componentsJoinedByString:@"@"];
        [self.recevieInfoArray replaceObjectAtIndex:indexPath.row withObject:letterInfo];//把本地文件信息进行修改
        [tableView reloadData];//界面刷新
    }
    //跳转到详细界面
    DetailLetterInfoViewController  *detailViewController=[[DetailLetterInfoViewController alloc]initWithStyle:UITableViewStyleGrouped];
    detailViewController.detailInfoArray=(NSMutableArray*)[[self.recevieInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"];
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
}
#pragma mark -UnreadLetterPrcossing 
-(void)unReadLetterProcessing:(NSString *)letterId
{

    NSString *flag=[self msgRead:letterId];    
    //如果网络信息修改成功,标记也进行相应的更改
    if ([flag isEqualToString:@"NO"])
    {
        [ShowAlert showAlert:@"失败了" :@"信件读取失败了"];
        return;
    }

}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{//数据的加载
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    self.startRow=0;
    self.recevieInfoArray=nil;//数据的清空
    [self receiveLetterDataProcessing];
}
- (void)doneLoadingTableViewData
{
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
	[self.tableView reloadData];
}
#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}
#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
	
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
	return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
	return [NSDate date]; // should return date data source was last changed
}


@end
