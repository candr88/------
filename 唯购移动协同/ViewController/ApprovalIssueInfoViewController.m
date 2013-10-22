//
//  ApprovalIssueInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "IssueHistoryInfoViewController.h"
#import "ApprovalIssueInfoViewController.h"
@implementation ApprovalIssueInfoViewController
@synthesize approvalArray;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        self.title=@"历史申请";
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
    [self approvaHistoryDataProcessing];//数据处理

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)approvaHistoryDataProcessing
{
    [self getApprovaHistory];//获取数据
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.approvalArray=nil;
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
    [approvalArray release];
}
#pragma mark -WebService
-(void)getApprovaHistory//获取历史申请的记录
{
    NSString * approvalString=[[[NSString alloc]init]autorelease];
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetWFFinishList *request=[[MyService_GetWFFinishList alloc]init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.firstRecorder=[NSNumber numberWithInt:0];
    request.rowLength=[NSNumber numberWithInt:20];
    request.stime=@"";
    request.etime=@"";
    request.clrid=@"";
    request.wfname=@"";
    MyServiceSoapBindingResponse *resp=[binding GetWFFinishListUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetWFFinishListResponse class]]) 
        {
            approvalString=[mine GetWFFinishListResult];
        }
    }
    self.approvalArray=[approvalString componentsSeparatedByString:@","];
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
    return [self.approvalArray count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=[approvalArray objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*界面的跳转*/
    IssueHistoryInfoViewController *issueInfoHistoryCtr=  [[IssueHistoryInfoViewController alloc]init];
    issueInfoHistoryCtr.issueId=[[[self.approvalArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"]objectAtIndex:0];
    [self.navigationController pushViewController:issueInfoHistoryCtr animated:YES];
    [issueInfoHistoryCtr release];
}

@end
