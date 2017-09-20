//
//  ViewController.m
//  training2-4-2
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "WeatherAPIModel.h"

@interface ViewController ()
@property (strong, nonatomic) UIAlertController *alertController;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setAlertController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// アラートコントローラーとアクションシートを用意
- (void)setAlertController {
    // アラートコントローラーの生成
    self.alertController =
    [UIAlertController alertControllerWithTitle:[[NSBundle mainBundle]localizedStringForKey:@"selectDayString" value:nil table:@"Localizable"]
                                        message:[[NSBundle mainBundle]localizedStringForKey:@"whenWeatherShowStoring" value:nil table:@"Localizable"]
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    // コントローラにアクションを追加
    WeatherAPIModel *weatherAPIModel = [WeatherAPIModel new];
    [self.alertController addAction:[weatherAPIModel createSelectAction:today]];
    [self.alertController addAction:[weatherAPIModel createSelectAction:tomorrow]];
    [self.alertController addAction:[weatherAPIModel createSelectAction:afterTomorrow]];
    [self.alertController addAction:[weatherAPIModel createSelectAction:cancel]];
}

- (IBAction)outputWeatherForecastButton:(id)sender {
    // アクションシートを出力
    [self presentViewController:self.alertController animated:YES completion:nil];
}

@end
