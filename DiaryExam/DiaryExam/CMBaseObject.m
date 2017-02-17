//
//  CMBaseObject.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "CMBaseObject.h"

@implementation CMBaseObject

static NSMutableDictionary* managerInstances = nil;

+(CoredataManager*)getManager
{
    if(!managerInstances)
    {
        managerInstances = [[NSMutableDictionary alloc] init];
    }
    
    NSString * className =NSStringFromClass([self class]);
    
    CoredataManager * cm = managerInstances[className];
    
    if(!cm)
    {
        cm = [[CoredataManager alloc] initWithEntityName:className];
        managerInstances[className] = cm;
    }
    
    return cm;
    
}



@end
