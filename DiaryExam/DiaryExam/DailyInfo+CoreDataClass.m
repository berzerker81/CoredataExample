//
//  DailyInfo+CoreDataClass.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "DailyInfo+CoreDataClass.h"
#import "Diary+CoreDataClass.h"
@implementation DailyInfo
+(DailyInfo*)create
{
    NSArray * objects = [[DailyInfo getManager] fetchCurrentObjects];
    
    bool foundObject = false;
    
    
    static NSDateFormatter * format = nil;
    
    if(!format)
    {
        format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
    }
    
    
    NSString * currentDateString = [format stringFromDate:[NSDate date]];
    NSDate   * convertedDate     = [format dateFromString:currentDateString];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"%K = %@",@"createdDate",convertedDate];
    
    NSArray * result = [objects filteredArrayUsingPredicate:predicate];
    
    if([result count] > 0)
    {
        foundObject = YES;
        return [result firstObject];
    }
    
    
    
    if([objects count]==0 || !foundObject)
    {
        DailyInfo * info = (DailyInfo*)[[DailyInfo getManager]insertEntity];
        info.createdDate = convertedDate;
        return info;
    }
    
    return nil;
    
}

-(NSString*)dateString
{
    static NSDateFormatter * format = nil;
    
    if(!format)
    {
        format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy-MM-dd"];
    }
    
    return [format stringFromDate:self.createdDate];
}

@end
