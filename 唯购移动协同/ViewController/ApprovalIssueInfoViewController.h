//
//  ApprovalIssueInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface ApprovalIssueInfoViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate>
@property(nonatomic,retain)NSArray * approvalArray;

/*数据处理*/
-(void)approvaHistoryDataProcessing;//申请历史列表
/*调用网络接口*/
-(void)getApprovaHistory;//获取历史申请的信息
@end
