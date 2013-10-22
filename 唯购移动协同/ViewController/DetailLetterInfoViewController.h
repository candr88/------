//
//  DetailLetterInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailLetterInfoViewController : UITableViewController
@property(nonatomic,retain)NSArray *titleArray;//标题
@property(nonatomic,retain)NSMutableArray *detailInfoArray;//详细的数据
@property(nonatomic)BOOL flag;//反正被重复添加到数据库
@property(nonatomic,retain)NSString *letterId;//信件的Id
/*把信息添加到数据库里面去*/
-(void)addToCoreData;

/*数据处理的合集*/
-(void)detailDataProcess;
@end
