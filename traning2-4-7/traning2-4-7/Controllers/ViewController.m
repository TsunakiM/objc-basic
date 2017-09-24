//
//  ViewController.m
//  traning2-4-7
//
//  Created by 増田紘宜 on 2017/09/22.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

#import <Social/Social.h>

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

- (IBAction)postTwitterBtn:(id)sender {
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"Twitter is not Available");
        return;
    }
    SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterVC setInitialText:@"てすと投稿"];
    [twitterVC addImage:[UIImage imageNamed:@"macAndCat"]];
    
    [self presentViewController:twitterVC animated:YES completion:nil];
}

@end
