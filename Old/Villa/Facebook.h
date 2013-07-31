//
//  Facebook.h
//  Villa
//
//  Created by Cristiano Schroeder on 14/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Facebook : UIViewController
{
    IBOutlet UIWebView *webView;
    
    IBOutlet UIView  *tela;
    IBOutlet UILabel *loading;
}



@property (nonatomic,retain) UIWebView *webView;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView  *tela;
@property (strong, nonatomic) IBOutlet UILabel *loading;


@end
