//
//  EntrustViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface EntrustViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate>
{
    BOOL flag;//判断刷新
}
@property(nonatomic,retain)NSString *entrstInfoString;//委托处理信息
/*数据处理*/
-(void)handleEntrustData;

/*网络请求*/
-(void)getEntrustInfo;//从网络里获取数据
-(void)cancelEntrust;//取消委托

/*跳转到添加委托的界面*/
-(void)jumpToAddEntrustViewCtr;
@end
