//
//  ReceiveLetterInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
#import "EGORefreshTableHeaderView.h"
@interface ReceiveLetterInfoViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate,EGORefreshTableHeaderDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;//下拉刷新的界面 
	BOOL _reloading;//是否进行刷新数据
}
@property(nonatomic,retain)NSMutableArray *recevieInfoArray;
@property(nonatomic)NSInteger  unReadLtrCount;//未读信件的数量
@property(nonatomic)NSInteger  startRow;//选择站内信从第几行开始获取
/*网络接口的调用*/
-(NSMutableArray *)getReceiveLetterInfo;//获取信件的信息
-(NSString*)msgRead:(NSString *)letterId;//把信件的未读信息进行更改

/*几个方法的集合*/
-(void)receiveLetterDataProcessing;//所有数据的处理

/*获取未读信件的数量*/
-(void)getUnReadLettetCount;

/*界面的刷新*/
-(void)reFreashView;//刷新界面

/*点击加载更多的项*/
-(void)addMoreLetterInfoToArray;//把取处理的数据
-(void)addMoreLetterToTable:(NSMutableArray *)letteraddArray;
//调用主线程把数据添加到主线程里面去

/*未读信件的处理*/
-(void)unReadLetterProcessing:(NSString *)letterId;

@end
