//
//  Shows.m
//  Villa
//
//  Created by Cristiano Schroeder on 10/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import "Shows.h"

@implementation Shows

@synthesize webView, link360, tela, loading;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    UIImage *selectedImage0 = [UIImage imageNamed:@"btn_show_p.png"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"btn_show_s.png"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"btn_agenda_p.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"btn_agenda_s.png"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"btn_mapa_p.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"btn_mapa_s.png"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"btn_contato_p.png"];
    UIImage *unselectedImage3 = [UIImage imageNamed:@"btn_contato_s.png"];
    
    UIImage *selectedImage4 = [UIImage imageNamed:@"btn_ao_vivo_pB.png"];
    UIImage *unselectedImage4 = [UIImage imageNamed:@"btn_ao_vivo_sB.png"];
    
    
    UITabBar *tabBar = self.tabBarController.tabBar;
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [tabBar.items objectAtIndex:3];
    UITabBarItem *item4 = [tabBar.items objectAtIndex:4];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    [item3 setFinishedSelectedImage:selectedImage3 withFinishedUnselectedImage:unselectedImage3];
    [item4 setFinishedSelectedImage:selectedImage4 withFinishedUnselectedImage:unselectedImage4];
    

    
    
    
    [super viewDidLoad];
    

    NSString *urlAdress = @"http://www.villacountry.com.br/villa/index_app.asp";
    
    
    NSURL *url = [NSURL URLWithString:urlAdress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];


    
    
    
    

    
}



- (IBAction)buttonPressed {
    NSString *s = [ NSString stringWithFormat:@"https://www.ticket360.com.br/eventos/pesquisar?s=villa+country"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:s]];
}

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




#pragma mark - Web View Delegate




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

