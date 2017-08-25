//
//  ViewController.m
//  traning2-1-6
//
//  Created by MAC管理者 STV on 2017/08/25.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webViewToGoogle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Stringオブジェクトをつくります
    NSString* urlString = @"https://google.com";
    // これを使って、URLオブジェクトをつくります
    NSURL* googleURL = [NSURL URLWithString: urlString];
    // さらにこれを使って、Requestオブジェクトをつくります
    NSURLRequest* myRequest = [NSURLRequest requestWithURL: googleURL];
    // これを、WebViewToGoogleのloadRequestメソッドに渡します
    [self.webViewToGoogle loadRequest:myRequest];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
