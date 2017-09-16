//
//  ViewController.m
//  traning2-3-1
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//
/*
 オブジェクト型　　 保存メソッド　　　　　  取得メソッド
 id,Object      ┃setObject: forKey: ┃objectForKey:
 NSString       ┃setObject: forKey:	┃stringForKey:
 NSArray        ┃setObject: forKey:	┃arrayForKey:
 NSArray        ┃setObject: forKey:	┃stringArrayForKey:
 NSDictionary   ┃setObject: forKey:	┃dictionaryForKey:
 NSData         ┃setObject: forKey:	┃dataForKey:
 NSInteger      ┃setInteger: forKey:┃integerForKey:
 float          ┃setFloat: forKey:	┃floatForKey:
 double         ┃setDouble: forKey:	┃doubleForKey:
 BOOL           ┃setBool: forKey:	┃boolForKey:
 NSURL          ┃setURL: forKey:	┃URLForKey:
 
 参考サイト
 http://glassonion.hatenablog.com/entry/20110920/1316473990
 */

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstAccessResponseLabel;
@property (weak, nonatomic) IBOutlet UILabel *intUserDefaultLabel;
@property (weak, nonatomic) IBOutlet UILabel *doubleUserDefaultLabel;
@property (weak, nonatomic) IBOutlet UILabel *stringUserDefaultLabel;
@property (weak, nonatomic) IBOutlet UIButton *intUserDefaultShowBtn;
@property (weak, nonatomic) IBOutlet UIButton *doubleUserDefaultShowBtn;
@property (weak, nonatomic) IBOutlet UIButton *stringUserDefaultShowBtn;
@property (weak, nonatomic) IBOutlet UIButton *intUserDefaultChangeBtn;
@property (weak, nonatomic) IBOutlet UIButton *doubleUserDefaultChangeBtn;
@property (weak, nonatomic) IBOutlet UIButton *stringUserDefaultChangeBtn;

@property NSUserDefaults *userData;
@property NSArray *stringArray;

@end

static NSString * const firstAccessKey = @"firstAccess";
static NSString * const intUserDefaultkey = @"intUserDefault";
static NSString * const doubleUserDefaultKey = @"doubleUserDefault";
static NSString * const stringUserDefaultKey = @"stringUserDefault";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UserDefaultsファイルの読み込み
    self.userData = [NSUserDefaults standardUserDefaults];
    // 初回起動かどうかのチェック
    if ([self.userData boolForKey:firstAccessKey]) {
        // 初回起動の場合の処理
        self.firstAccessResponseLabel.text = [[NSBundle mainBundle]localizedStringForKey:@"notFirstAccessString"
                                                                                   value:nil
                                                                                   table:@"Localizable"];
    } else {
        // 二回目以降の起動の場合の処理
        [self.userData setBool:YES forKey:firstAccessKey];
        [self.userData synchronize];
        self.firstAccessResponseLabel.text = [[NSBundle mainBundle]localizedStringForKey:@"firstAccessString"
                                                                                   value:nil
                                                                                   table:@"Localizable"];
    }
    
    self.stringArray = @[@"りんご", @"バナナ", @"みかん", @"いちご", @"りんご"];
    
    // Stringをセット
    [self.intUserDefaultShowBtn setTitle:[[NSBundle mainBundle]localizedStringForKey:@"lordIntUserDefaultBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
    [self.intUserDefaultChangeBtn setTitle:[[NSBundle mainBundle]localizedStringForKey:@"changeIntUserDefaultBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
    [self.doubleUserDefaultShowBtn setTitle:[[NSBundle mainBundle]localizedStringForKey:@"lordDoubleUserDefaultBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
    [self.doubleUserDefaultChangeBtn setTitle:[[NSBundle mainBundle]localizedStringForKey:@"changeDoubleUserDefaultBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
    [self.stringUserDefaultShowBtn setTitle:[[NSBundle mainBundle]localizedStringForKey:@"lordStringUserDefaultBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
    [self.stringUserDefaultChangeBtn setTitle:[[NSBundle mainBundle]localizedStringForKey:@"changeStringUserDefaultBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Int型の確認
- (IBAction)intLordBtn:(id)sender {
    if([self.userData integerForKey:intUserDefaultkey]) {
        self.intUserDefaultLabel.text = [NSString stringWithFormat:@"%zd", [self.userData integerForKey:intUserDefaultkey]];
    }
}
// Int型の変更・保存
- (IBAction)intChangeBtn:(id)sender {
    int randomNumber = (int)(arc4random_uniform(100));
    [self.userData setInteger:randomNumber forKey:intUserDefaultkey];
    NSLog(@"SetInt: %zd", randomNumber);
    [self.userData synchronize];
    
}
// Double型の確認
- (IBAction)doubleLordBtn:(id)sender {
    if([self.userData doubleForKey:doubleUserDefaultKey]) {
        self.doubleUserDefaultLabel.text = [NSString stringWithFormat:@"%g", [self.userData doubleForKey:doubleUserDefaultKey]];
    }
}
// Double型のセット・保存
- (IBAction)doubleChangeBtn:(id)sender {
    double forSetDouble = 123.456;
    [self.userData setDouble:forSetDouble forKey:doubleUserDefaultKey];
    NSLog(@"SetDouble: %g", forSetDouble);
    [self.userData synchronize];
}
// String型の確認
- (IBAction)stringLordBtn:(id)sender {
    if([self.userData objectForKey:stringUserDefaultKey]) {
        self.stringUserDefaultLabel.text = [self.userData objectForKey:stringUserDefaultKey];
    }
}
// String型の変更・保存
- (IBAction)stringChangeBtn:(id)sender {
    int randomNum = (int)(arc4random_uniform((uint32_t)self.stringArray.count));
    [self.userData setObject:self.stringArray[randomNum] forKey:stringUserDefaultKey];
    NSLog(@"SetString: %@", self.stringArray[randomNum]);
    [self.userData synchronize];
}

@end
