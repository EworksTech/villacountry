//
//  Agenda.m
//  Villa
//
//  Created by Cristiano Schroeder on 10/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Agenda.h"

@implementation Agenda

@synthesize webView,tela, loading;




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableString *urlAdress = [[NSMutableString alloc] init];
    // NSLog(@"%d",IS_IPHONE_5);
    if(IS_IPHONE_5){
        [urlAdress setString:@"http://www.villacountry.com.br/villa/agenda_app5.asp"];
        
    } else {
        [urlAdress setString:@"http://www.villacountry.com.br/villa/agenda_app.asp"];
    }

    
    
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

