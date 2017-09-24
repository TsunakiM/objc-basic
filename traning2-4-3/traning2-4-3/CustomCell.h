//
//  CustomCell.h
//  traning2-4-3
//
//  Created by 増田紘宜 on 2017/09/20.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
extern NSString *const CustomCellReuseIdentifier;
@property (weak, nonatomic) IBOutlet UIImageView *customCellImage;
@property (weak, nonatomic) IBOutlet UILabel *customCellForecastsDate;
@property (weak, nonatomic) IBOutlet UILabel *customCellForecastTitle;
@property (weak, nonatomic) IBOutlet UILabel *customCellDescriptionLabel;

@end
