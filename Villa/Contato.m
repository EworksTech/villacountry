//
//  Contato.m
//  Villa
//
//  Created by Cristiano Schroeder on 10/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Contato.h"

@interface Contato ()

@end

@implementation Contato


@synthesize sdview,hdview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(IS_IPHONE_5){
        
        sdview.hidden = true;
           
    } else {
        
        hdview.hidden = true;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
