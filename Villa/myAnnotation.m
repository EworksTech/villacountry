//
//  myAnnotation.m
//  Villa
//
//  Created by Cristiano Schroeder on 14/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "myAnnotation.h"

@implementation myAnnotation
//3
-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
    }
    return self;
}

@end