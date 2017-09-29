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
- (NSDate *)monthAgoDate {
    NSInteger addValue = -1;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [NSDateComponents new];
    dateComponents.month = addValue;
    return [calendar dateByAddingComponents:dateComponents toDate:self options:0];
}

- (NSDate *)monthLaterDate {
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
@property (nonatomic, strong) NSString *headerDate;
@property NSUInteger cellSize;

typedef NS_ENUM (NSUInteger, SectionContents) {
    WeekNameContents,
    DayContents
};

typedef NS_ENUM (NSUInteger, DayOfTheWeek) {
    // indexPath.row % 7の結果
    Sunday = 0,
    Saturday = 6
};

@end

#pragma mark LocalConstants
// セクションの数
static const NSUInteger NumberOfSection = 2;
// ヘッダの高さ
static const NSUInteger HeaderHight = 70;
// １行に表示するセルの数
static const NSUInteger DaysPerWeek = 7;
// セル間のスペースのサイズ。
static const NSUInteger CellSpaceSize = 5;
// セル間のスペースの数
static const NSUInteger NumberOfSellSpace = DaysPerWeek + 1;
// セルの高さ倍率
static const float CellHightMagnification = 1.5f;

#pragma mark - ViewController

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.selectedDate = [NSDate date];
    
    // 画面のサイズを取得。
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    // 横幅の決定。横幅からマージンを引いたものを、横に表示したい数で割る。
    self.cellSize = (screenSize.size.width - (CellSpaceSize * NumberOfSellSpace)) / DaysPerWeek;
    
    
    // UIPanGestureRecognizer をインスタンス化します。また、イベント発生時に呼び出すメソッドを selector で指定します。
    UISwipeGestureRecognizer* swipeRightGesture = [[UISwipeGestureRecognizer alloc]
                                                   initWithTarget:self
                                                   action:@selector(selSwipeRightGesture:)];
    // 右スワイプのイベントを指定します。
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    // Viewへ関連付けします。
    [self.view addGestureRecognizer:swipeRightGesture];
    
    // UIPanGestureRecognizer をインスタンス化します。また、イベント発生時に呼び出すメソッドを selector で指定します。
    UISwipeGestureRecognizer* swipeLeftGesture = [[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self
                                                  action:@selector(selSwipeLeftGesture:)];
    // 左スワイプのイベントを指定します。
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    // Viewへ関連付けします。
    [self.view addGestureRecognizer:swipeLeftGesture];
    
    // Nibファイル（xib）を接続。
    UINib *customSellNib = [UINib nibWithNibName:@"CalendarCell" bundle:nil] ;
    [self.mainCollectionView registerNib:customSellNib
              forCellWithReuseIdentifier:CalendarCellIdentifier];
    UINib *customSectionNib = [UINib nibWithNibName:@"CalenderHeaderSection" bundle:nil];
    [self.mainCollectionView registerNib:customSectionNib
              forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                     withReuseIdentifier:CalenderHeaderIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Btn & Swipe Action

- (IBAction)goPreviousMonthBtn:(id)sender {
    [self goPreviousMonth];
}

- (IBAction)goNextMonthBtn:(id)sender {
    [self goNextMonth];
}

// 右スワイプされた時に実行されるメソッド、selectorで指定します。
- (void)selSwipeRightGesture:(UISwipeGestureRecognizer *)sender {
    [self goPreviousMonth];
}

// 左スワイプされた時に実行されるメソッド、selectorで指定します。
- (void)selSwipeLeftGesture:(UISwipeGestureRecognizer *)sender {
    [self goNextMonth];
}

- (void)goPreviousMonth {
    self.selectedDate = [self.selectedDate monthAgoDate];
    
    [self.mainCollectionView reloadData];
}

- (void)goNextMonth {
    self.selectedDate = [self.selectedDate monthLaterDate];
    
    [self.mainCollectionView reloadData];
}

#pragma mark - LocalMethod

- (void)setSelectedDate:(NSDate *)selectedDate {
    _selectedDate = selectedDate;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"yyyy月M日";
    self.headerDate = [formatter stringFromDate:selectedDate];
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

#pragma mark - Section Contents (Header)

// セクションの数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return NumberOfSection;
}

// セクションの内容を決定
- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView* reusableview = nil;

    CalenderHeaderSection *headerView =
    [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                       withReuseIdentifier:CalenderHeaderIdentifier
                                              forIndexPath:indexPath];

    if(kind == UICollectionElementKindSectionHeader) {
        switch (indexPath.section) {
            case WeekNameContents:
                headerView.customSectionLabel.text = self.headerDate;
                reusableview = headerView;
                break;
            case DayContents:
                headerView.customSectionLabel.text = @"";
                reusableview = headerView;
                break;
            default:
                break;
        }
    }
    return reusableview;
}

// セクションの高さを指定（１つ目を指定、２つ目のセクションを高さ0で非表示に）
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize headerHight;
    switch (section) {
        case WeekNameContents:
            headerHight = CGSizeMake(0, HeaderHight);
            break;
        case DayContents:
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

// セルの個数を計算
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSRange rangeOfWeeks =
    [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth
                                       inUnit:NSCalendarUnitMonth
                                      forDate:self.firstDateOfMonth];
    NSUInteger numberOfWeeks = rangeOfWeeks.length;
    NSInteger numberOfItems = numberOfWeeks * DaysPerWeek;
    
    switch (section) {
        case WeekNameContents:
            return DaysPerWeek;
            break;
        case DayContents:
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
        case WeekNameContents:
            cellSize = CGSizeMake(self.cellSize, self.cellSize);
            break;
        case DayContents:
            cellSize = CGSizeMake(self.cellSize, self.cellSize * CellHightMagnification);
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
    CalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CalendarCellIdentifier
                                                                   forIndexPath:indexPath];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"d";
    NSString *thisCellDay = [formatter stringFromDate:[self dateForCellAtIndexPath:indexPath]];
    NSArray *weekName = @[@"日", @"月", @"火", @"水", @"木", @"金", @"土"];
    
    // セルの中身の決定。
    switch (indexPath.section) {
        case WeekNameContents:
            cell.calenderCellContentLabel.text = weekName[indexPath.row];
            break;
        case DayContents:
            cell.calenderCellContentLabel.text = thisCellDay;
            break;
        default:
            break;
    }
    // セルの文字に色を付ける設定（土曜を青に、日曜を赤に。それ以外を黒に）。
    switch (indexPath.row % 7) {
        case Sunday:
            cell.calenderCellContentLabel.textColor = [UIColor redColor];
            break;
        case Saturday:
            cell.calenderCellContentLabel.textColor = [UIColor blueColor];
            break;
        default:
            cell.calenderCellContentLabel.textColor = [UIColor blackColor];
            break;
    }
    // 当月以外の日を非活性（灰色）にする処理。
    NSInteger cellDay = [thisCellDay integerValue];
    if(indexPath.section == 1 && indexPath.row < 7 && cellDay > 7) {
        cell.calenderCellContentLabel.textColor = [UIColor lightGrayColor];
    } else if (indexPath.section == 1 && indexPath.row > 25 && cellDay < 7){
        cell.calenderCellContentLabel.textColor = [UIColor lightGrayColor];
    }
    
    return cell;
}

@end
