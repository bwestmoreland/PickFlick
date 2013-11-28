//
//  UIAlertView+SimpleAlert.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "UIAlertView+SimpleAlert.h"

@implementation UIAlertView (SimpleAlert)

+ (void)showSimpleAlertViewWithMessage: (NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: nil
                                                    message: message
                                                   delegate: nil
                                          cancelButtonTitle: @"Ok"
                                          otherButtonTitles: nil];
    [alert show];
}


@end
