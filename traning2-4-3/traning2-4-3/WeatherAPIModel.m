//
//  WeatherAPIModel.m
//  traning2-4-3
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "WeatherAPIModel.h"

#import "AFNetworking.h"

@interface WeatherAPIModel();
@property (weak, nonatomic) NSDictionary *weatherAPIDictionary;

@end
static NSString *const apiUrl = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation WeatherAPIModel

- (void)apiAccess {
    NSLog(@"APIにアクセスするよ！");
    NSString *url = apiUrl;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: url parameters: nil progress: nil
         success:^(NSURLSessionTask *task, id responseObject) {
             self.weatherAPIDictionary = responseObject;
             NSLog(@"API取得成功");
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"API読み込みエラー！");
         }
     ];
}

- (NSArray *)prepareWeatherData:(int)indexNumber {
    NSLog(@"APIを呼ぶよ！");
    [self apiAccess];
    [NSThread sleepForTimeInterval:5.0];
    NSLog(@"APIを呼んだよ！");
    NSDictionary *forecasts = self.weatherAPIDictionary[@"forecasts"][indexNumber];
    NSString *date = forecasts[@"date"];
    NSString *telop = forecasts[@"telop"];
    NSArray *aWeatherDataArray = @[date, telop];
    
    return aWeatherDataArray;
}

- (NSString *)prepareWeatherIconURL:(int)indexNumber {
    [self apiAccess];

    NSDictionary *forecasts = self.weatherAPIDictionary[@"forecasts"][indexNumber];
    NSDictionary *image = forecasts[@"image"];
    NSString *imageURL = image[@"url"];
    
    return imageURL;
}

- (NSString *)prepareWeatherDescrioption {
    [self apiAccess];
    
    NSDictionary *description = self.weatherAPIDictionary[@"description"];
    NSString *text = description[@"text"];
    
    return text;
}
/*
- (void)weatherOutput:(int)indexNumber {
    NSString *url = apiUrl;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: url parameters: nil progress: nil
         success:^(NSURLSessionTask *task, id responseObject) {
             // json取得に成功した場合の処理
             // 当日の予報情報（forecasts）を取得
             NSDictionary *forecasts = responseObject[@"forecasts"][indexNumber];
             NSString *date = forecasts[@"date"];
             NSString *telop = forecasts[@"telop"];
             NSArray *aWeatherDataArray = @[date, telop];
             [self.weatherDataArray addObject:aWeatherDataArray];
             
             NSDictionary *image = forecasts[@"image"];
             NSString *imageURL = image[@"url"];
             [self.weatherIconURLArray addObject:imageURL];
             NSLog(@"%@", self.weatherIconURLArray);
             
             NSString *description = forecasts[@"description"];
             self.weatherDescriptionText = description;
             
             NSLog(@"API取得&セット成功");
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             // エラーの場合の処理
             NSLog(@"JSON読み込みエラーが発生しました。");
         }
     ];
}
 */

@end
