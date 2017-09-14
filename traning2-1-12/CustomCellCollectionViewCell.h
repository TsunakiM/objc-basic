//
//  CustomCellCollectionViewCell.h
//  traning2-1-12
//
//  Created by 増田紘宜 on 2017/09/13.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellCollectionViewCell : UICollectionViewCell
// デフォルトのCollectionViewCellは画像を保持できないので、カスタムセルで設定。
// xibで設定したセルの要素とOutlet接続する。
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end

/*
 xibでセルを設定する場合、Identifierを設定する。
 セルの中身は、AutoLayoutなどで調整すること。
 */
