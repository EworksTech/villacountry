//
//  Tab.m
//  Villa
//
//  Created by Cristiano Schroeder on 13/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Tab.h"

@interface Tab ()

@end

@implementation Tab

@synthesize preWebView;

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
    
    NSString *urlAdress = @"http://www.villacountry.com.br/villa/index_app.asp";
    
    
    NSURL *url = [NSURL URLWithString:urlAdress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [preWebView loadRequest:requestObj];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
