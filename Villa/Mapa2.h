//
//  Mapa2.h
//  Villa
//
//  Created by Cristiano Schroeder on 13/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>



@interface Mapa2 : UIViewController
{
    UIScrollView *scrollHome;
    IBOutlet UIWebView *webView;
    MKMapView *mapView;
    
    CLLocationManager *locationManager;
    CLLocation *localizacaoAnterior;
    CLLocationDistance  distancia;
    

}

//@property (nonatomic, strong) IBOutlet UIScrollView *scrollHome;
@property (nonatomic,retain) UIWebView *webView;
@property (nonatomic, retain) IBOutlet MKMapView *mapView;


// Para ligar e desligar o GPS
@property (nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, retain) NSString *ultimaLatitude;
@property (nonatomic, retain) NSString *ultimaLongitude;

- (void) exibirRota;



@property (nonatomic, retain)NSArray *arrRoutePoints;
@property (nonatomic, retain)MKPolygon *objpolygon;
@property (nonatomic, retain)MKPolyline *objpolyline;

@property (nonatomic, retain) NSString *encodedPoints;

@property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;
//
//@property (weak, nonatomic) IBOutlet UILabel *labLatitude;
//@property (weak, nonatomic) IBOutlet UILabel *labLongitude;
//@property (weak, nonatomic) IBOutlet UILabel *labAltitude;
//@property (weak, nonatomic) IBOutlet UILabel *labDistancia;




@end
