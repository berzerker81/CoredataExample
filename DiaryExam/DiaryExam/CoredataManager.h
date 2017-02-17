//
//  CoredataManager.h
//  CoreDataTest
//
//  Created by jangwoong on 2017. 2. 16..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoredataManager : NSObject

@property(readonly) NSString * entityName;
+(NSManagedObjectContext*)getCurrentContext;

-(CoredataManager*)initWithEntityName:(NSString*)entityName;

//찾기
-(NSArray*)fetchCurrentObjects;
-(NSArray*)fetchByName:(NSString*)managedObjectName;
-(NSArray*)fetchByName:(NSString*)managedObjectName predicate:(NSPredicate*)predi;

//생성
-(NSManagedObject*)insertEntity;
-(NSManagedObject*)insertEntityByName:(NSString*)name;


//저장
+(bool)save;

//초기화
-(void)clearAll;


@end
