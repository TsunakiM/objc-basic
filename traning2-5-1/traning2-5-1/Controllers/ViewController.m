//
//  ViewController.m
//  traning2-5-1
//
//  Created by 増田紘宜 on 2017/09/22.
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

- (IBAction)sendMailButton:(id)sender {
    // メールを利用できるかチェック
    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"メーラー起動できないよ！");
        return;
    }
    
    // メールビュー生成
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    // メール件名
    [picker setSubject:@"アプリからメール送信"];
    
    /* 参考用: 画像を添付する場合のコード
    NSData *myData = [[NSData alloc] initWithData:UIImageJPEGRepresentation([UIImage imageNamed:xxxxx], 1)];
    [picker addAttachmentData:myData mimeType:@"image/jpeg" fileName:xxxxx];
    */
    
    // メール本文
    [picker setMessageBody:@"ここに本文を入力してください。" isHTML:NO];
    
    // メールビュー表示
    [self presentViewController:picker animated:YES completion:nil];
}

// アプリ内メーラーのデリゲートメソッド
// メーラー終了後の挙動を場合分け
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    switch (result) {
        case MFMailComposeResultCancelled:
            // キャンセル
            NSLog(@"送信キャンセル");
            break;
        case MFMailComposeResultSaved:
            // 保存
            NSLog(@"メール保存");
            break;
        case MFMailComposeResultSent:
            // 送信成功
            NSLog(@"送信成功");
            break;
        case MFMailComposeResultFailed:
            // 送信失敗
            NSLog(@"送信失敗");
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
