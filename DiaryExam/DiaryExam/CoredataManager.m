//
//  CoredataManager.m
//  CoreDataTest
//
//  Created by jangwoong on 2017. 2. 16..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "CoredataManager.h"
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@implementation CoredataManager

+(NSManagedObjectContext*)getCurrentContext
{
    AppDelegate * delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    return delegate.persistentContainer.viewContext;
}

-(CoredataManager*)initWithEntityName:(NSString*)entityName
{
    self = [super init];
    
    if(self)
    {
        _entityName = entityName;
    }
    
    return self;
}

-(NSArray*)fetchCurrentObjects
{
    return [self fetchByName:self.entityName];
}

-(NSArray*)fetchByName:(NSString*)managedObjectName
{
    return [self fetchByName:managedObjectName predicate:nil];
}
-(NSArray*)fetchByName:(NSString*)managedObjectName predicate:(NSPredicate*)predi
{
    NSManagedObjectContext * context = [CoredataManager getCurrentContext];
    
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:managedObjectName inManagedObjectContext:context];
    
    fetchRequest.predicate = predi;
    
    NSError * error = nil;
    
    NSArray * objects = [context executeFetchRequest:fetchRequest error:&error];
    
    if(!error)
    {
        return objects;
    }else
    {
        NSLog(@"Fetch Error %@",[error localizedDescription]);
        return nil;
    }
    
}


-(NSManagedObject*)insertEntity
{
    return [self insertEntityByName:self.entityName];
}

-(NSManagedObject*)insertEntityByName:(NSString*)name
{
    NSManagedObjectContext * context = [CoredataManager getCurrentContext];
    NSManagedObject * object = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:context];
    return object;
}

+(bool)save
{
    
    NSError * error = nil;
    
    [[CoredataManager getCurrentContext] save:&error];
    
    if(error)
    {
        NSLog(@"CoreData SaveError %@",[error localizedDescription]);
        return NO;
        
    }else
    {
        return YES;
    }
    
}

-(void)clearAll
{
    NSArray * list = [self fetchCurrentObjects];
    
    for (NSManagedObject * object in list)
    {
        [[CoredataManager getCurrentContext] deleteObject:object];
    }
    
    [CoredataManager save];
    
}


@end
