//
//  DailyInfo+CoreDataProperties.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "DailyInfo+CoreDataProperties.h"

@implementation DailyInfo (CoreDataProperties)

+ (NSFetchRequest<DailyInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"DailyInfo"];
}

@dynamic createdDate;
@dynamic weather;
@dynamic diary;

@end
