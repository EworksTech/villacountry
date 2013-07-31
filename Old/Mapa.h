//
//  Mapa.h
//  Villa
//
//  Created by Cristiano Schroeder on 13/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>



@interface Mapa : UIViewController
{
    UIScrollView *scrollHome;
    IBOutlet UIWebView *webView;
    MKMapView *mapView;
    CLLocationManager *locationManager;
}

//@property (nonatomic, strong) IBOutlet UIScrollView *scrollHome;
@property (nonatomic,retain) UIWebView *webView;
//@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

// Para ligar e desligar o GPS
@property (nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, retain) NSString *ultimaLatitude;
@property (nonatomic, retain) NSString *ultimaLongitude;

- (void) exibirRota;



@property (nonatomic, retain)NSArray *arrRoutePoints;
@property (nonatomic, retain)MKPolygon *objpolygon;
@property (nonatomic, retain)MKPolyline *objpolyline;

@property (nonatomic, retain) NSString *encodedPoints;



@end
