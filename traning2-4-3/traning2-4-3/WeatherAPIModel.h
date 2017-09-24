//
//  WeatherAPIModel.h
//  traning2-4-3
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherAPIModel : NSObject
- (void)getWeatherData:(void (^)(NSDictionary *dictionary))block;

@end
