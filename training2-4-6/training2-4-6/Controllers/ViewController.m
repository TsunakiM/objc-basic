//
//  ViewController.m
//  training2-4-6
//
//  Created by 増田紘宜 on 2017/09/22.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()
@property NSString *facebookSchemeURL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postFacebookBtn:(id)sender {
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        NSLog(@"Facebook is not Available");
        return;
    }
    SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookVC addImage:[UIImage imageNamed:@"sittingCat"]];

    [self presentViewController:facebookVC animated:YES completion:nil];
}

@end
