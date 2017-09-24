//
//  ViewController.m
//  traning2-1-19
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "ShowNameView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameInputRequestLabel;
@property (weak, nonatomic) IBOutlet UIButton *sendNameBtn;
@property (weak, nonatomic) IBOutlet UITextField *meinTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameInputRequestLabel.text = [[NSBundle mainBundle] localizedStringForKey:@"nameInputRequestLabel" value:nil table:@"Localizable"];
    [self.sendNameBtn setTitle:[[NSBundle mainBundle] localizedStringForKey:@"sendNameBtnString" value:nil table:@"Localizable"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendBtn:(id)sender {
    // セグエの起動
    [self performSegueWithIdentifier:@"MainToshowNameViewSegue" sender:self];
}

// セグエで渡す値の準備
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MainToshowNameViewSegue"]) {
        ShowNameView *showNameView = [segue destinationViewController];
        showNameView.stringFromMain = self.meinTextField.text;
    }
}

/*
 参考URL
 StoryboardとSegueの基本 - Kesin's diary
 http://kesin.hatenablog.com/entry/20120908/1347079921
 */

@end
