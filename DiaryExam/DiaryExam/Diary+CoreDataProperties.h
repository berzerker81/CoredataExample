//
//  Diary+CoreDataProperties.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "Diary+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Diary (CoreDataProperties)

+ (NSFetchRequest<Diary *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *content;
@property (nullable, nonatomic, retain) DailyInfo *createdDateInfo;

@end

NS_ASSUME_NONNULL_END
