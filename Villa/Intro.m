//
//  Intro.m
//  Villa
//
//  Created by Cristiano Schroeder on 13/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Intro.h"
#import "Shows.h"

@implementation Intro
@synthesize abertura;




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
    
    [super viewDidLoad];
    
    // Add code to load web content in UIWebView
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"splashVilla5.html" ofType:nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [abertura loadRequest:request];
    
        
    [self dismissModalViewControllerAnimated:YES];
    
    //slight pause to let the modal page dismiss and then start the segue
    double delayInSeconds = 4.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        //code to be executed on the main queue after delay
        
        [self performSegueWithIdentifier:@"intro" sender:self];
        
    });
    
    
    
}



//- (void)viewDidAppear:(BOOL)animated
//{
//    sleep(2.0);
//    [self performSegueWithIdentifier:@"intro" sender:self];
//}

- (void)viewDidUnload
{
    
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"intro"])
    {
        Shows *viewController = (Shows *)[segue destinationViewController];
        
    }
    
}




@end
