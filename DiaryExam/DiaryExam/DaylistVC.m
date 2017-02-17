//
//  DaylistVC.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "DaylistVC.h"

@interface DaylistVC ()

@end

@implementation DaylistVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _datalist = [[DailyInfo getManager] fetchCurrentObjects];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datalist count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
    
    if(_diaryListMode)
    {
        return;
    }
    
    DailyInfo * daily = _datalist[indexPath.row];
    
    NSSet * sets = [daily valueForKey:@"diary"];
    
    for (Diary * diary in [sets allObjects]) {
        
        NSLog(@"%@",diary.content);
    }
    
    _datalist = [sets allObjects];
    
    _diaryListMode = YES;
    
    [self.tableView reloadData];
    
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"default"];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"default"];
    }
    
    if(_diaryListMode)
    {
        Diary * diary = _datalist[indexPath.row];
        [cell.textLabel setText:diary.content];
        
        
    }else
    {
        DailyInfo * info = _datalist[indexPath.row];
        [cell.textLabel setText:[info dateString]];
    }
    
    
    
    return cell;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
