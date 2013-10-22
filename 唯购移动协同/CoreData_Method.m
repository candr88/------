//
//  CoreData_Method.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CoreData_Method.h"

@implementation CoreData_Method
@synthesize managedObjectContext,fetchedResultsController;
-(void)initCoreData
{
    NSError *error;
    //文件路径sl
    NSString *path=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/OA.sqlite" ];
    NSLog(@"%@",path);
    NSURL *url=[NSURL fileURLWithPath:path];
    //初始化模型
    NSManagedObjectModel *managedObjectModel=[NSManagedObjectModel mergedModelFromBundles:nil];
    //添加关系
    NSPersistentStoreCoordinator *persistentStoreCoordinator=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:managedObjectModel];
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error]) 
    {
        NSLog(@"%@",[error localizedDescription]);
    }
    else
    {
        self.managedObjectContext=[[[NSManagedObjectContext alloc]init]autorelease];
        [self.managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
    [persistentStoreCoordinator release];
}
-(void)fetchObjects:(NSString *)sql_Name:(NSString *)serachName:(NSPredicate*)predicate
//详细查找数据
{
    NSFetchRequest *fetchRequest=[[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:sql_Name inManagedObjectContext:self.managedObjectContext]];   
    [fetchRequest setPredicate:predicate];
    NSSortDescriptor *sortDescriptor=[[NSSortDescriptor alloc]initWithKey:serachName ascending:YES selector:nil];
    NSArray *descriptors=[NSArray arrayWithObject:sortDescriptor];
    [fetchRequest setSortDescriptors:descriptors];
    [sortDescriptor release];
    NSError *error;
    self.fetchedResultsController=[[NSFetchedResultsController alloc]initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Root"];
    if (![self .fetchedResultsController performFetch:&error])
    {
        NSLog(@"%@",[error localizedDescription]);
    }
    [self.fetchedResultsController release];
    [fetchRequest release];
    
}
-(void)dealloc//内存清理
{
    [super dealloc];
    [managedObjectContext release];
    [fetchedResultsController release];
}
@end
