//
//  GlobalVar.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GlobalVar.h"

@implementation GlobalVar
@synthesize servcieUrl,loginId;
@synthesize ownSelfInfoArray,staffInfoArray;
@synthesize serviceTime,entrustInfo;
+(GlobalVar*)shareGlobalVar
{
    static GlobalVar *globalVar;//定义一个静态全局变量
    @synchronized(self)//线程锁.防止数据被多线程操作而引起崩溃
    {
        if(!globalVar)
            globalVar=[[GlobalVar alloc] init];
            return globalVar;
    }
}
-(id)init//数据的初始化
{
    if (self=[super init])
    {
        servcieUrl=@"http://wztx2007.gnway.net:8090/WebService/MyService.asmx?";
        //@"http://192.168.1.115/WebService/MyService.asmx?"
        
    }
    return self;
}
-(void)dealloc
{
    /*数据的清理*/
    [servcieUrl release];
    [loginId release];
    [ownSelfInfoArray release];
    [staffInfoArray release];
    [serviceTime release];
    [entrustInfo release];
    [super dealloc];
}
@end
