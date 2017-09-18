//
//  ViewController.m
//  traning2-3-2
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "ToDoEditViewController.h"
#import "CustomTableViewCell.h"
#import "FMDatabase.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic) int cellCount;
@property (strong, nonatomic) NSMutableArray *todoId;
@property (strong, nonatomic) NSMutableArray *titleList;
@property (strong, nonatomic) NSMutableArray *limitDateList;
@property (strong, nonatomic) NSMutableArray *todoListArray;

- (void)createTable;
- (void)createDataSource;
- (int)countId;

@end
// グローバル定数
NSString *const ToDoDatabaseName = @"todoDatabase.db";
NSString *const ToDoDatabaseTableName = @"tr_todo";
// ローカル定数
static NSString *const ToDoShowCellNibName = @"CustomTableViewCell";
static NSString *const ToDoShowCellIdentifer = @"todoCell";
static NSString *const InitialActivationCheckKey = @"InitialActivation";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if([self initialActivationCheck]) {
        [self createTable];
    }
    
    UINib *nib = [UINib nibWithNibName:ToDoShowCellNibName bundle:nil];
    [self.mainTableView registerNib:nib forCellReuseIdentifier:ToDoShowCellIdentifer];
}

// ロード後に毎回、セルの数を決定、リロードをかける
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    // セルの数を決定する(初期化をしてから)
    self.cellCount = 0;
    self.cellCount = [self countId];
    // ここでDataSourceを作る
    [self createDataSource];
    // テーブルをリロード
    [self.mainTableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// カラムの作成（初回起動時に呼んでくる用）
- (void)createTable {
    // DBに接続。
    FMDatabase *db = [self connectDataBase:ToDoDatabaseName];
    // カラムが存在しない場合に、以下のカラムを作成
    NSString *createTableString = @"CREATE TABLE IF NOT EXISTS tr_todo ( `todo_id` INTEGER NOT NULL, `todo_title` TEXT NOT NULL, `todo_contents` TEXT, `created` REAL NOT NULL, `modified` REAL NOT NULL, `limit_date` REAL, `delete_flg` INTEGER NOT NULL DEFAULT 0, PRIMARY KEY(`todo_id`) );";
    // DBを開けて、
    [db open];
    // テーブルを作って、
    [db executeUpdate:createTableString];
    // DBを閉じる。
    [db close];
}

- (int)countId {
    // DB接続
    ToDoEditViewController *todoEditViewController = [[ToDoEditViewController alloc]init];
    FMDatabase *db = [self connectDataBase:ToDoDatabaseName];
    
    //count文の作成
    NSString *countId = [[NSString alloc]initWithFormat:@"select count(*) as count from tr_todo where todo_id"];
    // DBをオープン
    [db open];
    // セットしたcount文を回して、todo_idの数を数える
    FMResultSet *countRequest = [db executeQuery:countId];
    if([countRequest next]) {
        todoEditViewController.todoId = [countRequest intForColumn:@"count"];
    }
    // DBを閉じる
    [db close];
    // 数えた値を返す
    return todoEditViewController.todoId;
}

// DBと接続するメソッド（あとでModelへ）
- (id)connectDataBase:(NSString *)dbName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir = paths[0];
    FMDatabase *database = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:dbName]];
    return database;
}

//DataSourceを作成
- (void)createDataSource {
    // DBの呼び出し
    FMDatabase *db = [self connectDataBase:ToDoDatabaseName];
    //select文の作成（DB内のデータをlimitDateカラムに準ずる形で並べ替えて取り出す）
    // どのDBからデータを取得するかを指定
    NSString *select = [[NSString alloc] initWithFormat:@"SELECT * from tr_todo order by limit_date asc"];
    // DBを開く
    [db open];
    // FMResultSetにDB先をセット
    FMResultSet *resultSet = [db executeQuery:select];
    //　カラムtodoTitle,limitDateの値を格納する配列を用意
    self.todoId = [@[] mutableCopy];
    self.titleList = [@[] mutableCopy];
    self.limitDateList = [@[] mutableCopy];
    self.todoListArray = [@[] mutableCopy];
    
    while([resultSet next]) {
        // ラベルに直接取り出した値を代入していく
        NSString *toDoid = [resultSet stringForColumn:@"todo_id"];
        //[self.todoId addObject:toDoid];
        NSString *title = [resultSet stringForColumn:@"todo_title"];
        //[self.titleList addObject:title];
        NSString *limit = [resultSet stringForColumn:@"limit_date"];
        //[self.limitDateList addObject:limit];
        NSArray *aToDoListArray = @[toDoid, title, limit];
        [self.todoListArray addObject:aToDoListArray];
    }
    NSLog(@"%@", self.todoListArray);
    // DBを閉じる
    [db close];
}

// 初回起動チェック用メソッド
- (BOOL)initialActivationCheck {
    // ローカルストレージUserDefaultsに接続
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    // 初回起動キーが存在する場合、NO（２回目以降の起動）を返す。
    if ([userDefaults objectForKey:InitialActivationCheckKey]) {
        return NO;
    }
    // 初回起動の場合、判定用キーのフラグをONにし、YES（初回起動）を返す。
    [userDefaults setBool:YES forKey:InitialActivationCheckKey];
    [userDefaults synchronize];
    return YES;
}

// セルの数（必須メソッド）
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellCount;
}

// セルの作成（必須メソッド）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // インスタンス化
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ToDoShowCellIdentifer forIndexPath:indexPath];
    // セルの番号に合わせて配列からテキストを入れていく
    cell.todoName.text = self.todoListArray[indexPath.row][1];
    cell.limitDate.text = [[NSString alloc] initWithFormat:@"期限日：%@", self.todoListArray[indexPath.row][2]];
    // セルを返す
    return cell;
}

// セルをスワイプで削除する画面を表示する。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"セルの中身: %@" , self.todoListArray[indexPath.row]);
    }
}

// セルの幅（固定）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end

/* 
 FMDB Copyright (c) 2008-2014 Flying Meat Inc.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */
