//
//  ViewController.m
//  traning2-1-12
//
//  Created by 増田紘宜 on 2017/09/13.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
// カスタムセルのインポート
#import "CustomCellCollectionViewCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property NSUInteger cellSize;
@property NSArray *nationalFlagIconArray;

@end

/*~~~ セルのステータスの定数 ~~~*/
static const NSUInteger CellSpace = 15;
static const NSUInteger NumberOfSectionsInCollectionView = 1;
static const NSUInteger NumberOfItemsInSection = 9;
static const NSUInteger NumberOfSellInLow = 3;
static const NSUInteger NumberOfSellSpace = 4;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // storybord側で、delegateとdataSourceに接続済み。
    /*~~~ セルの大きさを決める計算 ~~~*/
    // 画面のサイズを取得
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    // 横幅の決定。横幅からセル間のスペースを引いたものを、横に表示したい数で割る。
    self.cellSize = (screenSize.size.width - CellSpace * NumberOfSellSpace) / NumberOfSellInLow;
    
    // 表示用の画像のファイル名
    self.nationalFlagIconArray = @[@"Algeria", @"Australia", @"Austria", @"Bangladesh", @"Canada", @"Israel", @"Japan", @"Micronesia", @"UK"];
    // Nibファイル（xib）を接続
    [self.mainCollectionView registerNib:[UINib nibWithNibName:@"CustomCellCollectionViewCell"
                                                        bundle:nil]
              forCellWithReuseIdentifier: CellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// セクションの数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return NumberOfSectionsInCollectionView;
}

// 画面全体に存在させたいセルの数（セルの合計個数）
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return NumberOfItemsInSection;
}

// 1セルあたりのサイズを計算
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // セルのサイズ。正方形になるよう、横幅を縦横それぞれに設定。
    CGSize listCellSize = CGSizeMake(self.cellSize, self.cellSize);
    return listCellSize;
}

// セルを表示させる
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // デフォルトのCollectionViewCellは、画像を保持するプロパティがないので、カスタムクラスを作成してインスタンス化。
    CustomCellCollectionViewCell *cell = [collectionView
                                          dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                    forIndexPath:indexPath];
    cell.cellImage.image= [UIImage imageNamed:self.nationalFlagIconArray[indexPath.row]];
     
    return cell;
}

@end
