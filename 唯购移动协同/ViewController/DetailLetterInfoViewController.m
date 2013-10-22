//
//  DetailLetterInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <CoreData/CoreData.h>
#import "GlobalVar.h"
#import "ShowAlert.h"
#import "LetterInfo.h"
#import "CoreData_Method.h"
#import "DetailLetterInfoViewController.h"
@implementation DetailLetterInfoViewController
@synthesize detailInfoArray;
@synthesize titleArray,flag,letterId;
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
                                                   initWithTitle:NSLocalizedString(@"收藏", @"收藏")
                                                   style:UIBarButtonItemStyleBordered
                                                   target:self
                                                   action:@selector(addToCoreData)] autorelease];
    }

    [self detailDataProcess];//数据处理
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)detailDataProcess//数据的处理
{
    self.titleArray=[[NSArray alloc] initWithObjects:
                     @"标题:  ",
                     @"发件人:  ",
                     @"发送时间:  ",
                     @"详细内容:  ",
                     nil];
    NSMutableArray * detailInfoArrayTmp=[[[NSMutableArray alloc] initWithObjects:
                                          [self.detailInfoArray objectAtIndex:1],
                                          [self.detailInfoArray objectAtIndex:4],
                                          [self.detailInfoArray objectAtIndex:3],
                                          [self.detailInfoArray objectAtIndex:2],
                                          [self.detailInfoArray objectAtIndex:0],
                                          nil]autorelease];//将数据进行排序

    self.detailInfoArray=detailInfoArrayTmp;
    self.letterId=[self.detailInfoArray objectAtIndex:4];
    flag=YES;//防止收藏按钮被多次无效点击
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.titleArray=nil;
    self.detailInfoArray=nil;
    self.letterId=nil;
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
    [titleArray release];
    [detailInfoArray release];
    [letterId release];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
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
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.section];
    //设置每一行的标题
    cell.textLabel.text=[cell.textLabel.text stringByAppendingFormat:@"%@",[self.detailInfoArray objectAtIndex:indexPath.section]];
    //设置详细数据
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath//描述正文内容的那一行特别宽
{
    if (indexPath.section==3) 
    {
        return 200;
    }
    else
    {
        return  40;
    }
}
#pragma mark -addInfoToCoreData
-(void)addToCoreData//把数据添加到数据库里面去
{
    if (!flag)
    {
        return;//保护程序
    }
    flag=NO;
    CoreData_Method *coreData=[[CoreData_Method alloc]init];
    [coreData initCoreData];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"letterId == %@",self.letterId];
    [coreData fetchObjects:@"LetterInfo" :@"letterId":predicate];
    if (coreData.fetchedResultsController.fetchedObjects.count==0)//没有这个数据,则添加数据到数据库里面去
    { 
        NSError *error;
        LetterInfo *letterInfo=(LetterInfo*)[NSEntityDescription insertNewObjectForEntityForName:@"LetterInfo" inManagedObjectContext:coreData.managedObjectContext];
        letterInfo.letterId=self.letterId;
        letterInfo.loginId=[[GlobalVar shareGlobalVar]loginId];
        letterInfo.time=[self.detailInfoArray objectAtIndex:2];
        letterInfo.sender=[self.detailInfoArray objectAtIndex:1];
        letterInfo.title=[self.detailInfoArray objectAtIndex:0];
        letterInfo.mainTxt=[self.detailInfoArray objectAtIndex:3];
        if ([coreData.managedObjectContext save:&error])
        {
            //NSLog(@"%@",error.localizedDescription);
        }
        [ShowAlert disMissAlert:@"成功" :@"信息已经添加到收藏界面里"];
    }
    
}

@end
