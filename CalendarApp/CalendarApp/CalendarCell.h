//
//  CalendarCell.h
//  CalendarApp
//
//  Created by 増田紘宜 on 2017/09/27.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *calenderCellContentLabel;

#pragma mark GlobalConstants
extern NSString *const CalendarCellIdentifier;

@end
