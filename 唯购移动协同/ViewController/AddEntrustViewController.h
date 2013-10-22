//
//  AddEntrustViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface AddEntrustViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
}
@property(nonatomic,retain)IBOutlet UITableView *staffTable;
@property(nonatomic,retain)NSMutableArray *staffInfoArray;
@property(nonatomic,retain)NSString * entrustId;//被委托人的iD
@property(nonatomic,retain)IBOutlet UILabel *errorLb;//错误信息
@property(nonatomic,retain)NSMutableArray*flagArray;//旗帜数组
@property(nonatomic,retain)NSString *entrustInfo;//委托的详细信息
/*添加委托*/
-(IBAction)addEntrustBtnClick:(id)sender;

/*数据的处理*/
-(void)addEntrustDataProcessing;//添加委托界面的所有数据的处理

/*树状菜单的显示*/
-(int)numberCountOfSection:(NSInteger)section;
-(void)btnClick:(id)sender;//段头按钮点击响应事件


@end
