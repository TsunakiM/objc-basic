//
//  ViewController.m
//  traning2-1-7
//
//  Created by MAC管理者 STV on 2017/09/05.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *maxLengthAlateLabel;
@property (weak, nonatomic) IBOutlet UITextField *topTextFieldSetting;
@property (nonatomic) BOOL textcheck;

@end

// 最大文字数を定数で設定
static int const MaxInputLength = 30;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 最大文字入力を超えた際に出すアラートラベルの、表示・非表示を切り替えるための宣言
    [self.view addSubview:self.maxLengthAlateLabel];
    self.maxLengthAlateLabel.alpha = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UITextFieldDelegateに存在するメソッドを利用して、textFieldの各種判定
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // テキストフィールドが空欄の場合、returnキーを無効化
    if (textField.text.length == 0) {
        textField.enablesReturnKeyAutomatically = YES;
    }
    
    // 入力済みのテキストを取得して、
    NSMutableString *nowText = [textField.text mutableCopy];
    // たったいま入力された文字を、入力済みのテキストに結合
    [nowText replaceCharactersInRange:range withString:string];
    
    // 文字数オーバーしていた場合の処理
    if (nowText.length > MaxInputLength) {
        // エラー文を表示する処理
        self.maxLengthAlateLabel.alpha = 1;
        // 最大文字数がNGのフラグを立てる
        self.textcheck = NO;

        return YES;
    }
    
    // 最大文字数チェックがOKのフラグを立てる
    self.textcheck = YES;
    // アラート用ラベルを透明にする
    self.maxLengthAlateLabel.alpha = 0;
    return YES;
}

// キーボード以外をタップしたらキーボードを消去する処理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // キーボードが表示されているなら、消す処理
    if (self.topTextFieldSetting.isFirstResponder) {
        [self.topTextFieldSetting endEditing:YES];
    }
}

// returnキーをタップしたときの処理
- (BOOL)textFieldShouldReturn:(UITextField*)textField{
    // 最大文字数を超えていた場合に、returnキーを無効化する処理
    if(!self.textcheck) {
        return NO;
    }
    
    // キーボードを閉じる処理（上で引っかかってない場合）
    [self.topTextFieldSetting resignFirstResponder];
    return YES;
}

@end
