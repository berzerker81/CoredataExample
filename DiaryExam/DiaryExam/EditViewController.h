//
//  EditViewController.h
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController<UITextViewDelegate>
{
    @private

    
}

@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)saveExit:(id)sender;
- (IBAction)exit:(id)sender;

@end
