//
//  EditViewController.m
//  DiaryExam
//
//  Created by jangwoong on 2017. 2. 17..
//  Copyright © 2017년 SELQA_macbookpro. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text containsString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveExit:(id)sender {
    
    Diary * diary = (Diary*)[[Diary getManager] insertEntity];
    diary.content = self.textView.text;
    
    
    
    DailyInfo * day = [DailyInfo create];

    [diary setValue:day forKey:@"createdDateInfo"];
    
    [CoredataManager save];
    
    [self exit:nil];
    
}

- (IBAction)exit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
