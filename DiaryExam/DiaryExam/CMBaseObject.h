//
//  CMBaseObject.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CMBaseObject : NSManagedObject
+(CoredataManager*)getManager;
@end
