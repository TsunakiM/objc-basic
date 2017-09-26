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
// MapKitをインポート。
// ViewController側でMKMapViewDelegateを接続。
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSLocationWhenInUseUsageDescriptionに設定したメッセージでユーザに確認
    [self.locationManager requestWhenInUseAuthorization];
    
    //GPSの利用可否判断
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = 100.0;
        [self.locationManager startUpdatingLocation];
        NSLog(@"Start updating location.");
    } else {
        NSLog(@"The location services is disabled.");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// GPSで位置情報の更新があったときに呼ばれる
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation *newLocation = [locations lastObject];
    // 位置情報を取り出す
    //緯度
    double latitude = newLocation.coordinate.latitude;
    //経度
    double longitude = newLocation.coordinate.longitude;
    
    NSLog(@"%f",latitude);
    NSLog(@"%f",longitude);
    
    /*
    // 緯度 %+.6f
    NSString *latitude  = [NSString stringWithFormat:@"%+.6f",
                               location.coordinate.latitude];
    // 経度 %+.6f
    NSString *longitude = [NSString stringWithFormat:@"%+.6f",
                                location.coordinate.longitude];
     */
}

/*
 参考サイト
 https://i-app-tec.com/objective-c/mapview-obc.html
 https://iscene.jimdo.com/2015/06/26/objective-c-%E7%B7%AF%E5%BA%A6-%E7%B5%8C%E5%BA%A6-%E5%8F%96%E5%BE%97/
 */

@end
