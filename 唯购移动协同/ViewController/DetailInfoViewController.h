//
//  DetailInfoViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailInfoViewController : UITableViewController<UITextFieldDelegate>
{
    NSInteger index;
}
@property(nonatomic,retain)NSString *judge;//用于判读是从那个界面跳转过来的
@property(nonatomic,retain)NSArray *titleArray;//用于显示每一行的数据前面的标题
@property(nonatomic,retain)NSMutableArray *detailInfoArray;//详细的数据
/*调用借口进行对进行修改的数据的提交*/
-(void)submitDataToWebService;//将进行修改的数据提交到服务器上面
/*构建自己需要的cell*/
-(UITableViewCell *)buildingOwnTableCell:(UITableViewCell *)cell:(NSIndexPath*)indexPath;
@end
