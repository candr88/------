//
//  InvokeWebService.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyService.h"
#import "GlobalVar.h"
#import "InvokeWebService.h"
@implementation InvokeWebService
-(NSArray *)getOneTxlDtInfo:(NSString *)user_Id:(NSString *)type;//获取一个联系人的详细信息
{
    NSArray *detailInfoArrayTmp=[[[NSArray alloc] init] autorelease];
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetTxlByTxlId *request=[[MyService_GetTxlByTxlId alloc] init];
    request.txl_id=user_Id;//数据的传入
    request.type=type;
    MyServiceSoapBindingResponse *resp=[binding 
                                        GetTxlByTxlIdUsingParameters:request];
    
    for (id mine in resp.bodyParts )
    {//获取数据,然后进行数据的分割
        if ([mine isKindOfClass:[MyService_GetTxlByTxlIdResponse class]])
        {
            detailInfoArrayTmp=[[mine GetTxlByTxlIdResult] componentsSeparatedByString:@"ψ"];
        }
    }
    return detailInfoArrayTmp;
}
-(void)getServceTime//获取服务器的时间
{
    NSString *serviceTimeTmp=[[NSString alloc]init];//服务器上的时间信息
    MyServiceSoapBinding *binding=[[MyService MyServiceSoapBinding] initWithAddress:[[GlobalVar shareGlobalVar]servcieUrl]];
    binding.logXMLInOut=YES;
    MyService_GetServerTime *request=[[MyService_GetServerTime alloc] init];
    MyServiceSoapBindingResponse *resp=
                                [binding GetServerTimeUsingParameters:request];
    for (id mine in resp.bodyParts)
    {
        if ([mine isKindOfClass:[MyService_GetServerTimeResponse class]])
        {
            serviceTimeTmp=[mine GetServerTimeResult];
        }
    }
    [[GlobalVar shareGlobalVar]setServiceTime:serviceTimeTmp];
    [request release];
    [serviceTimeTmp release];//内存释放.好孩子
}
@end
