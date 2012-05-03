//
//  DrPhilWebsiteViewController.m
//  Psychologist
//
//  Created by William Fu on 08/04/12.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DrPhilWebsiteViewController.h"

@interface DrPhilWebsiteViewController()
@property (nonatomic, weak) IBOutlet UIWebView *webView;
@end

@implementation DrPhilWebsiteViewController

@synthesize webView = _viewView;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.webView.scalesPageToFit = YES;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
