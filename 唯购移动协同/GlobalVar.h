//
//  GlobalVar.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalVar : UIViewController
@property(nonatomic,retain)NSString *servcieUrl;//网址
@property(nonatomic,retain)NSString *loginId;//登陆ID
@property(nonatomic,retain)NSString *serviceTime;//获取服务器端现在的时间
@property(nonatomic,retain)NSMutableArray *ownSelfInfoArray;//我的好友信息
@property(nonatomic,retain)NSMutableArray *staffInfoArray;//员工信息
@property(nonatomic,retain)NSString *entrustInfo;
+(GlobalVar*)shareGlobalVar;//对全局变量进行初始化和检查
@end
