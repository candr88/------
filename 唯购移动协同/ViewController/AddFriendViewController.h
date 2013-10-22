//
//  AddFriendViewController.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-11.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DropDownList.h"
@interface AddFriendViewController : UITableViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UIActionSheetDelegate>
{
    NSInteger  index;//用于标记每个tableviewcell
    NSInteger  pickerIndex;//picekerview的选择行,初始化的值为0
}

/*调用借口进行对进行修改的数据的提交*/
-(void)addFriendToWeb;//将进行添加的的数据提交到服务器上面
/*构建自己需要的cell*/
-(UITableViewCell *)buildingOwnTableCell:(UITableViewCell *)cell:(NSIndexPath*)indexPath;

-(void)addFriendDataProcess;//数据的处理
@property(nonatomic,retain)NSArray *titleArray;//标题
@property(nonatomic,retain)NSMutableArray *detailInfoArray;//详细信息
@property(nonatomic,retain)NSArray *groupTitleArray;//小组标题的列表
@property(nonatomic,retain)UIPickerView *pickerView;//选择的小组的列表

@end
