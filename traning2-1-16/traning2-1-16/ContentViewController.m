//
//  ContentViewController.m
//  traning2-1-16
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *pageCount;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // グローバル変数labelTextに外部から値を入れると、実装ファイル側でページのUILabrlに設定する。
    self.label.text = self.labelText;
    // 右下のページ番号。現在ページの判定(index)は配列と合わせて0から始まるので、表示のために1を足している。
    self.pageCount.text = [NSString stringWithFormat:@"%zd / %zd", self.index + 1, self.totalPageNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
