//
//  Orkut.m
//  Villa
//
//  Created by Cristiano Schroeder on 14/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Orkut.h"

@implementation Orkut

@synthesize webView ,tela, loading;




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSString *urlAdress = @"http://www.orkut.com/Main#Community.aspx?cmm=19244445";
    
    
    NSURL *url = [NSURL URLWithString:urlAdress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    
}

//- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    [self.navigationController pushViewController:webView animated:YES];
//
//}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activityIndicator startAnimating];
    tela.hidden = FALSE;
    loading.hidden = FALSE;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityIndicator stopAnimating];
    _activityIndicator.hidden = TRUE;
    tela.hidden = TRUE;
    loading.hidden = TRUE;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
