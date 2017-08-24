//
//  ViewController.m
//  traning2-1-5
//
//  Created by MAC管理者 STV on 2017/08/24.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)shareButton:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Share" message:@"Please select" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 上から順にボタンが配置
    [alertController addAction:[UIAlertAction actionWithTitle:@"Facebook" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:1];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"Twitter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:2];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"LINE" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self selectedActionWith:3];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)selectedActionWith:(int)index{
    if(index == 1){
        NSLog(@"Facebook button pushed!");
    } else if(index == 2) {
        NSLog(@"Twitter button pushed!");
    } else if(index == 3) {
        NSLog(@"LINE button pushed!");
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
