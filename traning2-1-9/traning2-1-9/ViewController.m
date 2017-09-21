//
//  ViewController.m
//  traning2-1-9
//
//  Created by 増田紘宜 on 2017/09/12.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
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
    
    // userInterractionEnabled = 今回は、UILabelが、タップ判定を検出するかどうか。
    // そのフラグを、storybord側でONに設定。コードで指定する場合は、以下の記述をする。
    // self.dateLabel.userInteractionEnabled = YES;
    
    // LocalizedStringの呼び出し。
    self.dateLabel.text = [[NSBundle mainBundle] localizedStringForKey:@"DateLabelDefaultString"
                                                                 value:nil
                                                                 table:@"Localizable"];

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
    [selectedDate setDateFormat: @"yyyy年MM月dd日"];
    NSString *dateStr = [selectedDate stringFromDate: self.mainDatePicker.date];
    self.dateLabel.text = dateStr;
}

- (IBAction)doneBtn:(id)sender {
    self.mainDatePicker.hidden = YES;
    self.doneBtnStatus.hidden = YES;
}

@end
