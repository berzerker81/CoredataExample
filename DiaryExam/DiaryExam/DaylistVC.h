//
//  DaylistVC.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DaylistVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    bool     _diaryListMode;
    NSArray * _datalist;
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)dismiss:(id)sender;


@end
