//
//  ViewController.m
//  lesson2-1-3
//
//  Created by MAC管理者 STV on 2017/08/23.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageControl;
@property (strong, retain) NSMutableArray *imageList;
@property (retain) NSString *nowBackgroundImages;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nowBackgroundImages = @"iPhone_Wallpaper01";
    self.imageList = [NSMutableArray array];
    self.imageList = [@[
                       @"iPhone_Wallpaper02",
                       @"iPhone_Wallpaper03",
                       @"iPhone_Wallpaper04",
                       @"iPhone_Wallpaper05"
                     ] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*~~~ 画像をランダムで表示する処理 ~~~*/
- (IBAction)nextImageBtn:(id)sender {
    // 配列の個数の値から、ランダムに値を取得・保持
    int randomNum = arc4random_uniform((int)self.imageList.count);
    NSLog(@"%zd", randomNum);
    // 「現在表示中の画像」を、画像一覧の配列の末尾に追加
    [self.imageList addObject:self.nowBackgroundImages];
    // 現在表示されていない背景の中から、ランダムに選んでいた画像を「現在表示中の画像」に格納
    self.nowBackgroundImages = self.imageList[randomNum];
    // 上で選んだ画像を、配列から削除
    [self.imageList removeObjectAtIndex:randomNum];
    // 選んだ画像を表示
    self.backgroundImageControl.image = [UIImage imageNamed: self.nowBackgroundImages];
}

@end
