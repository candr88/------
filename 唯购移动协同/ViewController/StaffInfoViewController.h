//
//  StaffInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface StaffInfoViewController : UITableViewController
<LIExposeControllerChildViewControllerDelegate>
@property(nonatomic,retain)NSArray * allTxtInfoArray;//所有联系人的信息
@property(nonatomic,retain)NSMutableArray * ownSelfInfoArray;//我自己的好友信息
@property(nonatomic,retain)NSMutableArray * staffInfoArray;//公司员工信息
@property(nonatomic,retain)NSMutableArray * flagArray;//用于控制树状列表
/*几个方法的集合*/
-(void)dataProcessing;//所有数据的处理

/*树状菜单的显示*/
-(int)numberCountOfSection:(NSInteger)section;
-(void)btnClick:(id)sender;//段头按钮点击响应事件

/*网络接口的调用*/
-(void)getAllStaffInfo;//获取全部的分组信息

/*数据的处理,分割*/
-(void)splitAllTxlInfo;//把数据分割成我的通讯录和公司通讯录
-(NSMutableArray*)splitDtTxlInfo:(NSMutableArray*)infoArray;//把数据分给成详细数据


/*数据库操作*/
-(void)storeInfoToCoreData;//把数据存放到数据库里面

-(NSArray*)getAllContactInfoFromWeb;//从网络上自己联系人的所有信息
-(NSArray*)getAllGsContactInfoFromWeb;//从网络上获取所有公司里面人的信息
-(void)checkInfoExiist;//检查数据是否存在
-(void)upcontactInfo;//更新数据
-(void)addInfoToCoreData;//把数据添加到数据库里面去

@end
