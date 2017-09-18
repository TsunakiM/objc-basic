//
//  CustomTableViewCell.h
//  traning2-3-2
//
//  Created by 増田紘宜 on 2017/09/17.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *todoName;
@property (weak, nonatomic) IBOutlet UILabel *limitDate;

@end
