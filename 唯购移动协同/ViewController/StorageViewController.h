//
//  StorageViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LIExposeController.h"
@interface StorageViewController : UITableViewController<LIExposeControllerChildViewControllerDelegate>

/*数据的处理*/
-(void)storageDataProcessing;

/*获取文件下载的信息*/
-(void)getFileListInfo;

@property(nonatomic,retain)NSArray *fileArray;//文件信息的列表

@end
