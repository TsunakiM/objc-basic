//
//  ViewController.m
//  traning2-1-10
//
//  Created by MAC管理者 STV on 2017/09/09.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *cardImagesNameArray;
@property (strong, nonatomic) NSArray *cardTestsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView.estimatedRowHeight = 70;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
    
    
    //プロジェクト内のファイルにアクセスできるオブジェクトを宣言
    NSBundle *bundle = [NSBundle mainBundle];
    //読み込むプロパティリストのファイルパスを指定
    NSString *path = [bundle pathForResource:@"PropertyList" ofType:@"plist"];
    //プロパティリストの中身データを取得
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    // キー値を元に各自データリストを取得
    self.cardImagesNameArray = [dic objectForKey:@"CardImage"];
    self.cardTestsArray = [dic objectForKey:@"CardText"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Table Viewのセクション数を指定
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 今回はセクション１個
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MIN(self.cardImagesNameArray.count, self.cardTestsArray.count);
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"tableCell";
    // tableCell の ID で UITableViewCell のインスタンスを生成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    UIImage *img = [UIImage imageNamed:self.cardImagesNameArray[indexPath.row]];
    // Tag番号 1 で UIImageView インスタンスの生成
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:1];
    imageView.image = img;
    
    // Tag番号 ２ で UILabel インスタンスの生成
    UILabel *label = (UILabel *)[cell viewWithTag:2];
    label.numberOfLines = 0;
    label.text = self.cardTestsArray[indexPath.row];
    //[label sizeToFit];
    
    return cell;
}


@end
