//
//  DailyInfo+CoreDataClass.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CMBaseObject.h"
@class Diary;

NS_ASSUME_NONNULL_BEGIN

@interface DailyInfo : CMBaseObject
-(NSString*)dateString;
+(DailyInfo*)create;
@end

NS_ASSUME_NONNULL_END

#import "DailyInfo+CoreDataProperties.h"
