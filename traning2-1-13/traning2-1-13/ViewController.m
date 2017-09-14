//
//  ViewController.m
//  traning2-1-13
//
//  Created by 増田紘宜 on 2017/09/14.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "CustomCollectionReusableView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property NSUInteger cellSize;
@property NSDictionary *plistDictionary;
@property NSArray *SectionNameArray;
@property NSMutableArray *nationalFlagIconArray;

typedef NS_ENUM(NSInteger, SectionTitle) {
    blueFlag = 0,
    redFlag,
    whiteFlag,
    symbolFlag,
    sunFlag
};

@end

// カスタムセル/カスタムセクションのIdentifierを設定したので、それを定数に。
static NSString* const CellIdentifier = @"CustumCell";
static NSString* const SectionIdentifier = @"HeaderView";
/*~~~ セルのステータスの定数 ~~~*/
// 画面内に存在するセルの数
static const NSUInteger NumberOfItemsInSection = 2;
// １行に表示する画像の数
static const NSUInteger NumberOfSellInLow = 2;
// セル間のスペースのサイズ
// storybordのCollectionView > Section Insetから4辺に同値を指定し、その値と同じにする。
static const NSUInteger CellSpaceSize = 10;
// セル間のスペースの数
static const NSUInteger NumberOfSellSpace = NumberOfSellInLow + 1;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // storybord側で、delegateとdataSourceに接続済み。
    /*~~~ セルの大きさを決める計算 ~~~*/
    // 画面のサイズを取得
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    // 横幅の決定。横幅からスペースを引いたものを、横に表示したい数で割る。
    self.cellSize = (screenSize.size.width - (CellSpaceSize * NumberOfSellSpace)) / NumberOfSellInLow;

   
    // Nibファイル（xib）を接続
    UINib *customSellNib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil] ;
    UINib *customSectionNib = [UINib nibWithNibName:@"CustomCollectionReusableView" bundle:nil];
    [self.mainCollectionView registerNib:customSellNib
              forCellWithReuseIdentifier:CellIdentifier];
    [self.mainCollectionView registerNib:customSectionNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                     withReuseIdentifier:SectionIdentifier];
    // bundle宣言をして、ファイルにアクセスできるようにして、
    NSBundle *bundle = [NSBundle mainBundle];
    // ファイルのアクセスパスを、文字列として保存して、
    NSString *path = [bundle pathForResource:@"PropertyList" ofType:@"plist"];
    // 定義したDictionaryに、plistを格納する。
    self.plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    self.SectionNameArray = [self.plistDictionary objectForKey:@"SectonName"];
    self.nationalFlagIconArray = [@[] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// セクションの数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.SectionNameArray.count;
}

// セクションの内容を決定
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    /*
     セクション部分はSupplement（補助的な）要素なので、使いたい旨を宣言する。
     viewForSupplementaryElementOfKindは、Supplementの種類を入れる。
     ヘッダーならUICollectionElementKindSectionHeaderを指定。
     */
    // セクションヘッダ・フッタを引っ張ってくる。
    UICollectionReusableView* reusableview = nil;
    // ヘッダにセクション名を指定。
    if (kind == UICollectionElementKindSectionHeader) {
        CustomCollectionReusableView *headerView =
        [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                           withReuseIdentifier:SectionIdentifier
                                                  forIndexPath:indexPath];
        headerView.customSectionLabel.text = self.SectionNameArray[indexPath.section];
        reusableview = headerView;
    }
    
    return reusableview;
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
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    // セクション名＝画像配列のキーなので、indexPath.sectionで指定。
    self.nationalFlagIconArray = [self.plistDictionary objectForKey:self.SectionNameArray[indexPath.section]];
    cell.customCellImageView.image = [UIImage imageNamed:self.nationalFlagIconArray[indexPath.row]];
    
    return cell;
}

@end
