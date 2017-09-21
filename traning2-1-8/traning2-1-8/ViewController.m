//
//  ViewController.m
//  traning2-1-8
//
//  Created by MAC管理者 STV on 2017/09/07.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *mainDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *doneBtnStatus;
- (IBAction)didChangeDatePicker:(id)sender;
- (IBAction)doneBtn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dateLabel.userInteractionEnabled = YES;
    self.mainDatePicker.hidden = YES;
    self.doneBtnStatus.hidden = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// ラベルタッチイベントの取得(ラベルタッチでpicker表示、背景タッチでpkicker非表示)
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 受け取ったタッチイベントをインスタンス化
    UITouch *touch = [[event allTouches] anyObject];
    
    if(touch.view.tag == self.dateLabel.tag) {
        self.mainDatePicker.hidden = NO;
        self.doneBtnStatus.hidden = NO;
    } else {
        self.mainDatePicker.hidden = YES;
        self.doneBtnStatus.hidden =YES;
    }
}


// Doneボタンを押したとき、PickerとDoneボタンを非表示する。
- (IBAction)didChangeDatePicker:(id)sender {
    NSDateFormatter *selectedDate = [[NSDateFormatter alloc] init];
    [selectedDate setDateFormat:@"yyyy年M年dd日"];
    NSString *dateStr = [selectedDate stringFromDate:self.mainDatePicker.date];
    self.dateLabel.text = dateStr;
}

- (IBAction)doneBtn:(id)sender {
    self.mainDatePicker.hidden = YES;
    self.doneBtnStatus.hidden = YES;
}
@end
