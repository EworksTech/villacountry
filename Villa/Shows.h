//
//  Shows.h
//  Villa
//
//  Created by Cristiano Schroeder on 10/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Shows : UIViewController
{
    IBOutlet UIWebView *webView;
    IBOutlet UIButton  *goback;
    
    IBOutlet UIView  *tela;
    IBOutlet UILabel *loading;
    
}



@property (nonatomic,retain) UIWebView *webView;
@property (nonatomic,retain) UIButton  *link360;

- (IBAction)buttonPressed;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView  *tela;
@property (strong, nonatomic) IBOutlet UILabel *loading;

@end
