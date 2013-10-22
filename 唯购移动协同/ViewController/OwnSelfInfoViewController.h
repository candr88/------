//
//  OwnSelfInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface OwnSelfInfoViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate>
@property(nonatomic,retain)NSMutableArray * ownSelfInfoArray;//自己的好友信息
@property(nonatomic,retain)NSMutableArray * flagArray;//用于控制树状列表
@property(nonatomic,retain)NSMutableArray *groupTitleArray;//每个小组的好友信息
/*树状菜单的显示*/
-(int)numberCountOfSection:(NSInteger)section;
-(void)btnClick:(id)sender;//段头按钮点击响应事件
/*几个方法的集合*/
-(void)ownSelfdataProcessing;//所有数据的处理

/*添加好友到通讯录里面去*/
-(void)addFriendToContacts;

/*删除好友*/
-(void)delteContactsFromWeb:(NSString *)txlId;//调用web把数据删除
@end
