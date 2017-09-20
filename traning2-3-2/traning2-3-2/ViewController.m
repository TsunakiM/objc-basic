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
@property (strong, nonatomic) NSMutableArray *todoId;
@property (strong, nonatomic) NSMutableArray *titleList;
@property (strong, nonatomic) NSMutableArray *limitDateList;
@property (strong, nonatomic) NSMutableArray *todoListArray;
@property (nonatomic) NSUInteger cellCount;

- (void)createTable;
- (void)createDataSource;
- (void)numberOfSell;
- (void)refreshTableCell;
- (void)deleteTableCell;
- (int)countId;

typedef NS_ENUM(NSUInteger, todoListENUM) {
    todo_id,
    todo_title,
    limit_date
};

@end

// グローバル定数
NSString *const ToDoDatabaseName = @"todoDatabase.db";
NSString *const ToDoDatabaseTableName = @"tr_todo";
// ローカル定数
static NSString *const ToDoShowCellNibName = @"CustomTableViewCell";
static NSString *const ToDoShowCellIdentifer = @"todoCell";
static NSString *const InitialActivationCheckKey = @"InitialActivation";
static const CGFloat HeightForRowAtIndexPath = 80;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初回起動
    if([self initialActivationCheck]) {
        [self createTable];
    }
    
    UINib *nib = [UINib nibWithNibName:ToDoShowCellNibName bundle:nil];
    [self.mainTableView registerNib:nib forCellReuseIdentifier:ToDoShowCellIdentifer];
}

// ロードするたびに、テーブルにリロードをかける。
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self refreshTableCell];
}

// テーブルのリロード（再配置）。
- (void)refreshTableCell {
    // セルの数を決定する。
    // カウントを初期化して、
    self.cellCount = 0;
    // 表示するセルの数をカウントし、
    [self numberOfSell];
    // DataSourceを作成し、
    [self createDataSource];
    // テーブルをリロード。
    [self.mainTableView reloadData];
}

// テーブルの削除
- (void)deleteTableCell {
    // セルの数を決定する。
    // カウントを初期化して、
    self.cellCount = 0;
    // 表示するセルの数をカウントし、
    [self numberOfSell];
    // DataSourceを作成する。
    [self createDataSource];
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
    NSString *createTableString = @""
                    "CREATE TABLE IF NOT EXISTS "
                        "tr_todo ( "
                            "`todo_id` INTEGER NOT NULL, "
                            "`todo_title` TEXT NOT NULL, "
                            "`todo_contents` TEXT, "
                            "`created` REAL NOT NULL, "
                            "`modified` REAL NOT NULL, "
                            "`limit_date` REAL, "
                            "`delete_flg` INTEGER NOT NULL DEFAULT 0, "
                        "PRIMARY KEY(`todo_id`) );";
    // DBを開けて、
    [db open];
    // テーブルを作って、
    [db executeUpdate:createTableString];
    // DBを閉じる。
    [db close];
}

// DBに存在するすべての行数を数える。
- (int)countId {
    // DB接続
    ToDoEditViewController *todoEditViewController = [[ToDoEditViewController alloc]init];
    FMDatabase *db = [self connectDataBase:ToDoDatabaseName];
    
    //count文の作成
    NSString *countId = [[NSString alloc]initWithFormat:@""
                         "SELECT "
                            "count(*) as count "
                         "FROM "
                            "tr_todo "
                         "WHERE "
                            "todo_id"];
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

// 表示するセルの数を数える（delete_flg = 0のもの）。
- (void)numberOfSell {
    FMDatabase *db = [self connectDataBase:ToDoDatabaseName];
    //count文の作成
    NSString *countFlag = [[NSString alloc]initWithFormat:@""
                         "SELECT "
                            "count(*) as count "
                         "FROM "
                            "tr_todo "
                         "WHERE "
                            "delete_flg = 0"];
    // DBをオープン
    [db open];
    // セットしたcount文を回して、todo_idの数を数える
    FMResultSet *countNumberOfCell = [db executeQuery:countFlag];
    if([countNumberOfCell next]) {
        self.cellCount = [countNumberOfCell intForColumn:@"count"];
    }
    // DBを閉じる
    [db close];
    // 数えた値を返す
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
    // DBから、delete_flg = 0の行を、期日が早い順（昇順）で取り出す用の文字列。
    NSString *displayCellSearchString = [[NSString alloc] initWithFormat:@""
                          "SELECT "
                            "* "
                          "FROM "
                            "tr_todo "
                          "WHERE "
                            "delete_flg = 0 "
                          "ORDER BY "
                            "limit_date asc"];
    // DBを開く
    [db open];
    // FMResultSetにDB先をセット
    FMResultSet *displayCellContents = [db executeQuery:displayCellSearchString];
    self.todoId = [@[] mutableCopy];
    self.titleList = [@[] mutableCopy];
    self.limitDateList = [@[] mutableCopy];
    self.todoListArray = [@[] mutableCopy];
    
    while ([displayCellContents next]) {
        NSString *toDoid = [displayCellContents stringForColumn:@"todo_id"];
        NSString *title = [displayCellContents stringForColumn:@"todo_title"];
        NSString *limit = [displayCellContents stringForColumn:@"limit_date"];
        NSArray *aToDoListArray = @[toDoid, title, limit];
        [self.todoListArray addObject:aToDoListArray];
    }
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
    cell.todoName.text = self.todoListArray[indexPath.row][todo_title];
    cell.limitDate.text = [[NSString alloc] initWithFormat:@"期限日：%@", self.todoListArray[indexPath.row][limit_date]];
    // セルを返す
    return cell;
}

// セルをスワイプで削除する画面を表示する。
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        FMDatabase *db = [self connectDataBase:ToDoDatabaseName];
        NSString *deleteTarget = [[NSString alloc] initWithFormat:@""
                                  "UPDATE "
                                    "tr_todo "
                                  "SET "
                                    "delete_flg = 1 "
                                  "WHERE "
                                    "todo_id = %@;",
                                  self.todoListArray[indexPath.row][todo_id]];
        [db open];
        [db executeUpdate:deleteTarget];
        [db close];
    }
    // 削除用のメソッドを呼び出し。
    [self deleteTableCell];
    // 削除アニメーション + 現在保持するデータに更新。
    [self.mainTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

// セルの幅（固定）
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return HeightForRowAtIndexPath;
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
