//
//  WeatherAPIModel.m
//  training2-4-2
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "WeatherAPIModel.h"

#import "CreateLocalizableString.h"
#import "AFNetworking.h"

@interface WeatherAPIModel ()

@end

static NSString *const apiUrl = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation WeatherAPIModel

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)weatherOutput:(int)indexNumber {
    NSString *url = apiUrl;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET: url parameters: nil progress: nil
          success:^(NSURLSessionTask *task, id responseObject) {
              // json取得に成功した場合の処理
              // 予報都市名を取得
              NSDictionary *location = responseObject[@"location"];
              NSString *city = location[@"city"];
              
              // 当日の予報情報（forecasts）を取得
              NSDictionary *forecasts = responseObject[@"forecasts"][indexNumber];
              NSString *date = forecasts[@"date"];
              NSString *dateLabel = forecasts[@"dateLabel"];
              NSString *telop = forecasts[@"telop"];
              NSString *whetherResult = [NSString stringWithFormat:@"%@、%@の%@の天気は、%@です。", dateLabel, date, city, telop];
              NSLog(@"%@", whetherResult);
          } failure:^(NSURLSessionTask *operation, NSError *error) {
              // エラーの場合の処理
              NSLog(@"JSON読み込みエラーが発生しました。");
          }
     ];
}

- (UIAlertAction *)createSelectAction:(int)actionNumber {
    // 当日の天気予報を出力するアクションを作成
    CreateLocalizableString *createLocalizableString = [CreateLocalizableString new];
    NSString *actionName;
    switch (actionNumber) {
        case today:
            actionName = [createLocalizableString localizableString:@"todayString"];
            break;
        case tomorrow:
            actionName = [createLocalizableString localizableString:@"tomorrowString"];
            break;
        case afterTomorrow:
            actionName = [createLocalizableString localizableString:@"afterTomorrowString"];
            break;
        case cancel:
            actionName = [createLocalizableString localizableString:@"cancelString"];
            break;
        default:
            break;
    }

    if(actionNumber == cancel) {
        UIAlertAction *cancelAction =
        [UIAlertAction actionWithTitle:actionName
                                 style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {
                                   NSLog(@"ボタン操作をキャンセルしました。");
                               }];
        return cancelAction;
    } else {
        UIAlertAction *WeatherForecast = [UIAlertAction actionWithTitle:actionName
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * action) {
                                                                    [self weatherOutput:actionNumber];
                                                                }
                                          ];
        return WeatherForecast;
    }
}

@end
