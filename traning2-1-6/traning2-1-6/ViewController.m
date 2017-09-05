//
//  ViewController.m
//  traning2-1-6
//
//  Created by MAC管理者 STV on 2017/08/25.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)loadCancelBtn:(id)sender;
// Webビュー用のプロパティ
@property (weak, nonatomic) IBOutlet UIWebView *webViewToGoogle;
@end

@interface ViewController() <UIWebViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webViewToGoogle.delegate = self;
    
    /*~~~ アラートの設定 ~~~*/
    // オフライン時に表示するアラートの作成
    self.alertController = [UIAlertController alertControllerWithTitle:@"通信エラー" message:@"現在オフライン状態です。通信状態を確認してください。" preferredStyle:UIAlertControllerStyleAlert];
    // アラートボタンとそのアクションを設定
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    }];
    // アラートコントローラーにアラートをセット
    [self.alertController addAction: okButton];
    
    /*~~~ 初期Webページの設定（今回はgoogle）~~~*/
    // URLを指す文字列から、URLオブジェクトを作成
    NSURL *homeURL = [NSURL URLWithString: @"https://google.com"];
    // URLオブジェクトから、URLリクエストを作成
    NSURLRequest *homeURLReq = [NSURLRequest requestWithURL: homeURL];
    // loadRequestメソッドから、設定したURLリクエストを呼び出す
    [self.webViewToGoogle loadRequest: homeURLReq];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*~~~ アラートの実装 ~~~*/
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self presentViewController:self.alertController animated:YES completion:nil];
}

/*~~~ 進捗インジケータ(progress indicator、ローティング中のくるくる)の設定 ~~~*/
// ローディング開始を検出し、進捗インジケータの表示フラグをONにする。
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
// ローディング終了を検出し、進捗インジケータの表示フラグをOFFにする。
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
// 読み込み中止ボタンを押した時に、進捗インジケータの表示フラグをOFFにする（これがないと、次にローディング終了するまでずっと表示され続ける）。
- (IBAction)loadCancelBtn:(id)sender {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
