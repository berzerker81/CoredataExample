//
//  ViewController.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _diaryManager = [[CoredataManager alloc] initWithEntityName:@"Diary"];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadData];

    
}

-(void)loadData
{
    _currentDiaryData = [[Diary getManager] fetchCurrentObjects];
    [[self tableView] reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)addNew:(id)sender {
    [self performSegueWithIdentifier:@"edit" sender:self];
}

- (IBAction)showDate:(id)sender {
    [self performSegueWithIdentifier:@"showDates" sender:self];
    
}

- (IBAction)clear:(id)sender {
    
    [[Diary getManager] clearAll];
    [[DailyInfo getManager] clearAll];
    [self loadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_currentDiaryData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * defID = @"defaultCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:defID];
    
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:defID];
        
    }
    
    NSUInteger index = indexPath.row;
    
    Diary * diaryInfo = _currentDiaryData[index];
    
    DailyInfo * daily = [diaryInfo valueForKey:@"createdDateInfo"];
    
    
    
    static NSDateFormatter * formatter = nil;
    
    if(!formatter)
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    
    if(daily)
    {
        [[cell textLabel] setText:[formatter stringFromDate:daily.createdDate]];
        
    }else
    {
        [[cell textLabel] setText:@"unknown date"];
    }
    
    
    [[cell detailTextLabel] setText:diaryInfo.content];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [cell setSelected:NO];
    
    
    
}

@end
