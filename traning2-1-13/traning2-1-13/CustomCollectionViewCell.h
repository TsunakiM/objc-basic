//
//  CustomCollectionViewCell.h
//  traning2-1-13
//
//  Created by 増田紘宜 on 2017/09/14.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *customCellImageView;
extern NSString* const CellIdentifier;

@end
