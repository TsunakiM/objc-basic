//
//  ViewController.m
//  traning2-1-11
//
//  Created by MAC管理者 STV on 2017/09/09.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic) NSArray *sectionNameArray;
@property (strong, nonatomic) NSMutableArray *cardImageNameArray;
@property (strong, nonatomic) NSMutableArray *cardTextArray;
@property NSDictionary *plistDictionary;

@end

typedef NS_ENUM(NSInteger, SectionTitle) {
    Humans = 0,
    Spells
};

static const NSUInteger HeightForHeaderInSection = 30;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView.estimatedRowHeight = 120;
    self.mainTableView.rowHeight = UITableViewAutomaticDimension;
    
    // 再利用可能なセルの作成（storybord側のIdentifierを設定すれば不要？）
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableCell"];
    
    // bundle宣言をして、ファイルにアクセスできるようにして、
    NSBundle *bundle = [NSBundle mainBundle];
    // ファイルのアクセスパスを、文字列として保存して、
    NSString *path = [bundle pathForResource:@"PropertyList" ofType:@"plist"];
    // 定義したDictionaryに、plistを格納する。
    self.plistDictionary = [NSDictionary dictionaryWithContentsOfFile:path];

    self.sectionNameArray = [self.plistDictionary objectForKey:@"SectionTitleList"];
    self.cardImageNameArray = [@[] mutableCopy];
    self.cardTextArray = [@[] mutableCopy];
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
    return HeightForHeaderInSection;
}

// セルの数（必須メソッド）
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case Humans:
            self.cardImageNameArray = [self.plistDictionary objectForKey:@"HumanCardImageName"];
            break;
            
        case Spells:
            self.cardImageNameArray = [self.plistDictionary objectForKey:@"SpellCardImageName"];
            break;
            
        default:
            break;
    }
    return self.cardImageNameArray.count;
}

// セルの作成（必須メソッド）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"tableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // セクションのインデックスによって別々のテキストと画像の配列を用意する
    switch (indexPath.section) {
        case Humans:
            self.cardImageNameArray = [self.plistDictionary objectForKey:@"HumanCardImageName"];
            self.cardTextArray = [self.plistDictionary objectForKey:@"HumanCardText"];
            break;
        case Spells:
            self.cardImageNameArray = [self.plistDictionary objectForKey:@"SpellCardImageName"];
            self.cardTextArray = [self.plistDictionary objectForKey:@"SpellCardText"];
            break;
        default:
            break;
    }
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.cardTextArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.cardImageNameArray[indexPath.row]];

    return cell;
}

@end
