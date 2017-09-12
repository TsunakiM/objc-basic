//
//  ViewController.m
//  traning2-1-11
//
//  Created by MAC管理者 STV on 2017/09/09.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *sectionNameArray;
@property (strong, nonatomic) NSArray *cardImageNameArray;
@property (strong, nonatomic) NSArray *cardTextArray;
@property NSDictionary *plistDictionary;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView.estimatedRowHeight = 120;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"PropertyList" ofType:@"plist"];
    //プロパティリストの中身データを取得
    NSDictionary *plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    // キー値を元に各自データリストを取得
    self.sectionNameArray = [plistDictionary objectForKey:@"SectionTitleList"];
    self.cardImageNameArray = [plistDictionary objectForKey:@"HumanCardImageName"];
    self.cardTextArray = [plistDictionary objectForKey:@"HumanCardText"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// セクション数を設定
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionNameArray.count;
}
// セクションのヘッダータイトル
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionNameArray[section];
}

// セクションの高さ
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

// セルの数（必須メソッド）
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

// セルの作成（必須メソッド）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"tableCell";
    // "cell"というkeyでcellデータを取得。
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
     // cellデータが無い場合、UITableViewCellを生成して、"cell"というkeyでキャッシュする。
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // ストーリーボードのラベルをインスタンス化
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    // ストーリーボードのイメージビューをインスタンス化
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:2];

    // セクションのインデックスによって別々のテキストと画像の配列を用意する
    switch (indexPath.section) {
        case 0:
            self.cardImageNameArray = [self.plistDictionary objectForKey:@"HumanCardImageName"];
            self.cardTextArray = [self.plistDictionary objectForKey:@"HumanCardText"];
            break;
        case 1:
            self.cardImageNameArray = [self.plistDictionary objectForKey:@"SpellCardImageName"];
            self.cardTextArray = [self.plistDictionary objectForKey:@"SpellCardText"];
            break;
        
        default:
            break;
    }
    NSLog(@"てすと用 %@",self.cardTextArray);
    // ラベルテキストをセット
    label.text = self.cardTextArray[indexPath.row];
    // 画像をセット
    imageView.image = [UIImage imageNamed: self.cardImageNameArray[indexPath.row]];
    // セルを実装
    return cell;
}


@end
