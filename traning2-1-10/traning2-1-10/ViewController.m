//
//  ViewController.m
//  traning2-1-10
//
//  Created by MAC管理者 STV on 2017/09/07.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // デリゲートdelegate、dataSourceに接続。
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    
    // セルの高さをセル内のレイアウトに準拠するように設定
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
    // セルの最低限の高さを設定
    self.mainTableView.estimatedRowHeight = 60.0;
    // 自作plistを、配列にセットする流れ
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"myPropertyList" ofType:@"plist"];
    NSDictionary *myPropatyListDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    self.imagesFromPlist = [myPropatyListDictionary objectForKey:@"ImageName"];
    self.textsFromPlist = [myPropatyListDictionary objectForKey:@"Text"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// セルの数を決定するメソッド
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imagesFromPlist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // インスタンス化
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    // ストーリーボードのラベルをインスタンス化
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    // ラベルの行数設定を無制限にする
    label.numberOfLines = 3;
    // ラベルテキストをセット
    label.text = self.textsFromPlist[indexPath.row];
    // ストーリーボードのイメージビューをインスタンス化
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:3];
    // 画像をセット
    imageView.image = [UIImage imageNamed:self.imagesFromPlist[indexPath.row]];
    // セルを実装
    return cell;

}

@end
