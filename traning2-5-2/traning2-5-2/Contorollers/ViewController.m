//
//  ViewController.m
//  traning2-5-2
//
//  Created by 増田紘宜 on 2017/09/23.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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

// imagePickerControllerを用意
- (void)setImagePickerController {
    // UIImagePickerControllerのインスタンスの作成
    self.imagePickerController = [UIImagePickerController new];
    // カメラの利用(SourceTypeCameraでカメラ系機能の選択肢からタイプを指定)
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    // imagepickerのデリゲートを適用
    self.imagePickerController.delegate = self;
}

// 撮影ボタンを押したときの挙動
- (IBAction)cameraActivateBtn:(id)sender {
    // カメラが利用できるかを確認
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"カメラ起動失敗");
        return;
    } else {
        [self presentViewController:self.imagePickerController
                           animated:YES
                         completion:nil];
    }
}

//　撮影が完了時した時に呼ばれるメソッド
- (void)imagePickerController: (UIImagePickerController *)imagePicker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // Dictionay型のinfoから撮影後の画像を取り出す（キー値:撮影時に専用の番号（NSString）,値:UIimage型で格納）
    UIImage *nowShootImage = info[UIImagePickerControllerOriginalImage];
    [self.mainImageView setImage:nowShootImage];
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

@end
