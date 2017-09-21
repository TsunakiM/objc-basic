//
//  WeatherAPIModel.h
//  traning2-4-3
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherAPIModel : NSObject
@property (strong, nonatomic) NSMutableArray *weatherDataArray;
@property (strong, nonatomic) NSString *weatherDescriptionText;
@property (strong, nonatomic) NSMutableArray *weatherIconURLArray;
//- (void)weatherOutput:(int)indexNumber;
- (NSArray *)prepareWeatherData:(int)indexNumber;
- (NSString *)prepareWeatherIconURL:(int)indexNumber;
- (NSString *)prepareWeatherDescrioption;

typedef NS_ENUM(int, ActionType) {
    today,
    tomorrow,
    afterTomorrow,
    cancel
};

typedef NS_ENUM(int, WeatherAPIContent) {
    WeatherDate,
    WheatherTelop,
};

@end
