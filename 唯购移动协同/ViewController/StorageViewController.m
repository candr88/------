//
//  StorageViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "StorageViewController.h"
#import "StorageDetailInfoViewController.h"
@implementation StorageViewController
@synthesize fileArray;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
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

    [self storageDataProcessing];//数据的处理
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)storageDataProcessing//数据的处理
{
    [self getFileListInfo];//获取文件列表的信息
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.fileArray=nil;
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
    [fileArray release];
}
#pragma mark -WebSerVice
-(void)getFileListInfo//获取文件列表的信息
{
    NSString *storageInfo=[[NSString alloc]init];
    MyServiceSoapBinding*binding=[[MyService MyServiceSoapBinding]initWithAddress:[[GlobalVar  shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetMyFilelist *request=[[MyService_GetMyFilelist alloc]init];
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
    request.keyword=@"";
    request.firstRecorder=[NSNumber numberWithInt:0];
    request.rowLength=[NSNumber numberWithInt:20];
    MyServiceSoapBindingResponse *resp=
                            [binding GetMyFilelistUsingParameters:request];  
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetMyFilelistResponse class]]) 
        {
            storageInfo=[mine GetMyFilelistResult];
        }
    }
    //NSLog(@"%@",storageInfo);
    self.fileArray=[storageInfo componentsSeparatedByString:@","];
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
    return [self.fileArray count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=[self.fileArray objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
    //界面的跳转
    StorageDetailInfoViewController *storageDtInfoViewCtr=  [[StorageDetailInfoViewController alloc]init];
    storageDtInfoViewCtr.fileInfoArray=[[fileArray objectAtIndex:indexPath.row]componentsSeparatedByString:@"@"];//把数组进行分割
    [self.navigationController pushViewController:storageDtInfoViewCtr animated:YES];
    [storageDtInfoViewCtr release];
    
}

@end
