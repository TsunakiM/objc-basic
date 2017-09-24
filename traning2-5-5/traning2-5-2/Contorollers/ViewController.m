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
@property (weak, nonatomic) IBOutlet UIButton *doMonochromeBtn;
@property (weak, nonatomic) IBOutlet UIButton *returnMonochromeBtn;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (strong, nonatomic) UIImage *saveImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImagePickerController];
    
    self.doMonochromeBtn.enabled = YES;
    self.returnMonochromeBtn.enabled = NO;
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

- (IBAction)doMonochromeBtn:(id)sender {
    // 加工前の画像を保存（戻す時のため）
    self.saveImage = [[UIImage alloc]init];
    self.saveImage = self.mainImageView.image;
    // 元画像を取得
    UIImage *originImage = self.mainImageView.image;
    
    // UIImageをCIImageに変換
    CIImage *filteredImage = [[CIImage alloc] initWithCGImage:originImage.CGImage];
    
    // CIFilterを作成（今回はモノクロフィルタ）
    CIFilter *filter = [CIFilter filterWithName:@"CIMinimumComponent"];
    [filter setValue:filteredImage forKey:@"inputImage"];
    // フィルタ後の画像を取得
    filteredImage = filter.outputImage;
    // CIContext,CGImageRefでフィルターを用意
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    CGImageRef imageRef = [ciContext createCGImage:filteredImage fromRect:filteredImage.extent];
    // CIImageをUIImageに変換（フィルターの適用）
    UIImage *outputImage  = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:UIImageOrientationUp];
    // 使用後のフィルターを破棄
    CGImageRelease(imageRef);
    // イメージを表示
    self.mainImageView.image = outputImage;
    // ボタンの状態を変更
    self.doMonochromeBtn.enabled = NO;
    self.returnMonochromeBtn.enabled = YES;
}

- (IBAction)returnMonochromeBtn:(id)sender {
    self.mainImageView.image = self.saveImage;
    
    self.doMonochromeBtn.enabled = YES;
    self.returnMonochromeBtn.enabled = NO;
}



@end
