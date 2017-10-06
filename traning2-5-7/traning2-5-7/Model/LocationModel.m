//
//  LocationModel.m
//  traning2-5-7
//
//  Created by 増田紘宜 on 2017/10/03.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import "LocationModel.h"

@interface LocationModel ()

@end

@implementation LocationModel


- (void)requestAuthorization {
    self.locationManager = [CLLocationManager new];
    self.locationManager.delegate = self;
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager requestWhenInUseAuthorization];
    }
}


/**
 目標地点を、第一引数のMapViewに対してセットする。
 
 @param mapView MKMapViewの挿入（通常はself.mapView）
 @param xCoordinate 目標地点のX座標
 @param yCoordinate 目標地点のY座標
 @param positionSpan 縮尺
 */
- (void)setMKCoordinateRegion:(MKMapView *)mapView
                  xCoordinate:(long)xCoordinate
                  yCoordinate:(long)yCoordinate
                 positionSpan:(long)positionSpan
{
    MKCoordinateRegion location = mapView.region;
    location.center = CLLocationCoordinate2DMake(xCoordinate, yCoordinate);
    location.span.latitudeDelta = positionSpan;
    location.span.longitudeDelta = positionSpan;
    [mapView setRegion:location animated:NO];
}

/*
 // 縮尺を指定
 MKCoordinateRegion myLocation = self.mapView.region;
 myLocation.center = CLLocationCoordinate2DMake(self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
 myLocation.span.latitudeDelta = myPositionSpan;
 myLocation.span.longitudeDelta = myPositionSpan;
 [self.mapView setRegion:myLocation animated:NO];
 [self.locationManager stopUpdatingLocation];
 
 
 // 縮尺を指定
 MKCoordinateRegion stvPoint = self.mapView.region;
 stvPoint.center = CLLocationCoordinate2DMake(stvPositionLatitude, stvPositionLongitude);
 stvPoint.span.latitudeDelta = stvPositionSpan;
 stvPoint.span.longitudeDelta = stvPositionSpan;
 [self.mapView setRegion:stvPoint animated:NO];
 */

@end

