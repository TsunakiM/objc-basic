//
//  ViewController.m
//  traning2-5-7
//
//  Created by 増田紘宜 on 2017/10/03.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "ViewController.h"
#import "LocationModel.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) LocationModel *locationModel;

@end

static CLLocationDegrees const stvPositionLatitude = 35.623654;
static CLLocationDegrees const stvPositionLongitude = 139.724858;
static CLLocationDegrees const myPositionSpan = 0.1;
static CLLocationDegrees const stvPositionSpan = 0.01;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.locationModel = [LocationModel new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//ユーザーが位置情報サービスを許可しているかチェック
- (void)checkAuthorizationStatus {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted ||
        [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        NSLog(@"位置情報へのアクセスが許可されていません。");
    } else {
        [self.locationModel requestAuthorization];
    }
    [self.locationModel.locationManager startUpdatingLocation];
    long xCoordinate = self.locationModel.locationManager.location.coordinate.latitude;
    long yCoordinate = self.locationModel.locationManager.location.coordinate.longitude;
    [self.locationModel setMKCoordinateRegion:self.mapView
                                  xCoordinate:xCoordinate
                                  yCoordinate:yCoordinate
                                 positionSpan:myPositionSpan];
    [self.locationModel.locationManager stopUpdatingLocation];
}


@end








