//
//  ViewController.m
//  traning2-1-8
//
//  Created by MAC管理者 STV on 2017/09/06.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *fruitPicker;
@property (retain, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneBtnSetting;
@property (strong, nonatomic) NSArray *fruitList;
- (IBAction)doneBtn:(id)sender;
- (IBAction)labelOveredBtn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Pickerの設定。デリゲート２つをセットし、中身を配列で用意する。
    self.fruitPicker.dataSource = self;
    self.fruitPicker.delegate = self;
    self.fruitList = @[@"りんご", @"バナナ",  @"みかん", @"ぶどう", @"メロン"];
    
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
    return 1;
}

// 行数を返して、
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.fruitList.count;
}

// 表示する文字列を、配列から取得して、
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.fruitList[row];
}

// Labelの文字を、選択肢た文字に書き換える。
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.fruitLabel.text = self.fruitList[row];
}

// 画面タッチを判定して、Pickerが表示されていたら、非表示にする。
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(self.fruitPicker.hidden == NO && self.doneBtnSetting.hidden == NO) {
        self.fruitPicker.hidden = YES;
        self.doneBtnSetting.hidden = YES;
    }
}

// Doneボタンを押すと、PickerとDoneボタンを非表示にする。
- (IBAction)doneBtn:(id)sender {
    self.fruitPicker.hidden = YES;
    self.doneBtnSetting.hidden = YES;
}

// ラベルに被せた透明ボタンを押すと、PickerとDoneボタンを表示する。
- (IBAction)labelOveredBtn:(id)sender {
    self.fruitPicker.hidden = NO;
    self.doneBtnSetting.hidden = NO;
}
@end
