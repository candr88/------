//
//  DetailInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "GlobalVar.h"
#import "MyService.h"
#import "ShowAlert.h"
#import "DetailInfoViewController.h"
@implementation DetailInfoViewController
@synthesize titleArray;
@synthesize detailInfoArray;
@synthesize judge;
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
    //
    if ([self.judge isEqualToString: @"wd"])//进行判断
    {
        self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] 
                                                   initWithTitle:NSLocalizedString(@"提交", @"提交")
                                                   style:UIBarButtonItemStyleBordered
                                                   target:self
                                                   action:@selector(submitDataToWebService)] autorelease];
        
    }
    self.titleArray=[[NSArray alloc] initWithObjects:
                            @"姓名:  ",
                            @"手机:  ",
                            @"电话:  ",
                            @"地址:  ",
                            @"邮箱:  ",
                            @"QQ :   ",
                            @"fax:  ",
                            @"部门:  ",
                            @"职位:  ",
                            @"备注:  ",
                            nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.titleArray=nil;
    self.detailInfoArray=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc//内存清理
{
    [titleArray release];
    [detailInfoArray release];
    [super dealloc];
    
}
#pragma mark-Webservice
-(void)submitDataToWebService //将进行修改的数据提交到服务器上面
{
    UITextField *textLb=(UITextField*)[self.view viewWithTag:index];
    if (textLb!=nil) 
    {
        [textLb resignFirstResponder];
    }//将最后那个修改的数据进行保持
    USBoolean * updateInfo;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_UpdateTxl *request=[[MyService_UpdateTxl alloc] init];
    request.txl_id=[self.detailInfoArray objectAtIndex:0];
    request.txl_name=[self.detailInfoArray objectAtIndex:1];
    request.txl_cellphone=[self.detailInfoArray objectAtIndex:2];
    request.txl_telephone=[self.detailInfoArray objectAtIndex:3];
    request.txl_address=[self.detailInfoArray objectAtIndex:4];
    request.txl_email=[self.detailInfoArray objectAtIndex:5];
    request.txl_QQ=[self.detailInfoArray objectAtIndex:6];
    request.txl_fax=[self.detailInfoArray objectAtIndex:7];
    request.txl_dept=[self.detailInfoArray objectAtIndex:8];
    request.txl_duty=[self.detailInfoArray objectAtIndex:9];
    request.txl_descn=[self.detailInfoArray objectAtIndex:10];
    MyServiceSoapBindingResponse *resp=[binding UpdateTxlUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_UpdateTxlResponse class]]) 
        {
            updateInfo=[mine UpdateTxlResult];
        }
    }
    if ([updateInfo.stringValue isEqualToString:@"true"])
    {
        [ShowAlert showAlert:@"成功了" :@"成功更新了数据"];
    }
    else
    {
        [ShowAlert showAlert:@"失败了" :@"更新数据失败"];
    }
    [request release];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) 
    {
        return 3;
    }
    else
    {
        return 7;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.judge isEqualToString:@"wd"])
    {//根据判断需要进行自定义Cell
        UITableViewCell *cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]autorelease];
        cell=[self buildingOwnTableCell:cell :indexPath];
        //定义自已需要的Cell
        if (indexPath.section==0 && indexPath.row!=0)//设置独特的按钮,表示可以打电话
        {
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
        }
        return cell;
    }
    else
    {
      
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
         cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        if (indexPath.section==0) 
        {
            //NSLog(@"%@",[self.titleArray objectAtIndex:indexPath.row]);
            cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row];
            cell.textLabel.text=[cell.textLabel.text stringByAppendingFormat:@"%@",[self.detailInfoArray objectAtIndex:indexPath.row+1]];
        }
        else
        {
            cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row+3];
            cell.textLabel.text=[cell.textLabel.text stringByAppendingFormat:@"%@",[self.detailInfoArray objectAtIndex:indexPath.row+4]];
        }
        if (indexPath.section==0 && indexPath.row!=0)//设置独特的按钮,表示可以打电话
        {
            cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
        }

         return cell;
    }
    // Configure the cell...
    
   
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{//标题
    if (section==0) 
    {
        return @"基本信息";
    }
    else
    {
        return @"详细信息";
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![self.judge isEqualToString:@"wd"])//
    {
        if (indexPath.section==0 && indexPath.row!=0)//
        {
            NSString *telNumber=[self.detailInfoArray objectAtIndex:indexPath.row+1];
            if (telNumber.length==0)
            {
                return;//保护程序
            }
            //NSLog(@"%@",telNumber);
            UIWebView *callPhoneWebVw = [[UIWebView alloc] init];
            telNumber=[@"" stringByAppendingFormat:@"tel://%@",telNumber];
            //NSLog(@"%@",telNumber);
            NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:telNumber]];
            [callPhoneWebVw loadRequest:request];
            
            /*UIWebView *callIphoneView=[[UIWebView alloc] init];
            NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:telNumber]];
            [callIphoneView loadRequest:request];
            [callIphoneView release];//打电话
             */

        
        }
    }
}
#pragma mark -BuildingOwnTableCell
-(UITableViewCell *)buildingOwnTableCell:(UITableViewCell *)cell:(NSIndexPath*)indexPath//构建自己需要的cell
{
    UITextField *textLb;
    textLb=[[UITextField alloc] initWithFrame:CGRectMake(100, 10, cell.frame.size.width, cell.frame.size.height)];
    textLb.borderStyle=UITextBorderStyleNone; 
    textLb.delegate=self;
    if (indexPath.section==0) 
    {
        cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row];
        textLb.text=[self.detailInfoArray objectAtIndex:indexPath.row+1];
        textLb.tag=indexPath.row+1;
        //NSLog(@"%d",textLb.tag);
    }
    else
    {
        cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row+3];
        textLb.text=[self.detailInfoArray objectAtIndex:indexPath.row+4];
        textLb.tag=indexPath.row+4;
    }
    [cell addSubview:textLb];
    [textLb release];
    return cell;
}
#pragma mark - TextFiled  delege
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    index=textField.tag;
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    int indexTmp=textField.tag;
    [self.detailInfoArray replaceObjectAtIndex:indexTmp withObject:textField.text];
    //NSLog(@"%@",textField.text);
    return YES;
}
@end
