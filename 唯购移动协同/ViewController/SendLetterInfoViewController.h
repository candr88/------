//
//  SendLetterInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
#import "EGORefreshTableHeaderView.h"
@interface SendLetterInfoViewController : UITableViewController
<LIExposeControllerChildViewControllerDelegate,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;//下拉刷新的界面 
	BOOL _reloading;//是否进行刷新数据

}
@property(nonatomic,retain)NSMutableArray *sendLetterInfoArray;//已发站内信列表
@property(nonatomic)NSInteger startRow;//开始的那一列
/*网络接口的调用*/
-(NSMutableArray*)getSendLetterInfo;//获取信件的信息

/*几个方法的集合*/
-(void)dataProcessing;//所有数据的处理

/*点击加载更多的项*/
-(void)addMoreLetterInfoToArray;//把取处理的数据
-(void)addMoreLetterToTable:(NSMutableArray *)letteraddArray;//调用主线程把数据添加到主线程里面去

@end
