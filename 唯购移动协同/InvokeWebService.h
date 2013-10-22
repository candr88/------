//
//  InvokeWebService.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
//为一些被重复调用的接口而写
@interface InvokeWebService : NSObject
-(NSArray *)getOneTxlDtInfo:(NSString *)user_Id:(NSString *)type;//获取一个联系人的详细信息
-(void)getServceTime;//获取服务器上面的时间

@end
