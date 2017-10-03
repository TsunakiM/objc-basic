//
//  ViewController.m
//  traning2-5-6
//
//  Created by 増田紘宜 on 2017/09/25.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>


@interface ViewController ()
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getLocationData {
    // 取得可能かをチェック
    if ([CLLocationManager locationServicesEnabled]) {
        // 初回起動の場合、初期化を行う
        if (self.locationManager == nil) {
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;
            [self.locationManager requestWhenInUseAuthorization];
        } else {
            // データの出力
            [self outputLocationDataAction];
        }
    } else {
        NSLog(@"現在地情報の取得に失敗しました。");
    }
}

// 初回、許可アクション後の処理
-(void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self outputLocationDataAction];
    }
}

// 位置情報を出力するメソッド
- (void)outputLocationDataAction {
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
    NSLog(@"現在地の緯度は（%f）、経度は（%f）",
          self.locationManager.location.coordinate.latitude,
          self.locationManager.location.coordinate.longitude);
    [self.locationManager stopUpdatingLocation];
    self.locationManager.delegate = nil;
    self.locationManager = nil;
}

- (IBAction)getLocationBtn:(id)sender {
    [self getLocationData];
}

/*
 参考サイト
 https://i-app-tec.com/objective-c/mapview-obc.html
 https://iscene.jimdo.com/2015/06/26/objective-c-%E7%B7%AF%E5%BA%A6-%E7%B5%8C%E5%BA%A6-%E5%8F%96%E5%BE%97/
 */

@end
