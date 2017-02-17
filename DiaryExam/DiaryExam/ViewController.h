//
//  ViewController.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    @private
    NSArray * _currentDiaryData;
//    CoredataManager * _diaryManager;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)addNew:(id)sender;

@end

