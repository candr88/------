//
//  CoreData_Method.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
@interface CoreData_Method : NSObject
-(void)initCoreData;//初始化数据库
-(void)fetchObjects:(NSString *)sql_Name:(NSString *)serachName:(NSPredicate*)predicate;
//查找数据(predicate 是条件查询)

@property(nonatomic,retain)NSManagedObjectContext *managedObjectContext;
@property(nonatomic,retain)NSFetchedResultsController *fetchedResultsController;
@end
