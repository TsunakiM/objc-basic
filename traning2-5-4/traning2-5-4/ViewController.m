//
//  ViewController.m
//  traning2-5-4
//
//  Created by 増田紘宜 on 2017/09/24.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setImagePickerController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImagePickerController {
    // UIImagePickerControllerのインスタンスの作成
    self.imagePickerController = [UIImagePickerController new];
    
    // imagepickerのデリゲートを適用
    self.imagePickerController.delegate = self;
}

- (IBAction)imageSelectBtn:(id)sender {
    // アルバムの利用
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]) {
        NSLog(@"アルバム起動エラー");
        return;
    } else {
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc] init];
        cameraPicker.sourceType = sourceType;
        cameraPicker.delegate = self;
        
        [self presentViewController:cameraPicker animated:YES completion:nil];
    }
}

// 画像選択後の処理
- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    // カメラロールの画面が閉じられたあとの処理を記述
    [self dismissViewControllerAnimated:YES completion:^{
        // 選択した画像をUIimageViewに表示
        self.mainImageView.image = image;
    }];
}

@end
