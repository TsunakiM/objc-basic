//
//  ViewController.m
//  traning2-1-8
//
//  Created by MAC管理者 STV on 2017/09/06.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

// ViewController側で、UIPickerViewDataSource, UIPickerViewDelegateの2つを接続済み。
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *fruitPicker;
@property (retain, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneBtnSetting;
@property (strong, nonatomic) NSArray *fruitList;
- (IBAction)doneBtn:(id)sender;


@end

static const NSUInteger numberOfComponentsInPickerView = 1;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Pickerの設定。中身を配列で用意する。
    self.fruitList = @[@"りんご", @"バナナ",  @"みかん", @"ぶどう", @"メロン"];
    
    self.fruitLabel.text = [[NSBundle mainBundle]localizedStringForKey:@"likeFruitLabel"
                                                                 value:nil
                                                                 table:@"Localizable" ];
    
    // PickerとOverlayを非表示にする。
    self.fruitPicker.hidden = YES;
    self.doneBtnSetting.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*~~~ Pickerの設定４つ ~~~*/
// 列数を返して、
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return numberOfComponentsInPickerView;
}

// 行数を返して、
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.fruitList.count;
}

// 表示する文字列を、配列から取得して、
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.fruitList[row];
}

// Labelの文字を、選択肢した文字に書き換える。
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.fruitLabel.text = self.fruitList[row];
}

// ラベルタッチイベントの取得(ラベルタッチでpicker表示、背景タッチでpkicker非表示)
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 受け取ったタッチイベントをインスタンス化
    UITouch *touch = [[event allTouches] anyObject];
    
    if(touch.view.tag == self.fruitLabel.tag) {
        self.fruitPicker.hidden = NO;
        self.doneBtnSetting.hidden = NO;
    } else {
        self.fruitPicker.hidden = YES;
        self.doneBtnSetting.hidden =YES;
    }
}

- (IBAction)doneBtn:(id)sender {
    self.fruitPicker.hidden = YES;
    self.doneBtnSetting.hidden =YES;
}
@end
