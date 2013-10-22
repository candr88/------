//
//  CollectLetterInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "LetterInfo.h"
#import "CoreData_Method.h"
#import "LIExposeController.h"
#import "EGORefreshTableHeaderView.h"
@interface CollectLetterInfoViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;//下拉刷新的界面
	BOOL _reloading;//是否进行刷新数据
}
@property(nonatomic,retain)CoreData_Method *coreDataMethod;//数据库处理方法
@property(nonatomic,retain)LetterInfo*letterInfo;//站内信的处理方式
/*从数据库里面获取数据*/
-(void)getInfoFromCoreData;
@end
