//
//  ViewController.m
//  traning2-4-8
//
//  Created by 増田紘宜 on 2017/09/22.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

/*
 インスタは、そもそも直接呼べないので、本体機能を使って呼び出し、選択をさせ、そこに画像を渡す処理をする。
 */

#import "ViewController.h"
#import "PostInstagram.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)sendImageToInstagramBtn:(id)sender {
    // Instagramがインストールされているかの確認。
    if ([PostInstagram canInstagramOpen]) {
        UIImage *image = [UIImage imageNamed:@"sittingCat"];
        
        PostInstagram *instagramViewController = [[PostInstagram alloc] init];
        [instagramViewController setImage:image];
        [self.view addSubview:instagramViewController.view];
        [self addChildViewController:instagramViewController];
        
    } else {
        // Instagramがインストールされていない場合の処理
        NSLog(@"Instagramがインストールされていません");
    }
}


@end
