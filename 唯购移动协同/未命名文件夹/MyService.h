#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class MyService_Login;
@class MyService_LoginResponse;
@class MyService_GetServerTime;
@class MyService_GetServerTimeResponse;
@class MyService_GetUserInfo;
@class MyService_GetUserInfoResponse;
@class MyService_GetUserInfo2;
@class MyService_GetUserInfo2Response;
@class MyService_GetUserInfoById;
@class MyService_GetUserInfoByIdResponse;
@class MyService_GetUserInfoByLoginId;
@class MyService_GetUserInfoByLoginIdResponse;
@class MyService_GetWFStartList;
@class MyService_GetWFStartListResponse;
@class MyService_GetWFFinishList;
@class MyService_GetWFFinishListResponse;
@class MyService_GetCurTaskList;
@class MyService_GetCurTaskListResponse;
@class MyService_GetNextStep;
@class MyService_GetNextStepResponse;
@class MyService_GetClrList;
@class MyService_GetClrListResponse;
@class MyService_DoProcess;
@class MyService_DoProcessResponse;
@class MyService_GetTaskState;
@class MyService_GetTaskStateResponse;
@class MyService_WFDelegCancel;
@class MyService_WFDelegCancelResponse;
@class MyService_WFDelegAdd;
@class MyService_WFDelegAddResponse;
@class MyService_WFDelegGetCurStr;
@class MyService_WFDelegGetCurStrResponse;
@class MyService_GetAllTxl;
@class MyService_GetAllTxlResponse;
@class MyService_GetAllTxlDetial;
@class MyService_GetAllTxlDetialResponse;
@class MyService_GetAllTxlGsDetial;
@class MyService_GetAllTxlGsDetialResponse;
@class MyService_GetTxlByGroupId;
@class MyService_GetTxlByGroupIdResponse;
@class MyService_GetTxlByTxlId;
@class MyService_GetTxlByTxlIdResponse;
@class MyService_AddGroup;
@class MyService_AddGroupResponse;
@class MyService_DelGroup;
@class MyService_DelGroupResponse;
@class MyService_UpdateGroup;
@class MyService_UpdateGroupResponse;
@class MyService_AddTxl;
@class MyService_AddTxlResponse;
@class MyService_DelTxl;
@class MyService_DelTxlResponse;
@class MyService_UpdateTxl;
@class MyService_UpdateTxlResponse;
@class MyService_MsgReceiveList;
@class MyService_MsgReceiveListResponse;
@class MyService_MsgSendList;
@class MyService_MsgSendListResponse;
@class MyService_MsgRead;
@class MyService_MsgReadResponse;
@class MyService_DoMsgRead;
@class MyService_DoMsgReadResponse;
@class MyService_MsgMx;
@class MyService_MsgMxResponse;
@class MyService_MsgReceiversList;
@class MyService_MsgReceiversListResponse;
@class MyService_MsgSend;
@class MyService_MsgSendResponse;
@class MyService_MsgDownLoadFile;
@class MyService_MsgDownLoadFileResponse;
@class MyService_MailSend;
@class MyService_MailSendResponse;
@class MyService_GetMyFolderlist;
@class MyService_GetMyFolderlistResponse;
@class MyService_GetMyFilelist;
@class MyService_GetMyFilelistResponse;
@class MyService_GetSharedFilelist;
@class MyService_GetSharedFilelistResponse;
@class MyService_FileShare;
@class MyService_FileShareResponse;
@class MyService_DownLoadFile;
@class MyService_DownLoadFileResponse;
@interface MyService_Login : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * loginpsw;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_Login *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * loginpsw;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_LoginResponse : NSObject {
	
/* elements */
	USBoolean * LoginResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_LoginResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * LoginResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetServerTime : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetServerTime *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetServerTimeResponse : NSObject {
	
/* elements */
	NSString * GetServerTimeResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetServerTimeResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetServerTimeResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfo : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfo *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfoResponse : NSObject {
	
/* elements */
	NSString * GetUserInfoResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfoResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetUserInfoResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfo2 : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfo2 *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfo2Response : NSObject {
	
/* elements */
	NSString * GetUserInfo2Result;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfo2Response *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetUserInfo2Result;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfoById : NSObject {
	
/* elements */
	NSString * userid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfoById *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * userid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfoByIdResponse : NSObject {
	
/* elements */
	NSString * GetUserInfoByIdResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfoByIdResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetUserInfoByIdResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfoByLoginId : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * loginpsw;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfoByLoginId *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * loginpsw;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetUserInfoByLoginIdResponse : NSObject {
	
/* elements */
	NSString * GetUserInfoByLoginIdResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetUserInfoByLoginIdResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetUserInfoByLoginIdResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetWFStartList : NSObject {
	
/* elements */
	NSString * loginid;
	NSNumber * firstRecorder;
	NSNumber * rowLength;
	NSString * clrid;
	NSString * wfname;
	NSString * stime;
	NSString * etime;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetWFStartList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSNumber * firstRecorder;
@property (retain) NSNumber * rowLength;
@property (retain) NSString * clrid;
@property (retain) NSString * wfname;
@property (retain) NSString * stime;
@property (retain) NSString * etime;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetWFStartListResponse : NSObject {
	
/* elements */
	NSString * GetWFStartListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetWFStartListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetWFStartListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetWFFinishList : NSObject {
	
/* elements */
	NSString * loginid;
	NSNumber * firstRecorder;
	NSNumber * rowLength;
	NSString * clrid;
	NSString * wfname;
	NSString * stime;
	NSString * etime;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetWFFinishList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSNumber * firstRecorder;
@property (retain) NSNumber * rowLength;
@property (retain) NSString * clrid;
@property (retain) NSString * wfname;
@property (retain) NSString * stime;
@property (retain) NSString * etime;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetWFFinishListResponse : NSObject {
	
/* elements */
	NSString * GetWFFinishListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetWFFinishListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetWFFinishListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetCurTaskList : NSObject {
	
/* elements */
	NSString * loginid;
	NSNumber * firstRecorder;
	NSNumber * rowLength;
	NSString * clrid;
	NSString * wfname;
	NSString * stime;
	NSString * etime;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetCurTaskList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSNumber * firstRecorder;
@property (retain) NSNumber * rowLength;
@property (retain) NSString * clrid;
@property (retain) NSString * wfname;
@property (retain) NSString * stime;
@property (retain) NSString * etime;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetCurTaskListResponse : NSObject {
	
/* elements */
	NSString * GetCurTaskListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetCurTaskListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetCurTaskListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetNextStep : NSObject {
	
/* elements */
	NSString * task_id;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetNextStep *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * task_id;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetNextStepResponse : NSObject {
	
/* elements */
	NSString * GetNextStepResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetNextStepResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetNextStepResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetClrList : NSObject {
	
/* elements */
	NSString * task_id;
	NSString * processvalue;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetClrList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * task_id;
@property (retain) NSString * processvalue;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetClrListResponse : NSObject {
	
/* elements */
	NSString * GetClrListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetClrListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetClrListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DoProcess : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * task_id;
	NSString * processname;
	NSString * processvalue;
	NSString * processclyj;
	NSString * clrids;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DoProcess *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * task_id;
@property (retain) NSString * processname;
@property (retain) NSString * processvalue;
@property (retain) NSString * processclyj;
@property (retain) NSString * clrids;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DoProcessResponse : NSObject {
	
/* elements */
	NSString * DoProcessResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DoProcessResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * DoProcessResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetTaskState : NSObject {
	
/* elements */
	NSString * task_id;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetTaskState *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * task_id;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetTaskStateResponse : NSObject {
	
/* elements */
	USBoolean * GetTaskStateResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetTaskStateResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * GetTaskStateResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_WFDelegCancel : NSObject {
	
/* elements */
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_WFDelegCancel *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_WFDelegCancelResponse : NSObject {
	
/* elements */
	USBoolean * WFDelegCancelResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_WFDelegCancelResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * WFDelegCancelResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_WFDelegAdd : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * deleg_str_id;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_WFDelegAdd *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * deleg_str_id;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_WFDelegAddResponse : NSObject {
	
/* elements */
	USBoolean * WFDelegAddResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_WFDelegAddResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * WFDelegAddResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_WFDelegGetCurStr : NSObject {
	
/* elements */
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_WFDelegGetCurStr *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_WFDelegGetCurStrResponse : NSObject {
	
/* elements */
	NSString * WFDelegGetCurStrResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_WFDelegGetCurStrResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * WFDelegGetCurStrResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetAllTxl : NSObject {
	
/* elements */
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetAllTxl *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetAllTxlResponse : NSObject {
	
/* elements */
	NSString * GetAllTxlResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetAllTxlResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetAllTxlResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetAllTxlDetial : NSObject {
	
/* elements */
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetAllTxlDetial *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetAllTxlDetialResponse : NSObject {
	
/* elements */
	NSString * GetAllTxlDetialResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetAllTxlDetialResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetAllTxlDetialResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetAllTxlGsDetial : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetAllTxlGsDetial *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetAllTxlGsDetialResponse : NSObject {
	
/* elements */
	NSString * GetAllTxlGsDetialResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetAllTxlGsDetialResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetAllTxlGsDetialResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetTxlByGroupId : NSObject {
	
/* elements */
	NSString * txlgroup_id;
	NSString * type;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetTxlByGroupId *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txlgroup_id;
@property (retain) NSString * type;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetTxlByGroupIdResponse : NSObject {
	
/* elements */
	NSString * GetTxlByGroupIdResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetTxlByGroupIdResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetTxlByGroupIdResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetTxlByTxlId : NSObject {
	
/* elements */
	NSString * txl_id;
	NSString * type;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetTxlByTxlId *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txl_id;
@property (retain) NSString * type;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetTxlByTxlIdResponse : NSObject {
	
/* elements */
	NSString * GetTxlByTxlIdResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetTxlByTxlIdResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetTxlByTxlIdResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_AddGroup : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * txlgroup_name;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_AddGroup *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * txlgroup_name;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_AddGroupResponse : NSObject {
	
/* elements */
	USBoolean * AddGroupResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_AddGroupResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * AddGroupResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DelGroup : NSObject {
	
/* elements */
	NSString * txlgroup_id;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DelGroup *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txlgroup_id;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DelGroupResponse : NSObject {
	
/* elements */
	USBoolean * DelGroupResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DelGroupResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * DelGroupResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_UpdateGroup : NSObject {
	
/* elements */
	NSString * txlgroup_id;
	NSString * txlgroup_name;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_UpdateGroup *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txlgroup_id;
@property (retain) NSString * txlgroup_name;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_UpdateGroupResponse : NSObject {
	
/* elements */
	USBoolean * UpdateGroupResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_UpdateGroupResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * UpdateGroupResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_AddTxl : NSObject {
	
/* elements */
	NSString * txl_name;
	NSString * txl_cellphone;
	NSString * txl_telephone;
	NSString * txl_address;
	NSString * txl_email;
	NSString * txl_QQ;
	NSString * txl_fax;
	NSString * txl_dept;
	NSString * txl_duty;
	NSString * txl_descn;
	NSString * txlgroup_id;
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_AddTxl *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txl_name;
@property (retain) NSString * txl_cellphone;
@property (retain) NSString * txl_telephone;
@property (retain) NSString * txl_address;
@property (retain) NSString * txl_email;
@property (retain) NSString * txl_QQ;
@property (retain) NSString * txl_fax;
@property (retain) NSString * txl_dept;
@property (retain) NSString * txl_duty;
@property (retain) NSString * txl_descn;
@property (retain) NSString * txlgroup_id;
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_AddTxlResponse : NSObject {
	
/* elements */
	USBoolean * AddTxlResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_AddTxlResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * AddTxlResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DelTxl : NSObject {
	
/* elements */
	NSString * txl_id;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DelTxl *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txl_id;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DelTxlResponse : NSObject {
	
/* elements */
	USBoolean * DelTxlResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DelTxlResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * DelTxlResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_UpdateTxl : NSObject {
	
/* elements */
	NSString * txl_id;
	NSString * txl_name;
	NSString * txl_cellphone;
	NSString * txl_telephone;
	NSString * txl_address;
	NSString * txl_email;
	NSString * txl_QQ;
	NSString * txl_fax;
	NSString * txl_dept;
	NSString * txl_duty;
	NSString * txl_descn;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_UpdateTxl *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * txl_id;
@property (retain) NSString * txl_name;
@property (retain) NSString * txl_cellphone;
@property (retain) NSString * txl_telephone;
@property (retain) NSString * txl_address;
@property (retain) NSString * txl_email;
@property (retain) NSString * txl_QQ;
@property (retain) NSString * txl_fax;
@property (retain) NSString * txl_dept;
@property (retain) NSString * txl_duty;
@property (retain) NSString * txl_descn;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_UpdateTxlResponse : NSObject {
	
/* elements */
	USBoolean * UpdateTxlResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_UpdateTxlResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * UpdateTxlResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgReceiveList : NSObject {
	
/* elements */
	NSString * loginid;
	NSNumber * firstRecorder;
	NSNumber * rowLength;
	NSString * title;
	NSString * content;
	NSString * stime;
	NSString * etime;
	NSString * readflag;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgReceiveList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSNumber * firstRecorder;
@property (retain) NSNumber * rowLength;
@property (retain) NSString * title;
@property (retain) NSString * content;
@property (retain) NSString * stime;
@property (retain) NSString * etime;
@property (retain) NSString * readflag;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgReceiveListResponse : NSObject {
	
/* elements */
	NSString * MsgReceiveListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgReceiveListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MsgReceiveListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgSendList : NSObject {
	
/* elements */
	NSString * loginid;
	NSNumber * firstRecorder;
	NSNumber * rowLength;
	NSString * title;
	NSString * content;
	NSString * stime;
	NSString * etime;
	NSString * readflag;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgSendList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSNumber * firstRecorder;
@property (retain) NSNumber * rowLength;
@property (retain) NSString * title;
@property (retain) NSString * content;
@property (retain) NSString * stime;
@property (retain) NSString * etime;
@property (retain) NSString * readflag;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgSendListResponse : NSObject {
	
/* elements */
	NSString * MsgSendListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgSendListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MsgSendListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgRead : NSObject {
	
/* elements */
	NSString * msg_id;
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgRead *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * msg_id;
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgReadResponse : NSObject {
	
/* elements */
	USBoolean * MsgReadResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgReadResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * MsgReadResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DoMsgRead : NSObject {
	
/* elements */
	NSString * msg_ids;
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DoMsgRead *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * msg_ids;
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DoMsgReadResponse : NSObject {
	
/* elements */
	USBoolean * DoMsgReadResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DoMsgReadResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * DoMsgReadResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgMx : NSObject {
	
/* elements */
	NSString * msg_id;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgMx *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * msg_id;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgMxResponse : NSObject {
	
/* elements */
	NSString * MsgMxResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgMxResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MsgMxResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgReceiversList : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgReceiversList *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgReceiversListResponse : NSObject {
	
/* elements */
	NSString * MsgReceiversListResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgReceiversListResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MsgReceiversListResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgSend : NSObject {
	
/* elements */
	NSString * msg_title;
	NSString * msg_content;
	NSString * receiver_ids;
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgSend *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * msg_title;
@property (retain) NSString * msg_content;
@property (retain) NSString * receiver_ids;
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgSendResponse : NSObject {
	
/* elements */
	NSString * MsgSendResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgSendResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MsgSendResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgDownLoadFile : NSObject {
	
/* elements */
	NSString * filename;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgDownLoadFile *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * filename;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MsgDownLoadFileResponse : NSObject {
	
/* elements */
	NSString * MsgDownLoadFileResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MsgDownLoadFileResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MsgDownLoadFileResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MailSend : NSObject {
	
/* elements */
	NSString * mailFrom;
	NSString * userName;
	NSString * mailTo;
	NSString * subject;
	NSString * text;
	NSString * password;
	NSString * attachment;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MailSend *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * mailFrom;
@property (retain) NSString * userName;
@property (retain) NSString * mailTo;
@property (retain) NSString * subject;
@property (retain) NSString * text;
@property (retain) NSString * password;
@property (retain) NSString * attachment;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_MailSendResponse : NSObject {
	
/* elements */
	NSString * MailSendResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_MailSendResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * MailSendResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetMyFolderlist : NSObject {
	
/* elements */
	NSString * loginid;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetMyFolderlist *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetMyFolderlistResponse : NSObject {
	
/* elements */
	NSString * GetMyFolderlistResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetMyFolderlistResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetMyFolderlistResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetMyFilelist : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * keyword;
	NSNumber * firstRecorder;
	NSNumber * rowLength;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetMyFilelist *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * keyword;
@property (retain) NSNumber * firstRecorder;
@property (retain) NSNumber * rowLength;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetMyFilelistResponse : NSObject {
	
/* elements */
	NSString * GetMyFilelistResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetMyFilelistResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetMyFilelistResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetSharedFilelist : NSObject {
	
/* elements */
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetSharedFilelist *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_GetSharedFilelistResponse : NSObject {
	
/* elements */
	NSString * GetSharedFilelistResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_GetSharedFilelistResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GetSharedFilelistResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_FileShare : NSObject {
	
/* elements */
	NSString * fileid;
	USBoolean * shareflag;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_FileShare *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * fileid;
@property (retain) USBoolean * shareflag;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_FileShareResponse : NSObject {
	
/* elements */
	USBoolean * FileShareResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_FileShareResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) USBoolean * FileShareResult;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DownLoadFile : NSObject {
	
/* elements */
	NSString * loginid;
	NSString * fileid;
	NSString * filename;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DownLoadFile *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * loginid;
@property (retain) NSString * fileid;
@property (retain) NSString * filename;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface MyService_DownLoadFileResponse : NSObject {
	
/* elements */
	NSString * DownLoadFileResult;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (MyService_DownLoadFileResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * DownLoadFileResult;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "MyService.h"
@class MyServiceSoapBinding;
@class MyServiceSoap12Binding;
@interface MyService : NSObject {
	
}
+ (MyServiceSoapBinding *)MyServiceSoapBinding;
+ (MyServiceSoap12Binding *)MyServiceSoap12Binding;
@end
@class MyServiceSoapBindingResponse;
@class MyServiceSoapBindingOperation;
@protocol MyServiceSoapBindingResponseDelegate <NSObject>
- (void) operation:(MyServiceSoapBindingOperation *)operation completedWithResponse:(MyServiceSoapBindingResponse *)response;
@end
@interface MyServiceSoapBinding : NSObject <MyServiceSoapBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(MyServiceSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (MyServiceSoapBindingResponse *)LoginUsingParameters:(MyService_Login *)aParameters ;
- (void)LoginAsyncUsingParameters:(MyService_Login *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetServerTimeUsingParameters:(MyService_GetServerTime *)aParameters ;
- (void)GetServerTimeAsyncUsingParameters:(MyService_GetServerTime *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetUserInfoUsingParameters:(MyService_GetUserInfo *)aParameters ;
- (void)GetUserInfoAsyncUsingParameters:(MyService_GetUserInfo *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetUserInfo2UsingParameters:(MyService_GetUserInfo2 *)aParameters ;
- (void)GetUserInfo2AsyncUsingParameters:(MyService_GetUserInfo2 *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetUserInfoByIdUsingParameters:(MyService_GetUserInfoById *)aParameters ;
- (void)GetUserInfoByIdAsyncUsingParameters:(MyService_GetUserInfoById *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetUserInfoByLoginIdUsingParameters:(MyService_GetUserInfoByLoginId *)aParameters ;
- (void)GetUserInfoByLoginIdAsyncUsingParameters:(MyService_GetUserInfoByLoginId *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetWFStartListUsingParameters:(MyService_GetWFStartList *)aParameters ;
- (void)GetWFStartListAsyncUsingParameters:(MyService_GetWFStartList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetWFFinishListUsingParameters:(MyService_GetWFFinishList *)aParameters ;
- (void)GetWFFinishListAsyncUsingParameters:(MyService_GetWFFinishList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetCurTaskListUsingParameters:(MyService_GetCurTaskList *)aParameters ;
- (void)GetCurTaskListAsyncUsingParameters:(MyService_GetCurTaskList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetNextStepUsingParameters:(MyService_GetNextStep *)aParameters ;
- (void)GetNextStepAsyncUsingParameters:(MyService_GetNextStep *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetClrListUsingParameters:(MyService_GetClrList *)aParameters ;
- (void)GetClrListAsyncUsingParameters:(MyService_GetClrList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)DoProcessUsingParameters:(MyService_DoProcess *)aParameters ;
- (void)DoProcessAsyncUsingParameters:(MyService_DoProcess *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetTaskStateUsingParameters:(MyService_GetTaskState *)aParameters ;
- (void)GetTaskStateAsyncUsingParameters:(MyService_GetTaskState *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)WFDelegCancelUsingParameters:(MyService_WFDelegCancel *)aParameters ;
- (void)WFDelegCancelAsyncUsingParameters:(MyService_WFDelegCancel *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)WFDelegAddUsingParameters:(MyService_WFDelegAdd *)aParameters ;
- (void)WFDelegAddAsyncUsingParameters:(MyService_WFDelegAdd *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)WFDelegGetCurStrUsingParameters:(MyService_WFDelegGetCurStr *)aParameters ;
- (void)WFDelegGetCurStrAsyncUsingParameters:(MyService_WFDelegGetCurStr *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetAllTxlUsingParameters:(MyService_GetAllTxl *)aParameters ;
- (void)GetAllTxlAsyncUsingParameters:(MyService_GetAllTxl *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetAllTxlDetialUsingParameters:(MyService_GetAllTxlDetial *)aParameters ;
- (void)GetAllTxlDetialAsyncUsingParameters:(MyService_GetAllTxlDetial *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetAllTxlGsDetialUsingParameters:(MyService_GetAllTxlGsDetial *)aParameters ;
- (void)GetAllTxlGsDetialAsyncUsingParameters:(MyService_GetAllTxlGsDetial *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetTxlByGroupIdUsingParameters:(MyService_GetTxlByGroupId *)aParameters ;
- (void)GetTxlByGroupIdAsyncUsingParameters:(MyService_GetTxlByGroupId *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetTxlByTxlIdUsingParameters:(MyService_GetTxlByTxlId *)aParameters ;
- (void)GetTxlByTxlIdAsyncUsingParameters:(MyService_GetTxlByTxlId *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)AddGroupUsingParameters:(MyService_AddGroup *)aParameters ;
- (void)AddGroupAsyncUsingParameters:(MyService_AddGroup *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)DelGroupUsingParameters:(MyService_DelGroup *)aParameters ;
- (void)DelGroupAsyncUsingParameters:(MyService_DelGroup *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)UpdateGroupUsingParameters:(MyService_UpdateGroup *)aParameters ;
- (void)UpdateGroupAsyncUsingParameters:(MyService_UpdateGroup *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)AddTxlUsingParameters:(MyService_AddTxl *)aParameters ;
- (void)AddTxlAsyncUsingParameters:(MyService_AddTxl *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)DelTxlUsingParameters:(MyService_DelTxl *)aParameters ;
- (void)DelTxlAsyncUsingParameters:(MyService_DelTxl *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)UpdateTxlUsingParameters:(MyService_UpdateTxl *)aParameters ;
- (void)UpdateTxlAsyncUsingParameters:(MyService_UpdateTxl *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgReceiveListUsingParameters:(MyService_MsgReceiveList *)aParameters ;
- (void)MsgReceiveListAsyncUsingParameters:(MyService_MsgReceiveList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgSendListUsingParameters:(MyService_MsgSendList *)aParameters ;
- (void)MsgSendListAsyncUsingParameters:(MyService_MsgSendList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgReadUsingParameters:(MyService_MsgRead *)aParameters ;
- (void)MsgReadAsyncUsingParameters:(MyService_MsgRead *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)DoMsgReadUsingParameters:(MyService_DoMsgRead *)aParameters ;
- (void)DoMsgReadAsyncUsingParameters:(MyService_DoMsgRead *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgMxUsingParameters:(MyService_MsgMx *)aParameters ;
- (void)MsgMxAsyncUsingParameters:(MyService_MsgMx *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgReceiversListUsingParameters:(MyService_MsgReceiversList *)aParameters ;
- (void)MsgReceiversListAsyncUsingParameters:(MyService_MsgReceiversList *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgSendUsingParameters:(MyService_MsgSend *)aParameters ;
- (void)MsgSendAsyncUsingParameters:(MyService_MsgSend *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MsgDownLoadFileUsingParameters:(MyService_MsgDownLoadFile *)aParameters ;
- (void)MsgDownLoadFileAsyncUsingParameters:(MyService_MsgDownLoadFile *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)MailSendUsingParameters:(MyService_MailSend *)aParameters ;
- (void)MailSendAsyncUsingParameters:(MyService_MailSend *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetMyFolderlistUsingParameters:(MyService_GetMyFolderlist *)aParameters ;
- (void)GetMyFolderlistAsyncUsingParameters:(MyService_GetMyFolderlist *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetMyFilelistUsingParameters:(MyService_GetMyFilelist *)aParameters ;
- (void)GetMyFilelistAsyncUsingParameters:(MyService_GetMyFilelist *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)GetSharedFilelistUsingParameters:(MyService_GetSharedFilelist *)aParameters ;
- (void)GetSharedFilelistAsyncUsingParameters:(MyService_GetSharedFilelist *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)FileShareUsingParameters:(MyService_FileShare *)aParameters ;
- (void)FileShareAsyncUsingParameters:(MyService_FileShare *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
- (MyServiceSoapBindingResponse *)DownLoadFileUsingParameters:(MyService_DownLoadFile *)aParameters ;
- (void)DownLoadFileAsyncUsingParameters:(MyService_DownLoadFile *)aParameters  delegate:(id<MyServiceSoapBindingResponseDelegate>)responseDelegate;
@end
@interface MyServiceSoapBindingOperation : NSOperation {
	MyServiceSoapBinding *binding;
	MyServiceSoapBindingResponse *response;
	id<MyServiceSoapBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) MyServiceSoapBinding *binding;
@property (readonly) MyServiceSoapBindingResponse *response;
@property (nonatomic, assign) id<MyServiceSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate;
@end
@interface MyServiceSoapBinding_Login : MyServiceSoapBindingOperation {
	MyService_Login * parameters;
}
@property (retain) MyService_Login * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_Login *)aParameters
;
@end
@interface MyServiceSoapBinding_GetServerTime : MyServiceSoapBindingOperation {
	MyService_GetServerTime * parameters;
}
@property (retain) MyService_GetServerTime * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetServerTime *)aParameters
;
@end
@interface MyServiceSoapBinding_GetUserInfo : MyServiceSoapBindingOperation {
	MyService_GetUserInfo * parameters;
}
@property (retain) MyService_GetUserInfo * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfo *)aParameters
;
@end
@interface MyServiceSoapBinding_GetUserInfo2 : MyServiceSoapBindingOperation {
	MyService_GetUserInfo2 * parameters;
}
@property (retain) MyService_GetUserInfo2 * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfo2 *)aParameters
;
@end
@interface MyServiceSoapBinding_GetUserInfoById : MyServiceSoapBindingOperation {
	MyService_GetUserInfoById * parameters;
}
@property (retain) MyService_GetUserInfoById * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfoById *)aParameters
;
@end
@interface MyServiceSoapBinding_GetUserInfoByLoginId : MyServiceSoapBindingOperation {
	MyService_GetUserInfoByLoginId * parameters;
}
@property (retain) MyService_GetUserInfoByLoginId * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfoByLoginId *)aParameters
;
@end
@interface MyServiceSoapBinding_GetWFStartList : MyServiceSoapBindingOperation {
	MyService_GetWFStartList * parameters;
}
@property (retain) MyService_GetWFStartList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetWFStartList *)aParameters
;
@end
@interface MyServiceSoapBinding_GetWFFinishList : MyServiceSoapBindingOperation {
	MyService_GetWFFinishList * parameters;
}
@property (retain) MyService_GetWFFinishList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetWFFinishList *)aParameters
;
@end
@interface MyServiceSoapBinding_GetCurTaskList : MyServiceSoapBindingOperation {
	MyService_GetCurTaskList * parameters;
}
@property (retain) MyService_GetCurTaskList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetCurTaskList *)aParameters
;
@end
@interface MyServiceSoapBinding_GetNextStep : MyServiceSoapBindingOperation {
	MyService_GetNextStep * parameters;
}
@property (retain) MyService_GetNextStep * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetNextStep *)aParameters
;
@end
@interface MyServiceSoapBinding_GetClrList : MyServiceSoapBindingOperation {
	MyService_GetClrList * parameters;
}
@property (retain) MyService_GetClrList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetClrList *)aParameters
;
@end
@interface MyServiceSoapBinding_DoProcess : MyServiceSoapBindingOperation {
	MyService_DoProcess * parameters;
}
@property (retain) MyService_DoProcess * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_DoProcess *)aParameters
;
@end
@interface MyServiceSoapBinding_GetTaskState : MyServiceSoapBindingOperation {
	MyService_GetTaskState * parameters;
}
@property (retain) MyService_GetTaskState * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetTaskState *)aParameters
;
@end
@interface MyServiceSoapBinding_WFDelegCancel : MyServiceSoapBindingOperation {
	MyService_WFDelegCancel * parameters;
}
@property (retain) MyService_WFDelegCancel * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_WFDelegCancel *)aParameters
;
@end
@interface MyServiceSoapBinding_WFDelegAdd : MyServiceSoapBindingOperation {
	MyService_WFDelegAdd * parameters;
}
@property (retain) MyService_WFDelegAdd * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_WFDelegAdd *)aParameters
;
@end
@interface MyServiceSoapBinding_WFDelegGetCurStr : MyServiceSoapBindingOperation {
	MyService_WFDelegGetCurStr * parameters;
}
@property (retain) MyService_WFDelegGetCurStr * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_WFDelegGetCurStr *)aParameters
;
@end
@interface MyServiceSoapBinding_GetAllTxl : MyServiceSoapBindingOperation {
	MyService_GetAllTxl * parameters;
}
@property (retain) MyService_GetAllTxl * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetAllTxl *)aParameters
;
@end
@interface MyServiceSoapBinding_GetAllTxlDetial : MyServiceSoapBindingOperation {
	MyService_GetAllTxlDetial * parameters;
}
@property (retain) MyService_GetAllTxlDetial * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetAllTxlDetial *)aParameters
;
@end
@interface MyServiceSoapBinding_GetAllTxlGsDetial : MyServiceSoapBindingOperation {
	MyService_GetAllTxlGsDetial * parameters;
}
@property (retain) MyService_GetAllTxlGsDetial * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetAllTxlGsDetial *)aParameters
;
@end
@interface MyServiceSoapBinding_GetTxlByGroupId : MyServiceSoapBindingOperation {
	MyService_GetTxlByGroupId * parameters;
}
@property (retain) MyService_GetTxlByGroupId * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetTxlByGroupId *)aParameters
;
@end
@interface MyServiceSoapBinding_GetTxlByTxlId : MyServiceSoapBindingOperation {
	MyService_GetTxlByTxlId * parameters;
}
@property (retain) MyService_GetTxlByTxlId * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetTxlByTxlId *)aParameters
;
@end
@interface MyServiceSoapBinding_AddGroup : MyServiceSoapBindingOperation {
	MyService_AddGroup * parameters;
}
@property (retain) MyService_AddGroup * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_AddGroup *)aParameters
;
@end
@interface MyServiceSoapBinding_DelGroup : MyServiceSoapBindingOperation {
	MyService_DelGroup * parameters;
}
@property (retain) MyService_DelGroup * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_DelGroup *)aParameters
;
@end
@interface MyServiceSoapBinding_UpdateGroup : MyServiceSoapBindingOperation {
	MyService_UpdateGroup * parameters;
}
@property (retain) MyService_UpdateGroup * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_UpdateGroup *)aParameters
;
@end
@interface MyServiceSoapBinding_AddTxl : MyServiceSoapBindingOperation {
	MyService_AddTxl * parameters;
}
@property (retain) MyService_AddTxl * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_AddTxl *)aParameters
;
@end
@interface MyServiceSoapBinding_DelTxl : MyServiceSoapBindingOperation {
	MyService_DelTxl * parameters;
}
@property (retain) MyService_DelTxl * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_DelTxl *)aParameters
;
@end
@interface MyServiceSoapBinding_UpdateTxl : MyServiceSoapBindingOperation {
	MyService_UpdateTxl * parameters;
}
@property (retain) MyService_UpdateTxl * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_UpdateTxl *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgReceiveList : MyServiceSoapBindingOperation {
	MyService_MsgReceiveList * parameters;
}
@property (retain) MyService_MsgReceiveList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgReceiveList *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgSendList : MyServiceSoapBindingOperation {
	MyService_MsgSendList * parameters;
}
@property (retain) MyService_MsgSendList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgSendList *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgRead : MyServiceSoapBindingOperation {
	MyService_MsgRead * parameters;
}
@property (retain) MyService_MsgRead * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgRead *)aParameters
;
@end
@interface MyServiceSoapBinding_DoMsgRead : MyServiceSoapBindingOperation {
	MyService_DoMsgRead * parameters;
}
@property (retain) MyService_DoMsgRead * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_DoMsgRead *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgMx : MyServiceSoapBindingOperation {
	MyService_MsgMx * parameters;
}
@property (retain) MyService_MsgMx * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgMx *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgReceiversList : MyServiceSoapBindingOperation {
	MyService_MsgReceiversList * parameters;
}
@property (retain) MyService_MsgReceiversList * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgReceiversList *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgSend : MyServiceSoapBindingOperation {
	MyService_MsgSend * parameters;
}
@property (retain) MyService_MsgSend * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgSend *)aParameters
;
@end
@interface MyServiceSoapBinding_MsgDownLoadFile : MyServiceSoapBindingOperation {
	MyService_MsgDownLoadFile * parameters;
}
@property (retain) MyService_MsgDownLoadFile * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgDownLoadFile *)aParameters
;
@end
@interface MyServiceSoapBinding_MailSend : MyServiceSoapBindingOperation {
	MyService_MailSend * parameters;
}
@property (retain) MyService_MailSend * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_MailSend *)aParameters
;
@end
@interface MyServiceSoapBinding_GetMyFolderlist : MyServiceSoapBindingOperation {
	MyService_GetMyFolderlist * parameters;
}
@property (retain) MyService_GetMyFolderlist * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetMyFolderlist *)aParameters
;
@end
@interface MyServiceSoapBinding_GetMyFilelist : MyServiceSoapBindingOperation {
	MyService_GetMyFilelist * parameters;
}
@property (retain) MyService_GetMyFilelist * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetMyFilelist *)aParameters
;
@end
@interface MyServiceSoapBinding_GetSharedFilelist : MyServiceSoapBindingOperation {
	MyService_GetSharedFilelist * parameters;
}
@property (retain) MyService_GetSharedFilelist * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_GetSharedFilelist *)aParameters
;
@end
@interface MyServiceSoapBinding_FileShare : MyServiceSoapBindingOperation {
	MyService_FileShare * parameters;
}
@property (retain) MyService_FileShare * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_FileShare *)aParameters
;
@end
@interface MyServiceSoapBinding_DownLoadFile : MyServiceSoapBindingOperation {
	MyService_DownLoadFile * parameters;
}
@property (retain) MyService_DownLoadFile * parameters;
- (id)initWithBinding:(MyServiceSoapBinding *)aBinding delegate:(id<MyServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(MyService_DownLoadFile *)aParameters
;
@end
@interface MyServiceSoapBinding_envelope : NSObject {
}
+ (MyServiceSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface MyServiceSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
@class MyServiceSoap12BindingResponse;
@class MyServiceSoap12BindingOperation;
@protocol MyServiceSoap12BindingResponseDelegate <NSObject>
- (void) operation:(MyServiceSoap12BindingOperation *)operation completedWithResponse:(MyServiceSoap12BindingResponse *)response;
@end
@interface MyServiceSoap12Binding : NSObject <MyServiceSoap12BindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(MyServiceSoap12BindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (MyServiceSoap12BindingResponse *)LoginUsingParameters:(MyService_Login *)aParameters ;
- (void)LoginAsyncUsingParameters:(MyService_Login *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetServerTimeUsingParameters:(MyService_GetServerTime *)aParameters ;
- (void)GetServerTimeAsyncUsingParameters:(MyService_GetServerTime *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetUserInfoUsingParameters:(MyService_GetUserInfo *)aParameters ;
- (void)GetUserInfoAsyncUsingParameters:(MyService_GetUserInfo *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetUserInfo2UsingParameters:(MyService_GetUserInfo2 *)aParameters ;
- (void)GetUserInfo2AsyncUsingParameters:(MyService_GetUserInfo2 *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetUserInfoByIdUsingParameters:(MyService_GetUserInfoById *)aParameters ;
- (void)GetUserInfoByIdAsyncUsingParameters:(MyService_GetUserInfoById *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetUserInfoByLoginIdUsingParameters:(MyService_GetUserInfoByLoginId *)aParameters ;
- (void)GetUserInfoByLoginIdAsyncUsingParameters:(MyService_GetUserInfoByLoginId *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetWFStartListUsingParameters:(MyService_GetWFStartList *)aParameters ;
- (void)GetWFStartListAsyncUsingParameters:(MyService_GetWFStartList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetWFFinishListUsingParameters:(MyService_GetWFFinishList *)aParameters ;
- (void)GetWFFinishListAsyncUsingParameters:(MyService_GetWFFinishList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetCurTaskListUsingParameters:(MyService_GetCurTaskList *)aParameters ;
- (void)GetCurTaskListAsyncUsingParameters:(MyService_GetCurTaskList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetNextStepUsingParameters:(MyService_GetNextStep *)aParameters ;
- (void)GetNextStepAsyncUsingParameters:(MyService_GetNextStep *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetClrListUsingParameters:(MyService_GetClrList *)aParameters ;
- (void)GetClrListAsyncUsingParameters:(MyService_GetClrList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)DoProcessUsingParameters:(MyService_DoProcess *)aParameters ;
- (void)DoProcessAsyncUsingParameters:(MyService_DoProcess *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetTaskStateUsingParameters:(MyService_GetTaskState *)aParameters ;
- (void)GetTaskStateAsyncUsingParameters:(MyService_GetTaskState *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)WFDelegCancelUsingParameters:(MyService_WFDelegCancel *)aParameters ;
- (void)WFDelegCancelAsyncUsingParameters:(MyService_WFDelegCancel *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)WFDelegAddUsingParameters:(MyService_WFDelegAdd *)aParameters ;
- (void)WFDelegAddAsyncUsingParameters:(MyService_WFDelegAdd *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)WFDelegGetCurStrUsingParameters:(MyService_WFDelegGetCurStr *)aParameters ;
- (void)WFDelegGetCurStrAsyncUsingParameters:(MyService_WFDelegGetCurStr *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetAllTxlUsingParameters:(MyService_GetAllTxl *)aParameters ;
- (void)GetAllTxlAsyncUsingParameters:(MyService_GetAllTxl *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetAllTxlDetialUsingParameters:(MyService_GetAllTxlDetial *)aParameters ;
- (void)GetAllTxlDetialAsyncUsingParameters:(MyService_GetAllTxlDetial *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetAllTxlGsDetialUsingParameters:(MyService_GetAllTxlGsDetial *)aParameters ;
- (void)GetAllTxlGsDetialAsyncUsingParameters:(MyService_GetAllTxlGsDetial *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetTxlByGroupIdUsingParameters:(MyService_GetTxlByGroupId *)aParameters ;
- (void)GetTxlByGroupIdAsyncUsingParameters:(MyService_GetTxlByGroupId *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetTxlByTxlIdUsingParameters:(MyService_GetTxlByTxlId *)aParameters ;
- (void)GetTxlByTxlIdAsyncUsingParameters:(MyService_GetTxlByTxlId *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)AddGroupUsingParameters:(MyService_AddGroup *)aParameters ;
- (void)AddGroupAsyncUsingParameters:(MyService_AddGroup *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)DelGroupUsingParameters:(MyService_DelGroup *)aParameters ;
- (void)DelGroupAsyncUsingParameters:(MyService_DelGroup *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)UpdateGroupUsingParameters:(MyService_UpdateGroup *)aParameters ;
- (void)UpdateGroupAsyncUsingParameters:(MyService_UpdateGroup *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)AddTxlUsingParameters:(MyService_AddTxl *)aParameters ;
- (void)AddTxlAsyncUsingParameters:(MyService_AddTxl *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)DelTxlUsingParameters:(MyService_DelTxl *)aParameters ;
- (void)DelTxlAsyncUsingParameters:(MyService_DelTxl *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)UpdateTxlUsingParameters:(MyService_UpdateTxl *)aParameters ;
- (void)UpdateTxlAsyncUsingParameters:(MyService_UpdateTxl *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgReceiveListUsingParameters:(MyService_MsgReceiveList *)aParameters ;
- (void)MsgReceiveListAsyncUsingParameters:(MyService_MsgReceiveList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgSendListUsingParameters:(MyService_MsgSendList *)aParameters ;
- (void)MsgSendListAsyncUsingParameters:(MyService_MsgSendList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgReadUsingParameters:(MyService_MsgRead *)aParameters ;
- (void)MsgReadAsyncUsingParameters:(MyService_MsgRead *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)DoMsgReadUsingParameters:(MyService_DoMsgRead *)aParameters ;
- (void)DoMsgReadAsyncUsingParameters:(MyService_DoMsgRead *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgMxUsingParameters:(MyService_MsgMx *)aParameters ;
- (void)MsgMxAsyncUsingParameters:(MyService_MsgMx *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgReceiversListUsingParameters:(MyService_MsgReceiversList *)aParameters ;
- (void)MsgReceiversListAsyncUsingParameters:(MyService_MsgReceiversList *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgSendUsingParameters:(MyService_MsgSend *)aParameters ;
- (void)MsgSendAsyncUsingParameters:(MyService_MsgSend *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MsgDownLoadFileUsingParameters:(MyService_MsgDownLoadFile *)aParameters ;
- (void)MsgDownLoadFileAsyncUsingParameters:(MyService_MsgDownLoadFile *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)MailSendUsingParameters:(MyService_MailSend *)aParameters ;
- (void)MailSendAsyncUsingParameters:(MyService_MailSend *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetMyFolderlistUsingParameters:(MyService_GetMyFolderlist *)aParameters ;
- (void)GetMyFolderlistAsyncUsingParameters:(MyService_GetMyFolderlist *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetMyFilelistUsingParameters:(MyService_GetMyFilelist *)aParameters ;
- (void)GetMyFilelistAsyncUsingParameters:(MyService_GetMyFilelist *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)GetSharedFilelistUsingParameters:(MyService_GetSharedFilelist *)aParameters ;
- (void)GetSharedFilelistAsyncUsingParameters:(MyService_GetSharedFilelist *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)FileShareUsingParameters:(MyService_FileShare *)aParameters ;
- (void)FileShareAsyncUsingParameters:(MyService_FileShare *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
- (MyServiceSoap12BindingResponse *)DownLoadFileUsingParameters:(MyService_DownLoadFile *)aParameters ;
- (void)DownLoadFileAsyncUsingParameters:(MyService_DownLoadFile *)aParameters  delegate:(id<MyServiceSoap12BindingResponseDelegate>)responseDelegate;
@end
@interface MyServiceSoap12BindingOperation : NSOperation {
	MyServiceSoap12Binding *binding;
	MyServiceSoap12BindingResponse *response;
	id<MyServiceSoap12BindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) MyServiceSoap12Binding *binding;
@property (readonly) MyServiceSoap12BindingResponse *response;
@property (nonatomic, assign) id<MyServiceSoap12BindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate;
@end
@interface MyServiceSoap12Binding_Login : MyServiceSoap12BindingOperation {
	MyService_Login * parameters;
}
@property (retain) MyService_Login * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_Login *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetServerTime : MyServiceSoap12BindingOperation {
	MyService_GetServerTime * parameters;
}
@property (retain) MyService_GetServerTime * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetServerTime *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetUserInfo : MyServiceSoap12BindingOperation {
	MyService_GetUserInfo * parameters;
}
@property (retain) MyService_GetUserInfo * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfo *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetUserInfo2 : MyServiceSoap12BindingOperation {
	MyService_GetUserInfo2 * parameters;
}
@property (retain) MyService_GetUserInfo2 * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfo2 *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetUserInfoById : MyServiceSoap12BindingOperation {
	MyService_GetUserInfoById * parameters;
}
@property (retain) MyService_GetUserInfoById * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfoById *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetUserInfoByLoginId : MyServiceSoap12BindingOperation {
	MyService_GetUserInfoByLoginId * parameters;
}
@property (retain) MyService_GetUserInfoByLoginId * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetUserInfoByLoginId *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetWFStartList : MyServiceSoap12BindingOperation {
	MyService_GetWFStartList * parameters;
}
@property (retain) MyService_GetWFStartList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetWFStartList *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetWFFinishList : MyServiceSoap12BindingOperation {
	MyService_GetWFFinishList * parameters;
}
@property (retain) MyService_GetWFFinishList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetWFFinishList *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetCurTaskList : MyServiceSoap12BindingOperation {
	MyService_GetCurTaskList * parameters;
}
@property (retain) MyService_GetCurTaskList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetCurTaskList *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetNextStep : MyServiceSoap12BindingOperation {
	MyService_GetNextStep * parameters;
}
@property (retain) MyService_GetNextStep * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetNextStep *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetClrList : MyServiceSoap12BindingOperation {
	MyService_GetClrList * parameters;
}
@property (retain) MyService_GetClrList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetClrList *)aParameters
;
@end
@interface MyServiceSoap12Binding_DoProcess : MyServiceSoap12BindingOperation {
	MyService_DoProcess * parameters;
}
@property (retain) MyService_DoProcess * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_DoProcess *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetTaskState : MyServiceSoap12BindingOperation {
	MyService_GetTaskState * parameters;
}
@property (retain) MyService_GetTaskState * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetTaskState *)aParameters
;
@end
@interface MyServiceSoap12Binding_WFDelegCancel : MyServiceSoap12BindingOperation {
	MyService_WFDelegCancel * parameters;
}
@property (retain) MyService_WFDelegCancel * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_WFDelegCancel *)aParameters
;
@end
@interface MyServiceSoap12Binding_WFDelegAdd : MyServiceSoap12BindingOperation {
	MyService_WFDelegAdd * parameters;
}
@property (retain) MyService_WFDelegAdd * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_WFDelegAdd *)aParameters
;
@end
@interface MyServiceSoap12Binding_WFDelegGetCurStr : MyServiceSoap12BindingOperation {
	MyService_WFDelegGetCurStr * parameters;
}
@property (retain) MyService_WFDelegGetCurStr * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_WFDelegGetCurStr *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetAllTxl : MyServiceSoap12BindingOperation {
	MyService_GetAllTxl * parameters;
}
@property (retain) MyService_GetAllTxl * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetAllTxl *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetAllTxlDetial : MyServiceSoap12BindingOperation {
	MyService_GetAllTxlDetial * parameters;
}
@property (retain) MyService_GetAllTxlDetial * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetAllTxlDetial *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetAllTxlGsDetial : MyServiceSoap12BindingOperation {
	MyService_GetAllTxlGsDetial * parameters;
}
@property (retain) MyService_GetAllTxlGsDetial * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetAllTxlGsDetial *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetTxlByGroupId : MyServiceSoap12BindingOperation {
	MyService_GetTxlByGroupId * parameters;
}
@property (retain) MyService_GetTxlByGroupId * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetTxlByGroupId *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetTxlByTxlId : MyServiceSoap12BindingOperation {
	MyService_GetTxlByTxlId * parameters;
}
@property (retain) MyService_GetTxlByTxlId * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetTxlByTxlId *)aParameters
;
@end
@interface MyServiceSoap12Binding_AddGroup : MyServiceSoap12BindingOperation {
	MyService_AddGroup * parameters;
}
@property (retain) MyService_AddGroup * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_AddGroup *)aParameters
;
@end
@interface MyServiceSoap12Binding_DelGroup : MyServiceSoap12BindingOperation {
	MyService_DelGroup * parameters;
}
@property (retain) MyService_DelGroup * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_DelGroup *)aParameters
;
@end
@interface MyServiceSoap12Binding_UpdateGroup : MyServiceSoap12BindingOperation {
	MyService_UpdateGroup * parameters;
}
@property (retain) MyService_UpdateGroup * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_UpdateGroup *)aParameters
;
@end
@interface MyServiceSoap12Binding_AddTxl : MyServiceSoap12BindingOperation {
	MyService_AddTxl * parameters;
}
@property (retain) MyService_AddTxl * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_AddTxl *)aParameters
;
@end
@interface MyServiceSoap12Binding_DelTxl : MyServiceSoap12BindingOperation {
	MyService_DelTxl * parameters;
}
@property (retain) MyService_DelTxl * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_DelTxl *)aParameters
;
@end
@interface MyServiceSoap12Binding_UpdateTxl : MyServiceSoap12BindingOperation {
	MyService_UpdateTxl * parameters;
}
@property (retain) MyService_UpdateTxl * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_UpdateTxl *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgReceiveList : MyServiceSoap12BindingOperation {
	MyService_MsgReceiveList * parameters;
}
@property (retain) MyService_MsgReceiveList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgReceiveList *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgSendList : MyServiceSoap12BindingOperation {
	MyService_MsgSendList * parameters;
}
@property (retain) MyService_MsgSendList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgSendList *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgRead : MyServiceSoap12BindingOperation {
	MyService_MsgRead * parameters;
}
@property (retain) MyService_MsgRead * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgRead *)aParameters
;
@end
@interface MyServiceSoap12Binding_DoMsgRead : MyServiceSoap12BindingOperation {
	MyService_DoMsgRead * parameters;
}
@property (retain) MyService_DoMsgRead * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_DoMsgRead *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgMx : MyServiceSoap12BindingOperation {
	MyService_MsgMx * parameters;
}
@property (retain) MyService_MsgMx * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgMx *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgReceiversList : MyServiceSoap12BindingOperation {
	MyService_MsgReceiversList * parameters;
}
@property (retain) MyService_MsgReceiversList * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgReceiversList *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgSend : MyServiceSoap12BindingOperation {
	MyService_MsgSend * parameters;
}
@property (retain) MyService_MsgSend * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgSend *)aParameters
;
@end
@interface MyServiceSoap12Binding_MsgDownLoadFile : MyServiceSoap12BindingOperation {
	MyService_MsgDownLoadFile * parameters;
}
@property (retain) MyService_MsgDownLoadFile * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MsgDownLoadFile *)aParameters
;
@end
@interface MyServiceSoap12Binding_MailSend : MyServiceSoap12BindingOperation {
	MyService_MailSend * parameters;
}
@property (retain) MyService_MailSend * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_MailSend *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetMyFolderlist : MyServiceSoap12BindingOperation {
	MyService_GetMyFolderlist * parameters;
}
@property (retain) MyService_GetMyFolderlist * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetMyFolderlist *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetMyFilelist : MyServiceSoap12BindingOperation {
	MyService_GetMyFilelist * parameters;
}
@property (retain) MyService_GetMyFilelist * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetMyFilelist *)aParameters
;
@end
@interface MyServiceSoap12Binding_GetSharedFilelist : MyServiceSoap12BindingOperation {
	MyService_GetSharedFilelist * parameters;
}
@property (retain) MyService_GetSharedFilelist * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_GetSharedFilelist *)aParameters
;
@end
@interface MyServiceSoap12Binding_FileShare : MyServiceSoap12BindingOperation {
	MyService_FileShare * parameters;
}
@property (retain) MyService_FileShare * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_FileShare *)aParameters
;
@end
@interface MyServiceSoap12Binding_DownLoadFile : MyServiceSoap12BindingOperation {
	MyService_DownLoadFile * parameters;
}
@property (retain) MyService_DownLoadFile * parameters;
- (id)initWithBinding:(MyServiceSoap12Binding *)aBinding delegate:(id<MyServiceSoap12BindingResponseDelegate>)aDelegate
	parameters:(MyService_DownLoadFile *)aParameters
;
@end
@interface MyServiceSoap12Binding_envelope : NSObject {
}
+ (MyServiceSoap12Binding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface MyServiceSoap12BindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
