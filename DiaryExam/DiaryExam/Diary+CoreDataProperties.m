//
//  Diary+CoreDataProperties.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "Diary+CoreDataProperties.h"

@implementation Diary (CoreDataProperties)

+ (NSFetchRequest<Diary *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Diary"];
}

@dynamic content;
@dynamic createdDateInfo;

@end
