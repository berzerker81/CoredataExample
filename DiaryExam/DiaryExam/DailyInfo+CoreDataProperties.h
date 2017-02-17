//
//  DailyInfo+CoreDataProperties.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "DailyInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DailyInfo (CoreDataProperties)

+ (NSFetchRequest<DailyInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *createdDate;
@property (nonatomic) int16_t weather;
@property (nullable, nonatomic, retain) Diary *diary;

@end

NS_ASSUME_NONNULL_END
