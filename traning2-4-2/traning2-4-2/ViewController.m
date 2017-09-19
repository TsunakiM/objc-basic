//
//  ViewController.m
//  traning2-4-2
//
//  Created by 増田紘宜 on 2017/09/19.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *weatherCheckBtnOutlet;

- (void)setActionController;
@end

static NSString *const LivedoorWeatherApiURL = @"http://weather.livedoor.com/forecast/webservice/json/v1?city=130010";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setActionController];
    [self.weatherCheckBtnOutlet setTitle:[[NSBundle mainBundle]localizedStringForKey:@"weatherCheckBtn"
                                                                               value:nil
                                                                               table:@"Localizable"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setActionController {
    
}

- (IBAction)weatherCheckBtn:(id)sender {
    NSLog(@"ボタン押したよ！");
}


@end
