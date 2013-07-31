//
//  Tab.h
//  Villa
//
//  Created by Cristiano Schroeder on 13/07/13.
//  Copyright (c) 2013 Cristiano Schroeder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tab : UITabBarController
{
    IBOutlet UIWebView *preWebView;
}


@property (nonatomic,retain) UIWebView *preWebView;


@end