//
//  LetterInfo.h
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface LetterInfo : NSManagedObject

@property (nonatomic, retain) NSString * loginId;
@property (nonatomic, retain) NSString * sender;
@property (nonatomic, retain) NSString * letterId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * mainTxt;
@property (nonatomic, retain) NSString * time;

@end
