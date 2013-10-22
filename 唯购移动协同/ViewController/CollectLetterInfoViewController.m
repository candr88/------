//
//  CollectLetterInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "ShowAlert.h"
#import "LetterInfo.h"
#import "CoreData_Method.h"
#import "CollectLetterInfoViewController.h"
#import "DetailLetterInfoViewController.h"
@implementation CollectLetterInfoViewController
@synthesize coreDataMethod,letterInfo;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title=@"收藏";
        self.tabBarItem.image=[UIImage imageNamed:@"collect"];
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
    [self getInfoFromCoreData];//从数据库里面获取数据,
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)getInfoFromCoreData//获取数据
{
    coreDataMethod=[[CoreData_Method alloc] init];
    [coreDataMethod initCoreData];//维护上下文
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"loginId ==%@",[[GlobalVar shareGlobalVar]loginId]];
    [coreDataMethod fetchObjects:@"LetterInfo" :@"loginId":predicate];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.coreDataMethod=nil;
    self.letterInfo=nil;
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
    [coreDataMethod release];
    [letterInfo release];
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
    return [self.coreDataMethod.fetchedResultsController.fetchedObjects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    if (self.letterInfo!=nil)//进行数据的清空,防止内存泄露 
    {
        self.letterInfo=nil;
    }
    self.letterInfo=[self.coreDataMethod.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];//获取数据
    NSString *title=@"标题: ";
    NSString *sender=@"发送人: ";
    cell.textLabel.text=[title stringByAppendingFormat:@"%@",self.letterInfo.title];
    cell.detailTextLabel.text=[sender stringByAppendingFormat:@"%@",self.letterInfo.sender];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailLetterInfoViewController *detailInfoViewCtr=[[DetailLetterInfoViewController alloc]init];
    if (self.letterInfo!=nil)//进行数据的清空,防止内存泄露 
    {
        self.letterInfo=nil;
    }
    self.letterInfo=[self.coreDataMethod.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];//获取数据
    NSMutableArray * detailLetterInfoTmp=[[[NSMutableArray alloc] initWithObjects:  
                                    self.letterInfo.letterId,
                                    self.letterInfo.title,
                                    self.letterInfo.mainTxt,
                                    self.letterInfo.time,
                                    self.letterInfo.sender
                                   , nil]autorelease];//构建数据
    detailInfoViewCtr.detailInfoArray=detailLetterInfoTmp;//数据的传递
    [self.navigationController pushViewController:detailInfoViewCtr animated:YES];
    /*界面的跳转*/
}
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
- (void)reloadTableViewDataSource
{//数据的加载
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
    coreDataMethod=nil;//数据的清空
    [self getInfoFromCoreData];//获取数据
	_reloading = YES;

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
