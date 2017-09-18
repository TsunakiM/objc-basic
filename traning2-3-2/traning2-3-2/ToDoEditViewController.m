//
//  ToDoEditViewController.m
//  traning2-3-2
//
//  Created by 増田紘宜 on 2017/09/18.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ToDoEditViewController.h"
#import "ViewController.h"
#import "FMDB/FMDatabase.h"

@interface ToDoEditViewController ()

@end

// Todoの期日指定を定数で用意（n日後）
static int const TodoLimitAfterDays = 7;

@implementation ToDoEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createAleart];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(int)addTodoId {
    // DB接続
    ViewController *viewController = [[ViewController alloc] init];
    FMDatabase *db = [viewController connectDataBase:ToDoDatabaseName];
    //count文の作成
    NSString *countTodoId = [[NSString alloc] initWithFormat:@"select count(*) as count from tr_todo where todo_id"];
    
    // DBをオープン
    [db open];
    // セットしたcount文を回して、todo_idの数を数える
    FMResultSet *countRequest = [db executeQuery:countTodoId];
    if([countRequest next]) {
        self.todoId = [countRequest intForColumn:@"count"];
    }
    // DBを閉じる
    [db close];
    
    int latestToDoId = self.todoId + 1;
    
    return latestToDoId;
}

- (NSString *)getCreated {
    // 当日の日付を取得
    //NSDateFormatterクラスを出力する。
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    //出力形式を文字列で指定する。
    [format setDateFormat:@"yyyy/MM/dd"];
    
    // 現在時刻を取得しつつ、NSDateFormatterクラスをかませて、文字列を出力する。
    NSString *todayDate = [format stringFromDate:[NSDate date]];
    
    return todayDate;
}

// n日後の期日を設定（現在は固定）
- (NSString *)getLimitDate {
    //NSDateFormatterクラスを出力する。
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    //出力形式を文字列で指定する。
    [format setDateFormat:@"yyyy/MM/dd"];
    // 日付のオフセットを生成
    NSDateComponents *dateComp = [[NSDateComponents alloc] init];
    // n日後を指定
    [dateComp setDay:TodoLimitAfterDays];
    // n日後のNSDateインスタンスを取得する
    NSDate *futureDate = [NSCalendar.currentCalendar dateByAddingComponents:dateComp toDate:[NSDate date] options:0];
    // n日後のインスタンスをフォーマットにはめて返す
    NSString *limitLineDate = [format stringFromDate:futureDate];
    
    return limitLineDate;
}

// タイトル空欄時に表示するアラートを作成
- (void)createAleart {
    //アラートコントローラーの生成
    self.registerAlertController = [UIAlertController
                                    alertControllerWithTitle:@"未入力"
                                                     message:@"タイトルを入力してください。"
                                              preferredStyle:UIAlertControllerStyleAlert];
    self.doneAlertController = [UIAlertController
                                alertControllerWithTitle:@"登録完了"
                                                 message:nil
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    // OKボタンと処理内容を用意
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                               }];
    
    // 登録成功の確認ログ用ボタン
    UIAlertAction *backTopButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        self.todoNameTextView.text = @"";
                                        self.todoContentsTextField.text = @"";
                                        [self.todoNameTextView becomeFirstResponder];
                                    }];
    // 用意したボタンアクションをアラートコントローラーにセット
    [self.registerAlertController addAction:okButton];
    [self.doneAlertController addAction:backTopButton];
}

// 登録アクション
- (void)registerAction {
    
    ViewController *viewController = [[ViewController alloc] init];
    FMDatabase *db = [viewController connectDataBase:ToDoDatabaseName];
    
    // todoIdをセット（0をセットまたは+1で返す）
    self.todoId = [self addTodoId];
    // createdを取得
    self.created = [self getCreated];
    // modifiedを取得
    self.modified = [self getCreated];
    // limitDateを取得
    self.limitDate = [self getLimitDate];
    // deleteFlagを設定
    self.deleteFlag = 0;
    // テキストフィールドからタイトルを取得
    self.todoTitle = self.todoNameTextView.text;
    // テキストビューから内容を取得
    self.todoContents = self.todoContentsTextField.text;
    
    // 取得した情報をデータベースに登録
    NSString *insert = [[NSString alloc] initWithFormat:@"INSERT INTO tr_todo(todo_id, todo_title, todo_contents, created, modified, limit_date, delete_flg) VALUES('%d', '%@', '%@', '%@', '%@', '%@', '%zd')", self.todoId, self.todoTitle, self.todoContents, self.created, self.modified, self.limitDate, self.deleteFlag];

    [db open];
    [db executeUpdate:insert];
    [db close];
    
    // 処理完了後、登録成功のアラートを表示
    [self presentViewController:self.doneAlertController animated:YES completion:nil];
}

- (IBAction)todoRegisterBtn:(id)sender {
    // タイトルが空欄の場合はアラートを出し、問題がなければ登録アクションの呼び出し
    if (self.todoNameTextView.text.length == 0) {
        [self presentViewController:self.registerAlertController animated:YES completion:nil];
    } else {
        [self registerAction];
    }
}

// 背景タップでキーボードを閉じる
- (IBAction)closeKeyboardWhenTapBackground:(id)sender {
    [self.view endEditing:YES];
}

// リターンキーでキーボードを下げる
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
