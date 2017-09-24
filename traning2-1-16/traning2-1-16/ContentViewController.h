//
//  ContentViewController.h
//  traning2-1-16
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController
// 表示される文字列
@property NSString *labelText;
// ページ番号
@property NSInteger index;
// 全体のページ数
@property NSUInteger totalPageNumber;

@end
