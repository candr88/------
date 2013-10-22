//
//  AddFriendViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "MyService.h"
#import "GlobalVar.h"
#import "ShowAlert.h"
#import "AddFriendViewController.h"

@implementation AddFriendViewController
@synthesize titleArray,groupTitleArray;
@synthesize detailInfoArray,pickerView;
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
                                               initWithTitle:NSLocalizedString(@"提交", @"提交")
                                               style:UIBarButtonItemStyleBordered
                                               target:self
                                               action:@selector(addFriendToWeb)] autorelease];
    }
    
    [self addFriendDataProcess];//数据的处理
}
-(void)addFriendDataProcess//数据的处理
{
    self.titleArray=[[NSArray alloc] initWithObjects:
                     @"小组名称:",
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
    self.detailInfoArray=[[NSMutableArray alloc] initWithObjects:
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     @"",
                     nil];}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.titleArray=nil;
    self.detailInfoArray=nil;
    self.groupTitleArray=nil;
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
    [detailInfoArray release];
    [titleArray release];
    [groupTitleArray release];
}
#pragma mark -WebServie
-(void)addFriendToWeb
{
    UITextField *textLb=(UITextField*)[self.view viewWithTag:index];
    if (textLb!=nil) //如果文本存在,把对应那个正在输入的键盘进行消除
    {
        [textLb resignFirstResponder];
    }
    //将最后那个修改的数据进行保持
    NSString *name=[self.detailInfoArray objectAtIndex:1];
    NSString *groupNameTmp=[self.detailInfoArray objectAtIndex:0];
    if (groupNameTmp.length==0) 
    {
        [ShowAlert showAlert:@"提醒" :@"小组未选择"];
        return;
    }
    if (name.length==0)
    {
        [ShowAlert showAlert:@"提醒" :@"名字未填写"];
        return;
    }
    NSString *groupIdTmp=[[[self.groupTitleArray objectAtIndex:pickerIndex]componentsSeparatedByString:@"@"]objectAtIndex:0];
    USBoolean * addContactsInfo;
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_AddTxl *request=[[MyService_AddTxl alloc] init];
    request.txlgroup_id=groupNameTmp;
    request.loginid=[[GlobalVar shareGlobalVar]loginId];
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
    MyServiceSoapBindingResponse *resp=[binding AddTxlUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_AddTxlResponse class]]) 
        {
            addContactsInfo=[mine AddTxlResult];
        }
    }
    if ([addContactsInfo.stringValue isEqualToString:@"true"])
    {
        [ShowAlert showAlert:@"成功了" :@"成功添加了数据"];
        
        NSMutableArray * ownselfInfoArrayTmp=[[GlobalVar shareGlobalVar]ownSelfInfoArray];
        for (int i=0; i<ownselfInfoArrayTmp.count; i++)
        {
            NSArray * txlInfoTmp=
                    [[[ownselfInfoArrayTmp objectAtIndex:i]objectAtIndex:0]componentsSeparatedByString:@"ψ"];//获取数据
            if ([[[[txlInfoTmp objectAtIndex:1 ]componentsSeparatedByString:@"@"] objectAtIndex:1] isEqualToString:groupIdTmp])
            {
                
            }
        }
        [self.navigationController  popViewControllerAnimated:YES];
    }
    else
    {
        [ShowAlert showAlert:@"失败了" :@"添加失败"];
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
        return 4;
    }
    else 
    {
        return 7;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil]autorelease];
    if (indexPath.row==0&&indexPath.section==0)
    {
        cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row];
        cell.textLabel.text=[cell.textLabel.text stringByAppendingFormat:@"   %@",[self.detailInfoArray objectAtIndex:0]];
        return cell;
    }
    cell=[self buildingOwnTableCell:cell :indexPath];
    //定义自已需要的Cell
    return cell;
    
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

#pragma mark -BuildingOwnTableCell
-(UITableViewCell *)buildingOwnTableCell:(UITableViewCell *)cell:(NSIndexPath*)indexPath//构建自己需要的cell
{
    UITextField * textLb=[[UITextField alloc] initWithFrame:CGRectMake(100, 10, cell.frame.size.width, cell.frame.size.height)];
    textLb.borderStyle=UITextBorderStyleNone; 
    textLb.delegate=self;
    if (indexPath.section==0) 
    {
        cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row];
        textLb.text=[self.detailInfoArray objectAtIndex:indexPath.row];
        textLb.tag=indexPath.row;//用于标记每个text
    }
    else
    {
        cell.textLabel.text=[self.titleArray objectAtIndex:indexPath.row+4];
        textLb.text=[self.detailInfoArray objectAtIndex:indexPath.row+4];
        textLb.tag=indexPath.row+4;
    }
    [cell addSubview:textLb];
    [textLb release];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0&&indexPath.section==0)
        //如果点击的是小组选择这个项,构建一个小组选择器
    {
         UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"小组选择\n\n\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"确定",nil];
        //创建一个UIActionSheet,用于放picker
        [actionSheet setActionSheetStyle:UIActionSheetStyleDefault];//样式
        
        pickerView=[[UIPickerView alloc] init];
        pickerView.delegate=self;
        pickerView.dataSource=self;
        pickerView.showsSelectionIndicator=YES;
        [actionSheet addSubview:pickerView];
        [actionSheet showInView:self.view.superview];
        [actionSheet release];
    }
}
#pragma amrk -ActionSheet delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex//actionsheet点击事件触发的事情
{
    if(buttonIndex==0)//点击了确定按钮
    {
        NSString *groupNameTmp=[[[self.groupTitleArray objectAtIndex:pickerIndex]componentsSeparatedByString:@"@"] objectAtIndex:1];//每个小组的名称
        [self.detailInfoArray replaceObjectAtIndex:0 withObject:groupNameTmp];
        [self.tableView reloadData];
        //NSLog(@"%d",pickerIndex);
    }
}
#pragma mark - TextFiled  delegate
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
#pragma mark pickerView delegate

//返回pickerview的组件数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView 
{    
    return 1;
}

//返回每个组件上的行数
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{    
	return  groupTitleArray.count;
}

//设置每行显示的内容
- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component 
{
    return [[[groupTitleArray objectAtIndex:row]componentsSeparatedByString:@"@"]objectAtIndex:1];
}
//当你选中pickerview的某行时会调用该函数。

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component 
{
	pickerIndex=row;//数据的传递,用于确定哪一行被选中
}


@end
