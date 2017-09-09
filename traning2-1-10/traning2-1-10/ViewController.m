//
//  ViewController.m
//  traning2-1-10
//
//  Created by MAC管理者 STV on 2017/09/08.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *textFromPlist;
@property (strong, nonatomic) NSArray *imageNameFromPlist;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate =  self;
    self.tableView.dataSource = self;
    
    NSBundle* bundle = [NSBundle mainBundle];
    //読み込むファイルパスを指定
    NSString* path = [bundle pathForResource:@"cardList" ofType:@"plist"];
    NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.imageNameFromPlist = [dic objectForKey:@"cardImage"];
    self.textFromPlist = [dic objectForKey:@"cardText"];
    NSLog(@"%@", self.textFromPlist);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageNameFromPlist.count;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // インスタンス化
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    // ストーリーボードのラベルをインスタンス化
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    // ラベルの行数設定を無制限にする
    label.numberOfLines = 0;
    // ラベルテキストをセット
    label.text = self.textFromPlist[indexPath.row];
    // ストーリーボードのイメージビューをインスタンス化
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:2];
    // 画像をセット
    imageView.image = [UIImage imageNamed:self.imageNameFromPlist[indexPath.row]];
    // セルを実装
    return cell;
}

@end
