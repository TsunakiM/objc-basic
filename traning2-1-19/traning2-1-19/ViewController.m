//
//  ViewController.m
//  traning2-1-19
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "showNameView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *meinTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendBtn:(id)sender {
    //ここでパラメータを渡す
    [self performSegueWithIdentifier:@"MainToshowNameViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"MainToshowNameViewSegue"]) {
        UIStoryboard *mogmog = [UIStoryboard storyboardWithName:@"showNameView" bundle:nil];
        showNameView *hogehoge = [mogmog instantiateViewControllerWithIdentifier:@"showNameView"];
        hogehoge.stringFromMain = self.meinTextField.text;
    }
}

@end
