//
//  SendLetterInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "SendLetterInfoViewController.h"
#import "DetailLetterInfoViewController.h"
@implementation SendLetterInfoViewController
@synthesize sendLetterInfoArray;
@synthesize startRow;
-(id)init
{
    self = [super init];
    if (self) 
    {
        self.tabBarItem.title=@"已发信息";
        self.tabBarItem.image=[UIImage imageNamed:@"send"];
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

    [self dataProcessing];//数据的处理
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)dataProcessing
{   
    self.sendLetterInfoArray=[self getSendLetterInfo];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.sendLetterInfoArray=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
-(void)dealloc
{   
    [super dealloc];
    [sendLetterInfoArray release];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -WebService
-(NSMutableArray*)getSendLetterInfo//已发信件的信息
{
    NSString *sendLtrInfo=[[[NSString alloc]init]autorelease];
    NSMutableArray * sendLtrArrayTmp=[[[NSMutableArray alloc]init] autorelease];
    MyServiceSoapBinding*binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_MsgSendList *request=[[[MyService_MsgSendList alloc] init]autorelease];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.stime=@"";
    request.etime=@"";
    request.title=@"";
    request.content=@"";
    request.firstRecorder=[NSNumber numberWithInt:startRow*20];;
    request.rowLength=[NSNumber numberWithInt:20];
    request.readflag=@"";
    MyServiceSoapBindingResponse *resp=[binding MsgSendListUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_MsgSendListResponse class]]) 
        {
            sendLtrInfo=[mine MsgSendListResult];
        }
        //[_receiveArray removeLastObject];//去掉最后为空的那一项数据
    }
    startRow ++;//无论是否添加了数据
    if ([sendLtrInfo isEqualToString:@"false"]) 
    {
        return nil;//保护
    }
    sendLtrArrayTmp=(NSMutableArray*)[sendLtrInfo componentsSeparatedByString:@"§"];
    [sendLtrArrayTmp removeLastObject];//去掉最后为空的项
    return sendLtrArrayTmp;
}
#pragma mark -ClickLoadMoreRow
//点击加载更多的项
-(void)addMoreLetterInfoToArray
{
    NSMutableArray * letteraddArray=[self getSendLetterInfo];//获取数据
    [self performSelectorOnMainThread:@selector(addMoreLetterToTable:) withObject:letteraddArray waitUntilDone:NO];
    //调用主线程把数据添加到表格里面去,一定要主线程,不然会报错.
}
-(void)addMoreLetterToTable:(NSMutableArray *)letteraddArray//
{
    for(int i=0 ;i<[letteraddArray count];i++)//把数据添加到数组中
    {
        [self.sendLetterInfoArray addObject:[letteraddArray objectAtIndex:i]];    
    }
    [self.tableView reloadData];
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
    int count=[self.sendLetterInfoArray count];
    if (count==(self.startRow)*20)
    {
        return count+1;//判断是否到了20项
    }
    //NSLog(@"%d",count);
    return [self.sendLetterInfoArray count];

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
    //NSLog(@"%d",indexPath.row);
    NSString *title=@"标题: ";
    NSString *sender=@"发送人: ";
    cell.textLabel.text=[[[self.sendLetterInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:1];
    cell.textLabel.text=[title stringByAppendingFormat:@"%@",cell.textLabel.text];
    cell.detailTextLabel.text=[[[self.sendLetterInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:4];
    cell.detailTextLabel.text=[sender stringByAppendingFormat:@"%@",cell.detailTextLabel.text];
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    if (indexPath.row==(self.startRow)*20)//判断这个项是不是点击加载的项
    {
        UITableViewCell *cell=[self.tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.text=@"添加中....";
        [self performSelectorInBackground:@selector(addMoreLetterInfoToArray) withObject:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        //[self addMoreLetterInfoToArray];//把数据添加
        return ;
    }
    DetailLetterInfoViewController *detailLtrCtr=[[DetailLetterInfoViewController alloc] initWithStyle:UITableViewStyleGrouped];
    detailLtrCtr.detailInfoArray=(NSMutableArray*)[[self.sendLetterInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"];
    [self.navigationController pushViewController:detailLtrCtr animated:YES];
    [detailLtrCtr release];
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{//数据的加载
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    self.startRow=0;
    self.sendLetterInfoArray=nil;//数据的清空
    [self dataProcessing];
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

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

@end
