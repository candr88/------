//
//  EntrustViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "EntrustViewController.h"
#import "AddEntrustViewController.h"
@implementation EntrustViewController
@synthesize entrstInfoString;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
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
        self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] 
                                                   initWithTitle:NSLocalizedString(@"添加委托", @"添加委托")
                                                   style:UIBarButtonItemStyleBordered
                                                   target:self
                                                   action:@selector(jumpToAddEntrustViewCtr)] autorelease];
    }
    [self handleEntrustData];//处理数据
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    if (flag)
    {
        self.entrstInfoString=[[GlobalVar shareGlobalVar]entrustInfo];//数据的更新
        [self.tableView reloadData];//刷新界面
    }
}
-(void)handleEntrustData
{
    [self getEntrustInfo];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.entrstInfoString=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)dealloc
{
    [super dealloc];
    [entrstInfoString release];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#pragma mark -AddEntrustViewCtr
-(void)jumpToAddEntrustViewCtr//跳转到添加委托界面
{
    if ([self.entrstInfoString isEqualToString:@"没有委托"]) 
    {
        flag=YES;
        AddEntrustViewController *addEntrustViewCtr=[[AddEntrustViewController alloc] init];
        [self.navigationController pushViewController:addEntrustViewCtr animated:YES];
        [addEntrustViewCtr release];
    }
}
#pragma mark -WebService
-(void)getEntrustInfo
{
    NSString *entrustInfo;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_WFDelegGetCurStr*request=[[MyService_WFDelegGetCurStr alloc] init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    MyServiceSoapBindingResponse *resp=[binding WFDelegGetCurStrUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_WFDelegGetCurStrResponse class]])
        {
            entrustInfo=[mine WFDelegGetCurStrResult];
        }
    }
    if ([entrustInfo isEqualToString:@"false"])
    {
        self.entrstInfoString=@"没有委托";
        [[GlobalVar shareGlobalVar]setEntrustInfo:self.entrstInfoString];//设置数据
    }
    else
    {
        self.entrstInfoString=entrustInfo;
    }
    [request release];
}
-(void)cancelEntrust//取消委托
{
    USBoolean * rsstr;
    MyServiceSoapBinding *bing=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    bing.logXMLInOut=YES;
    MyService_WFDelegCancel *request2=[[MyService_WFDelegCancel alloc] init];
    request2.loginid=[[GlobalVar shareGlobalVar]loginId];
    MyServiceSoapBindingResponse *resp=[bing WFDelegCancelUsingParameters:request2];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_WFDelegCancelResponse class]])
        {
            rsstr=[mine WFDelegCancelResult];
        }
    }
    if ([[rsstr stringValue]isEqualToString:@"false"])
    {
        [ShowAlert showAlert:@"失败了" :@"取消委托失败"];
         }
    else
    {
        [ShowAlert showAlert:@"成功了" :@"成功取消委托"];
        self.entrstInfoString=@"没有委托";
        [self.tableView reloadData];
    }
    [request2 release];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=self.entrstInfoString;
    // Configure the cell...
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if ([self.entrstInfoString isEqualToString:@"没有委托"])
    {
        return NO;//进行保护措施,防止在没有委托存在的时候进行取消委托这个操作
    }
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        
        [self cancelEntrust];//在这里进行取消委托
        // Delete the row from the data source
      
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
