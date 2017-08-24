//
//  ViewController.m
//  traning2-1-4
//
//  Created by MAC管理者 STV on 2017/08/24.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)alert:(UIButton *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"ALERT!" message:@"This is test alert." preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 「OK」ボタンが押された時の処理
        [self okButtonPushed];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 「cancel」ボタンが押された時の処理
        [self cancelButtonPushed];
    }]];
    
    // 画面に表示する
    [self presentViewController:alertController animated:YES completion:nil];
}

// アラートのOKボタンの処理
- (void)okButtonPushed {
    NSLog(@"OK pushed!");
}

// アラートのcancelボタンの処理
- (void)cancelButtonPushed {
    NSLog(@"cancel pushed!");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
