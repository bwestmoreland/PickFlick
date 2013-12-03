//
//  RateMovieViewController.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "RateMovieViewController.h"

@implementation RateMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview: self.movieInquiryTextField];
}

- (UITextField *)movieInquiryTextField
{
    if (!_movieInquiryTextField) {
        _movieInquiryTextField = [[UITextField alloc] initWithFrame: CGRectMake(20.0, 50.0, 300.0, 24.0)];
        [_movieInquiryTextField setText: @"How was the movie?"];

        
    }
    return _movieInquiryTextField;
}

@end
