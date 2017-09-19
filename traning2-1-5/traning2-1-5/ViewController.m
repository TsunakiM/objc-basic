//
//  ViewController.m
//  traning2-1-5
//
//  Created by MAC管理者 STV on 2017/08/24.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// このクラスの中で、以下のキーを数字としてみなす宣言。
// 引数にする場合は、命名した「ShareBtnType」を呼び出す。
typedef NS_ENUM(NSInteger, ShareBtnType) {
    // FB=0, Twitter=1, LINE=2とみなす。最上段で対応する値を宣言すれば、あとは連番になる。
    Facebook = 0,
    Twitter,
    LINE,
    Cancel
};

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButton:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Share" message:@"Please select" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 上から順にボタンが配置
    [alertController addAction:[UIAlertAction actionWithTitle:@"Facebook"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self selectedActionWith:Facebook];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Twitter"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self selectedActionWith:Twitter];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"LINE"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self selectedActionWith:LINE];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self selectedActionWith:Cancel];
                                                      }]];

    
    [self presentViewController:alertController animated:YES completion:nil];
}

// ボタンが押された時の処理
-(void)selectedActionWith:(int)index{
    switch (index) {
        case Facebook:
            NSLog(@"Facebook button pushed!");
            break;
        case Twitter:
            NSLog(@"Twitter button pushed!");
            break;
        case LINE:
            NSLog(@"LINE button pushed!");
            break;
        case Cancel:
            break;
        default:
            break;
    }
}

@end
