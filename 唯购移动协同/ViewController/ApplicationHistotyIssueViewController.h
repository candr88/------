//
//  ApplicationHistotyIssueViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface ApplicationHistotyIssueViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate>
@property(nonatomic,retain)NSArray * applicationArray;//申请历史列表

/*数据处理*/
-(void)applicationHistoryDataProcessing;//获取数据
/*调用网络接口*/
-(void)getApplicationHistory;//获取历史申请的信息
@end
