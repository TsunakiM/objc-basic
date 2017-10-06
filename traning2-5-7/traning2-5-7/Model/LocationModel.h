//
//  LocationModel.h
//  traning2-5-7
//
//  Created by 増田紘宜 on 2017/10/03.
//  Copyright © 2017年 TsunakiMasuda. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface LocationModel : NSObject <CLLocationManagerDelegate>
@property (strong,nonatomic) CLLocationManager *locationManager;
- (void)requestAuthorization;
- (void)setMKCoordinateRegion:(MKMapView *)mapView
                  xCoordinate:(long)xCoordinate
                  yCoordinate:(long)yCoordinate
                 positionSpan:(long)positionSpan;

@end
