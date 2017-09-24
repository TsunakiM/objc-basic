//
//  ViewController.m
//  traning2-5-3
//
//  Created by 増田紘宜 on 2017/09/23.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () 
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 保存状態を初期化しておく
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    [defaults setObject:nil forKey:@"imageData"];
    [defaults synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 保存した画像があればメイン画像に設定する
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    if ([defaults objectForKey:@"imageData"] != nil) {
        NSData *getImageData = [defaults objectForKey:@"imageData"];
        UIImage *getImage = [[UIImage alloc] initWithData:getImageData];
        self.mainImageView.image = getImage;
    }
}

- (IBAction)cameraActivateBtn:(id)sender {
    UIStoryboard *secondStoryBoard = [UIStoryboard storyboardWithName:@"CameraView" bundle:nil];
    // 遷移先のViewControllerをインスタンス化
    CameraViewController *cameraViewController = [secondStoryBoard instantiateInitialViewController];
    // 遷移実行
    [self presentViewController: cameraViewController animated:YES completion: nil];
    
}

@end
