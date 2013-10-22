//
//  StorageDetailInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ProgressIndicator.h"
#import "DownLoadInfoDelegate.h"
@interface StorageDetailInfoViewController : UIViewController<passDownLoadInfo,UIGestureRecognizerDelegate>
{
    ProgressIndicator *_progress;//下载的进度条
    CGFloat lastScale;//图片缩放的大小
}
@property(nonatomic,retain)NSArray *fileInfoArray;//下载信息的列表
@property(nonatomic)BOOL flag;//用于判断图片的状态
//(1.fileId 文件的Id 2.fileName 文件名称 3.文件类型)
-(void)handleFileArrayInfo;//处理下载文件的信息

/*判断文件夹是否存在*/
-(void)judgeFolderExist;//每个用户都拥有自己文件夹

/*判读文件是否在本地存在*/
-(void)judgeFileExist;

/*如果下载成功,则打开已经下载好的文件*/
-(void)judgeFileType:(NSString *)path;//打开下载好的文件

-(void)openImageFile:(NSString*)path;//打开图片文件

-(void)openOfficeFile:(NSString *)path;//打开办公文件

-(void)unKnowFile;//未知文件类型
@end
