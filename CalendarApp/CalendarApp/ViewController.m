//
//  ViewController.m
//  CalendarApp
//
//  Created by 増田紘宜 on 2017/09/27.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "CalendarCell.h"
#import "CalenderHeaderSection.h"


@implementation NSDate (Extension)

/**
 *  Return the date one month before the receiver.
 *
 *  @return  date
 */
- (NSDate *)monthAgoDate
{
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

/**
 *  Return the date one month after the receiver.
 *
 *  @return  date
 */
- (NSDate *)monthLaterDate
{
    NSInteger addValue = 1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

@end


@interface ViewController ()
@property (nonatomic, weak) IBOutlet UICollectionView *mainCollectionView;
@property (nonatomic, strong) NSDate *selectedDate;
@property NSUInteger cellSize;
@property (nonatomic, weak) NSString *headerString;

@end

#pragma mark LocalConstants
// １行に表示するセルの数
static const NSUInteger DaysPerWeek = 7;
// セル間のスペースのサイズ。
static const NSUInteger CellSpaceSize = 5;
// セル間のスペースの数
static const NSUInteger NumberOfSellSpace = DaysPerWeek + 1;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.selectedDate = [NSDate date];
    
    // storybord側で、delegateとdataSourceに接続済み。
    /*~~~ セルの大きさを決める計算 ~~~*/
    // 画面のサイズを取得
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    // 横幅の決定。横幅からマージンを引いたものを、横に表示したい数で割る。
    self.cellSize = (screenSize.size.width - (CellSpaceSize * NumberOfSellSpace)) / DaysPerWeek;
    
    // Nibファイル（xib）を接続
    UINib *customSellNib = [UINib nibWithNibName:@"CalendarCell" bundle:nil] ;
    UINib *customSectionNib = [UINib nibWithNibName:@"CalenderHeaderSection" bundle:nil];
    [self.mainCollectionView registerNib:customSellNib
              forCellWithReuseIdentifier:CalendarCellIdentifier];
    [self.mainCollectionView registerNib:customSectionNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                     withReuseIdentifier:CalenderHeaderIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - BtnAction

- (IBAction)goPreviousMonthBtn:(id)sender {
    self.selectedDate = [self.selectedDate monthAgoDate];
    
    [self.mainCollectionView reloadData];
}

- (IBAction)goNextMonthBtn:(id)sender {
    self.selectedDate = [self.selectedDate monthLaterDate];
    
    [self.mainCollectionView reloadData];
}

#pragma mark - LocalMethod

- (void)setSelectedDate:(NSDate *)selectedDate {
    _selectedDate = selectedDate;
    
    // update title text
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy/M";
    self.headerString = [formatter stringFromDate:selectedDate];
}
- (NSDate *)firstDateOfMonth {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay
                                                                   fromDate:self.selectedDate];
    components.day = 1;
    
    NSDate *firstDateMonth = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    return firstDateMonth;
}

- (NSDate *)dateForCellAtIndexPath:(NSIndexPath *)indexPath {
    // calculate the ordinal number of first day
    NSInteger ordinalityOfFirstDay = [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                                             inUnit:NSCalendarUnitWeekOfMonth
                                                                            forDate:self.firstDateOfMonth];
    
    // calculate the difference between "day number of cell at indexPath" and "day number of first day"
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.day = indexPath.item - (ordinalityOfFirstDay - 1);
    
    NSDate *date = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents
                                                                 toDate:self.firstDateOfMonth
                                                                options:0];
    return date;
}

#pragma mark - Section Header

// セクションの数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

// セクションの内容を決定
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    // セクションヘッダ・フッタを引っ張ってくる。
    UICollectionReusableView* reusableview = nil;

    CalenderHeaderSection *headerView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:CalenderHeaderIdentifier
                                              forIndexPath:indexPath];

    if(kind == UICollectionElementKindSectionHeader) {
        switch (indexPath.section) {
            case 0:
                headerView.customSectionLabel.text = self.headerString;
                reusableview = headerView;
                break;
            case 1:
                headerView.customSectionLabel.text = @"";
                reusableview = headerView;
                break;
            default:
                break;
        }
    }
    return reusableview;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize headerHight;
    switch (section) {
        case 0:
            headerHight = CGSizeMake(50, 50);
            break;
        case 1:
            headerHight = CGSizeMake(0, 0);
            break;
        default:
            NSLog(@"ERROR!! referenceSizeForHeaderInSection");
            headerHight = CGSizeMake(0, 0);
            break;
    }
    return headerHight;
}

#pragma mark - Cell Contents

// 画面全体に存在させたいセルの数（セルの合計個数）
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSRange rangeOfWeeks =
    [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                       inUnit:NSCalendarUnitMonth
                                      forDate:self.firstDateOfMonth];
    NSUInteger numberOfWeeks = rangeOfWeeks.length;
    NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
    
    switch (section) {
        case 0:
            return DaysPerWeek;
            break;
        case 1:
            return numberOfItems;
            break;
        default:
            NSLog(@"ERROR!! numberOfItemsInSection");
            return 0;
            break;
    }
    
}

// 1セルあたりのサイズを計算
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize cellSize;
    switch (indexPath.section) {
        case 0:
            cellSize = CGSizeMake(self.cellSize, self.cellSize);
            break;
        case 1:
            cellSize = CGSizeMake(self.cellSize, self.cellSize * 1.3f);
            break;
        default:
            NSLog(@"ERROR!! sizeForItemAtIndexPath");
            cellSize = CGSizeMake(self.cellSize, self.cellSize);
            break;
    }
    
    return cellSize;
}

// セルを表示させる
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // デフォルトのCollectionViewCellは、画像を保持するプロパティがないので、カスタムクラスを作成してインスタンス化。
    CalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CalendarCellIdentifier
                                                                   forIndexPath:indexPath];
    cell.calenderCellContentLabel.textColor = [UIColor blackColor];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"d";
    NSArray *weekName = @[@"日", @"月", @"火", @"水", @"木", @"金", @"土"];
    switch (indexPath.section) {
        case 0:
            cell.calenderCellContentLabel.text = weekName[indexPath.row];
            break;
        case 1:
            cell.calenderCellContentLabel.text = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
            break;
        default:
            break;
    }
    
    switch (indexPath.row % 7) {
        case 6:
            cell.calenderCellContentLabel.textColor = [UIColor blueColor];
            break;
        case 0:
            cell.calenderCellContentLabel.textColor = [UIColor redColor];
            break;
        default:
            break;
    }
    
    return cell;
}

@end
