//
//  StaffInfo.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface StaffInfo : NSManagedObject

@property (nonatomic, retain) NSString * loginId;
@property (nonatomic, retain) NSString * department;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * fax;
@property (nonatomic, retain) NSString * detailInfo;
@property (nonatomic, retain) NSString * telePhone;
@property (nonatomic, retain) NSString * cellPhone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * qq;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * post;
@property (nonatomic, retain) NSString * nameId;
@property (nonatomic, retain) NSString * type;

@end
