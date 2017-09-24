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

// APIを取得して、Dictionaryで返す
- (void)getWeatherData:(void (^)(NSDictionary *dictionary))block {
    NSString *url = apiUrl;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
    [manager GET: url parameters: nil progress: nil
         success:^(NSURLSessionTask *task, id responseObject) {
             if (block) {
                 block(responseObject);
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             if (block) {
                 block(nil);
             }
         }
     ];
}

@end
