//
//  ViewController.m
//  traning2-4-3
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

#import "CustomCell.h"
#import "WeatherAPIModel.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *weatherDataArray;
@property (strong, nonatomic) NSMutableArray *weatherIconURLArray;
@property (strong, nonatomic) NSString *weatherDiscriptionText;

typedef NS_ENUM(int, ActionType) {
    today,
    tomorrow,
    afterTomorrow,
};

typedef NS_ENUM(int, WeatherAPIContent) {
    WeatherDate,
    WheatherTelop,
};

@end

static const CGFloat CellEstimatedRowHeight = 80;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

#pragma mark API取得と値のセット
    WeatherAPIModel *apiModel = [WeatherAPIModel new];
    self.weatherDataArray = [@[] mutableCopy];
    self.weatherIconURLArray = [@[] mutableCopy];
    
    [apiModel getWeatherData:^(NSDictionary *weatherAPIDictionary){
        if(!weatherAPIDictionary) {
            NSLog(@"API取得失敗");
        } else {
            for (int i = 0; i < 3; i++) {
                NSDictionary *forecasts = weatherAPIDictionary[@"forecasts"][i];
                // 日付と天気（文字列）を取得し、二重配列で格納
                NSArray *dataArray = @[forecasts[@"date"], forecasts[@"telop"]];
                [self.weatherDataArray addObject:dataArray];
                // 画像のURLを取得し、配列に格納
                NSDictionary *image = forecasts[@"image"];
                [self.weatherIconURLArray addObject:image[@"url"]];
            }
            NSDictionary *description = weatherAPIDictionary[@"description"];
            self.weatherDiscriptionText = description[@"text"];
            
            // 先にTableViewの描画コードが走るので、API取得を待ってから再計算とリロードをかける。
            [self setTableView];
            [self.tableView reloadData];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)createImageByURL:(NSString *)URL {
    NSURL *url = [NSURL URLWithString:URL];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image=[UIImage imageWithData:imageData];
    return image;
}

#pragma mark - TableView周りの設定
// テーブルビューを設定
- (void)setTableView {
    // nibファイルの登録
    UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier: CustomCellReuseIdentifier];
    // セルの高さをセル内のレイアウトに準拠するように設定
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // セルの最低限の高さを設定
    self.tableView.estimatedRowHeight = CellEstimatedRowHeight;
}

// セルの数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherIconURLArray.count;
}

// セルの内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier: CustomCellReuseIdentifier];
    
    [cell.customCellImage setImageWithURL:[NSURL URLWithString:self.weatherIconURLArray[indexPath.row]]
              placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.customCellForecastsDate.text = self.weatherDataArray[indexPath.row][WeatherDate];
    cell.customCellForecastTitle.text = self.weatherDataArray[indexPath.row][WheatherTelop];
    if(indexPath.row == today) {
        cell.customCellDescriptionLabel.text = self.weatherDiscriptionText;
    }
    return cell;
}

@end
