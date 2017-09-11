//
//  ViewController.m
//  traning2-1-1
//
//  Created by MAC管理者 STV on 2017/08/21.
//  Copyright © 2017年 MAC管理者 STV. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainLabel.text = [[NSBundle mainBundle]
                           localizedStringForKey:@"I'm started Obj-C lesson."
                                           value:nil
                                           table:@"Localizable"
                          ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
