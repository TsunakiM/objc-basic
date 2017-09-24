//
//  WeatherAPIModel.h
//  training2-4-2
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherAPIModel : UIViewController
- (void)weatherOutput:(int)indexNumber;
- (UIAlertAction *)createSelectAction:(int)actionNumber;

typedef NS_ENUM(int, ActionType) {
    today,
    tomorrow,
    afterTomorrow,
    cancel
};

@end
