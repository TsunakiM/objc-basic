//
//  showNameView.m
//  traning2-1-19
//
//  Created by 増田紘宜 on 2017/09/15.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ShowNameView.h"

@interface ShowNameView ()
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation ShowNameView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", self.stringFromMain);
    self.mainLabel.text = self.stringFromMain;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
