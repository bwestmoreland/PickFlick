//
//  Appearance.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "Appearance.h"
#import "UILabel+AppearanceProxy.h"
#import "UIColor+CustomColors.h"

@implementation Appearance

+ (void)setAppearance
{
    [[UILabel appearance] setTextAttributes: @{NSForegroundColorAttributeName: [UIColor darkBlueColor]}];
    
    [[UINavigationBar appearance] setBarTintColor: [UIColor darkBlueColor]];
    [[UINavigationBar appearance] setTintColor: [UIColor creamColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [UIColor creamColor],
                                                             NSFontAttributeName: [Appearance marketDeco]}];
    
    [[UIBarButtonItem appearance] setTintColor: [UIColor creamColor]];
    [[UIBarButtonItem appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [UIColor creamColor],
                                                             NSFontAttributeName: [Appearance belleroseLight] }
                                                forState: UIControlStateNormal];
    
    [[UISegmentedControl appearance] setTintColor: [UIColor darkBlueColor]];
    [[UISegmentedControl appearance] setBackgroundColor: [UIColor creamColor]];
    [[UISegmentedControl appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [UIColor darkBlueColor]}
                                                   forState: UIControlStateNormal];
    
    [[UIToolbar appearance] setBarTintColor: [UIColor creamColor]];
    [[UIToolbar appearance] setShadowImage: [UIImage imageNamed:@"ToolbarShadow"] forToolbarPosition:UIBarPositionTop];
    
    [[UIButton appearance] setBackgroundColor: [UIColor darkBlueColor]];
    [[UIButton appearance] setTitleColor: [UIColor creamColor] forState: UIControlStateNormal];
    
}



+ (UIFont *)marketDeco
{
    return [UIFont fontWithName: @"MarketDeco"
                           size: 24.0f];
}

+ (UIFont *)belleroseLight
{
    return [UIFont fontWithName: @"BelleroseLight"
                           size: 24.0f];
}

+ (void)logFonts
{
    // Get all the fonts on the system
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}


@end
