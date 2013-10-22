//
//  IssueInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "IssueInfoViewController.h"
#import "IssueDetailInfoViewController.h"
@implementation IssueInfoViewController
@synthesize issueInfoArray;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)init
{
    self=[super init];
    if (self) 
    {
        self.title=@"审批处理";
    }
    return  self;
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)viewWillAppear:(BOOL)animated
{
    if (refresh) 
    {
        self.issueInfoArray=nil;
        [self issueDataProcessing];//数据刷新
        [self.tableView reloadData];
        refresh=NO;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    refresh=NO;
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
    [self issueDataProcessing];//数据处理
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)issueDataProcessing
{
    [self getIssueInfo];
    /*设置图标上面的数字*/
    int iconVale=[[UIApplication sharedApplication]applicationIconBadgeNumber];
    if (self.issueInfoArray.count!=0)
    {
        iconVale=[self.issueInfoArray count]-1;
    }
    else
    {   
        iconVale=[self.issueInfoArray count];
    }
    [[UIApplication sharedApplication]setApplicationIconBadgeNumber:iconVale];
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.issueInfoArray=nil;
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
    [issueInfoArray release];
}
#pragma mark - WebService
-(void)getIssueInfo
{
    NSString *  issueInfo=[[[NSString alloc] init]autorelease];
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetCurTaskList *request=[[MyService_GetCurTaskList alloc] init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.firstRecorder=[NSNumber numberWithInt:0];
    request.stime=@"";
    request.etime=@"";
    request.clrid=@"";
    request.wfname=@"";
    request.rowLength=[NSNumber numberWithInt:20];
    MyServiceSoapBindingResponse *resp=[binding GetCurTaskListUsingParameters:request];
    for(id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetCurTaskListResponse class]]) 
        {
            issueInfo=[mine GetCurTaskListResult]; 
        }
    }
    self.issueInfoArray=[issueInfo componentsSeparatedByString:@","];
    [request release];
}
-(NSString*)checkIssueState:(NSString *)issueId//进行检查状态
{
    USBoolean *state=[[[USBoolean alloc] init]autorelease];
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetTaskState *request=[[MyService_GetTaskState alloc]init];
    request.task_id=issueId;
    MyServiceSoapBindingResponse*resp=[binding GetTaskStateUsingParameters:request];
    for(id mine in resp.bodyParts )
    {
        if ([mine isKindOfClass:[MyService_GetTaskStateResponse class]])
        {
            state=[mine GetTaskStateResult];
        }
    }
    if ( [state.stringValue isEqualToString:@"false"])
    {
        return @"未审批";
    }
    else
    {
        return @"已审批";
    }
    [request release];
    
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
    if ([self.issueInfoArray count]==0)
    {
        return 0;
    }
    return [self.issueInfoArray count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    NSString *issueName=@"任务名称:";
    NSString *issueSender=@"发起人";
    cell.textLabel.text=[self.issueInfoArray objectAtIndex:0];
    cell.textLabel.text=[[[self.issueInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:1];
    cell.textLabel.text=[issueName stringByAppendingFormat:@"%@",cell.textLabel.text];
    cell.detailTextLabel.text=[[[self.issueInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:4];
    cell.detailTextLabel.text=[issueSender stringByAppendingFormat:@"%@",cell.detailTextLabel.text];
    
    // Configure the cell...
    
    return cell;
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * issueIdTmp=[[[self.issueInfoArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:0];
    //NSLog(@"%@",issueIdTmp);
    NSString * flag= [[NSString alloc] init];
    flag=[self checkIssueState: issueIdTmp];//审批前进行判断审批单的状态
    if ([flag isEqualToString:@"未审批"])//未审批的话直接跳转到审批界面
    {
        refresh=YES;//在界面返回时候进行刷新
        IssueDetailInfoViewController *issueDtViewCtr=[[IssueDetailInfoViewController alloc]init];
        issueDtViewCtr.issueId=issueIdTmp;
        [self.navigationController pushViewController:issueDtViewCtr animated:YES];
        [issueDtViewCtr release];
    }
    [flag release];
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{//数据的加载
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    self.issueInfoArray=nil;//数据的清空
    [self issueDataProcessing];
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

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
	return _reloading; // should return if data source model is reloading
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


@end
