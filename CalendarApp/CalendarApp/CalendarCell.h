//
//  CalendarCell.h
//  CalendarApp
//
//  Created by 増田紘宜 on 2017/09/27.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalendarCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *CalenderCellContentLabel;

#pragma mark GlobalConstant
extern NSString *const CalendarCellIdentifier;
extern NSString *const CalenderHeaderIdentifier;

@end
