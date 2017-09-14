//
//  ViewController.m
//  traning2-1-17
//
//  Created by 増田紘宜 on 2017/09/14.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)unwindToMain:(UIStoryboardSegue *)segue {
    // 前画面から戻った時の処理を追加する。
    // 前画面は[segue sourceViewController]で取得できる。
}


@end
