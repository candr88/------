//
//  IssueInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
#import "EGORefreshTableHeaderView.h"
@interface IssueInfoViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;//下拉刷新的界面 
	BOOL _reloading;//是否进行刷新数据
    BOOL refresh;//进行刷新
}
@property(nonatomic,retain)NSArray *issueInfoArray;

/*数据的处理*/
-(void)issueDataProcessing;//审批信息的数据处理

/*调用网络接口*/
-(void)getIssueInfo;//获取审批单的信息
-(NSString*)checkIssueState:(NSString*)issueId;//在进行审批前对表单状态进行审批


@end
