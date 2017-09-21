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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSUInteger numberOfRowsInSection;
@property NSMutableArray *weatherDataArray;
@property NSMutableArray *weatherIconURLArray;
@property NSString *weatherDiscriptionText;

@end

static const CGFloat CellEstimatedRowHeight = 80;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WeatherAPIModel *apiModel = [WeatherAPIModel new];
    self.weatherDataArray = [@[] mutableCopy];
    self.weatherIconURLArray = [@[] mutableCopy];
    for (int i = 0; i < 3; i++) {
        NSLog(@"for文%zd回目" ,i);
        [self.weatherDataArray addObject:[apiModel prepareWeatherData:i]];
        [self.weatherIconURLArray addObject:[apiModel prepareWeatherIconURL:i]];
        NSLog(@"%@", self.weatherIconURLArray);
    }
    self.weatherDiscriptionText = [apiModel prepareWeatherDescrioption];

    NSLog(@"%zd", self.numberOfRowsInSection);
    [self setTableView];
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
    NSLog(@"セルの内容設定%zd回目", indexPath.row);
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier: CustomCellReuseIdentifier];
    cell.customCellImage.image = [self createImageByURL:self.weatherIconURLArray[indexPath.row]];
    cell.customCellForecastsDate.text = self.weatherDataArray[indexPath.row][WeatherDate];
    cell.customCellForecastTitle.text = self.weatherDataArray[indexPath.row][WheatherTelop];
    if(indexPath == today) {
        cell.customCellDescriptionText.text = self.weatherDiscriptionText;
    }
    
    return cell;
}

@end
