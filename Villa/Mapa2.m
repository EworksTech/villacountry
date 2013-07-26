//
//  Mapa2.m
//  Villa
//
//  Created by Cristiano Schroeder on 13/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Mapa2.h"
#import <QuartzCore/CoreAnimation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "myAnnotation.h"
#define METERS_PER_MILE 1609.344

@interface Mapa2 ()

@end

@interface UINavigationBar (CustomImage)

-(void) applyDefaultStyle;

@end


@implementation UINavigationBar (CustomImage)
//- (void)drawRect:(CGRect)rect {
//    UIImage *image = [UIImage imageNamed: @"BarraSupMarrom8@2x.png"];
//    [image drawInRect:CGRectMake(0, 0, 320, 44)];
//}

-(void)willMoveToWindow:(UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
    [self applyDefaultStyle];
}

- (void)applyDefaultStyle {
    // add the drop shadow
    //    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    //    self.layer.shadowOffset = CGSizeMake(0.0, 3);
    //    self.layer.shadowOpacity = 0.25;
    //    self.layer.masksToBounds = NO;
    //    self.layer.shouldRasterize = YES;
    
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0.0, 4);
    self.layer.shadowOpacity = 0.25;
    self.layer.masksToBounds = NO;
    self.layer.shouldRasterize = YES;
    
    
    
}

@end

@implementation Mapa2
//@synthesize scrollHome;
@synthesize webView;
@synthesize ultimaLatitude, ultimaLongitude;
@synthesize mapView;
@synthesize arrRoutePoints;
@synthesize objpolygon;
@synthesize objpolyline;
@synthesize encodedPoints;
@synthesize coordinate;
@synthesize locationManager;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}






- (void)viewDidLoad
{
    
    // To get the current location of the place
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone; //whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyBest; //100 m
    //Start the location manager, then only updates the current location
    [locationManager startUpdatingLocation];
    
    CLLocation *location = [locationManager location];
    
    // Configure the new event with information from the location
    CLLocationCoordinate2D coordinate = [location coordinate];
    
//    NSString *lat = [NSString stringWithFormat:@"%f", coordinate.latitude];
//    NSString *lon = [NSString stringWithFormat:@"%f", coordinate.longitude];
//    NSLog(@"dLatitude : %@", lat);
//    NSLog(@"dLongitude : %@",lon);
    
    
    
    
    
    
    
    
    
    
    // Cria uma coordenada
	MKCoordinateRegion location1;
    location1.center.latitude = (double) -23.527866;
	location1.center.longitude = (double) -46.67055;
    
    
    //Avenida Francisco Matarazzo, 774 - Água Branca, São Paulo, 05001-000
    
    
    
    // Configura o modo satélite
    [self.mapView setMapType:MKMapTypeSatellite];
    
    // Centraliza o mapa nesta coordenada
    [self.mapView setRegion:location1 animated:YES];
    
    // Adiciona o marcador "pin" no mapa
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    [pin setCoordinate:location1.center];
    [pin setTitle:[NSString stringWithFormat:@"Villa Country"]];
    [pin setSubtitle:[NSString stringWithFormat:@"Villa Country"]];
    
    [self.mapView addAnnotation:pin];
    
    
    
    
//    MKCoordinateRegion location2;
//    location2.center.latitude = (double) -23.620777;
//	location2.center.longitude = (double) -46.737835;
//    
//    MKPointAnnotation *pin2 = [[MKPointAnnotation alloc] init];
//    [pin2 setCoordinate:location2.center];
//    [pin2 setTitle:[NSString stringWithFormat:@"Morumbi"]];
//    [pin2 setSubtitle:[NSString stringWithFormat:@"Morumbi"]];
//    [self.mapView addAnnotation:pin2];
    
    
    
    
    
//    MKCoordinateRegion location3;
//    location3.center.latitude = coordinate.latitude;
//	location3.center.longitude = coordinate.longitude;
//    MKPointAnnotation *pin3 = [[MKPointAnnotation alloc] init];
//    [pin3 setCoordinate:location3.center];
//    [pin3 setTitle:[NSString stringWithFormat:@"Posição Atual"]];
//    [pin3 setSubtitle:[NSString stringWithFormat:@"Posição Atual"]];
//    [self.mapView addAnnotation:pin3];
//    
    
    
    // Delegate
    self.mapView.delegate = self;
    
    [self.mapView setMapType:MKMapTypeStandard];
    
    
    
    
    
    
    
    
    if(arrRoutePoints) // Remove all annotations
        [mapView removeAnnotations:[mapView annotations]];
    
    arrRoutePoints = [self getRoutePointFrom:location to:pin];
    [self drawRoute];
    [self centerMap];
    
    
    
    [super viewDidLoad];
    
    
}


    
    

/* MKMapViewDelegate Meth0d -- for viewForOverlay*/
- (MKOverlayView*)mapView:(MKMapView*)theMapView viewForOverlay:(id <MKOverlay>)overlay
{
    MKPolylineView *view = [[MKPolylineView alloc] initWithPolyline:objpolyline];
    view.fillColor = [UIColor blueColor];
    view.strokeColor = [UIColor blueColor];
    view.lineWidth = 4;
    return view;
}


/* This will get the route coordinates from the google api. */
- (NSArray*)getRoutePointFrom:(MKPointAnnotation *)origin to:(MKPointAnnotation *)destination
{
    NSString* saddr = [NSString stringWithFormat:@"%f,%f", origin.coordinate.latitude, origin.coordinate.longitude];
    NSString* daddr = [NSString stringWithFormat:@"%f,%f", destination.coordinate.latitude, destination.coordinate.longitude];
    
    NSString* apiUrlStr = [NSString stringWithFormat:@"http://maps.google.com/maps?output=dragdir&saddr=%@&daddr=%@", saddr, daddr];
    NSURL* apiUrl = [NSURL URLWithString:apiUrlStr];
    
    NSError *error;
    NSString *apiResponse = [NSString stringWithContentsOfURL:apiUrl encoding:NSUTF8StringEncoding error:&error];
    //   NSString* encodedPoints = [apiResponse stringByMatching:@"points:\\\"([^\\\"]*)\\\"" capture:1L];
    
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"points:\\\"([^\\\"]*)\\\"" options:0 error:NULL];
    NSTextCheckingResult *match = [regex firstMatchInString:apiResponse options:0 range:NSMakeRange(0, [apiResponse length])];
    NSString *encodedPoints = [apiResponse substringWithRange:[match rangeAtIndex:1]];
    return [self decodePolyLine:[encodedPoints mutableCopy]];
}


- (NSMutableArray *)decodePolyLine:(NSMutableString *)encodedString
{
    [encodedString replaceOccurrencesOfString:@"\\\\" withString:@"\\"
                                      options:NSLiteralSearch
                                        range:NSMakeRange(0, [encodedString length])];
    NSInteger len = [encodedString length];
    NSInteger index = 0;
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSInteger lat=0;
    NSInteger lng=0;
    while (index < len) {
        NSInteger b;
        NSInteger shift = 0;
        NSInteger result = 0;
        do {
            b = [encodedString characterAtIndex:index++] - 63;
            result |= (b & 0x1f) << shift;
            shift += 5;
        } while (b >= 0x20);
        NSInteger dlat = ((result & 1) ? ~(result >> 1) : (result >> 1));
        lat += dlat;
        shift = 0;
        result = 0;
        do {
            b = [encodedString characterAtIndex:index++] - 63;
            result |= (b & 0x1f) << shift;
            shift += 5;
        } while (b >= 0x20);
        NSInteger dlng = ((result & 1) ? ~(result >> 1) : (result >> 1));
        lng += dlng;
        NSNumber *latitude = [[NSNumber alloc] initWithFloat:lat * 1e-5];
        NSNumber *longitude = [[NSNumber alloc] initWithFloat:lng * 1e-5];
        printf("\n[%f,", [latitude doubleValue]);
        printf("%f]", [longitude doubleValue]);
        CLLocation *loc = [[CLLocation alloc] initWithLatitude:[latitude floatValue] longitude:[longitude floatValue]];
        [array addObject:loc];
    }
    return array;
}

- (void)drawRoute
{
    int numPoints = [arrRoutePoints count];
    if (numPoints > 1)
    {
        CLLocationCoordinate2D* coords = malloc(numPoints * sizeof(CLLocationCoordinate2D));
        for (int i = 0; i < numPoints; i++)
        {
            CLLocation* current = [arrRoutePoints objectAtIndex:i];
            coords[i] = current.coordinate;
        }
        
        self.objpolyline = [MKPolyline polylineWithCoordinates:coords count:numPoints];
        free(coords);
        
        [mapView addOverlay:objpolyline];
        [mapView setNeedsDisplay];
    }
}


- (void)centerMap
{
    MKCoordinateRegion region;
    
    CLLocationDegrees maxLat = -90;
    CLLocationDegrees maxLon = -180;
    CLLocationDegrees minLat = 90;
    CLLocationDegrees minLon = 180;
    
    for(int idx = 0; idx < arrRoutePoints.count; idx++)
    {
        CLLocation* currentLocation = [arrRoutePoints objectAtIndex:idx];
        
        if(currentLocation.coordinate.latitude > maxLat)
            maxLat = currentLocation.coordinate.latitude;
        if(currentLocation.coordinate.latitude < minLat)
            minLat = currentLocation.coordinate.latitude;
        if(currentLocation.coordinate.longitude > maxLon)
            maxLon = currentLocation.coordinate.longitude;
        if(currentLocation.coordinate.longitude < minLon)
            minLon = currentLocation.coordinate.longitude;
    }
    
    region.center.latitude     = (maxLat + minLat) / 2;
    region.center.longitude    = (maxLon + minLon) / 2;
    region.span.latitudeDelta  = maxLat - minLat;
    region.span.longitudeDelta = maxLon - minLon;
    
    [mapView setRegion:region animated:YES];
}








- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    

    
    //1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = -23.527866;
    zoomLocation.longitude= -46.67055;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 8.0*METERS_PER_MILE, 8.0*METERS_PER_MILE);
    
    //        MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.2*METERS_PER_MILE, 0.2*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
}
//
//- (void)viewDidDisappear:(BOOL)animated
//{
//    [self.mapView removeAnnotations:arrRoutePoints];
//}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Desliga o monitoramento do GPS
    [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    mapView = nil;
    // Release any retained subviews of the main view.
}


@end
