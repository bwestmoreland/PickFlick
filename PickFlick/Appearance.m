//
//  Appearance.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "Appearance.h"
#import "UILabel+AppearanceProxy.h"

@implementation Appearance

+ (void)setAppearance
{
    [[UILabel appearance] setTextAttributes: @{NSForegroundColorAttributeName: [Appearance darkBlueColor]}];
    
    [[UINavigationBar appearance] setBarTintColor: [Appearance darkBlueColor]];
    [[UINavigationBar appearance] setTintColor: [Appearance whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [Appearance whiteColor],
                                                             NSFontAttributeName: [Appearance marketDeco]}];
    
    [[UIBarButtonItem appearance] setTintColor: [Appearance whiteColor]];
    [[UIBarButtonItem appearance] setTitleTextAttributes: @{ NSForegroundColorAttributeName : [Appearance whiteColor],
                                                             NSFontAttributeName: [Appearance belleroseLight] }
                                                forState: UIControlStateNormal];
    
    [[UISegmentedControl appearance] setTintColor: [Appearance darkBlueColor]];
    [[UISegmentedControl appearance] setBackgroundColor: [Appearance whiteColor]];
    [[UISegmentedControl appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName: [Appearance darkBlueColor]}
                                                   forState: UIControlStateNormal];
    
    [[UIToolbar appearance] setBarTintColor: [Appearance whiteColor]];
    [[UIToolbar appearance] setShadowImage: [UIImage imageNamed:@"ToolbarShadow"] forToolbarPosition:UIBarPositionTop];
    
    [[UIButton appearance] setBackgroundColor: [Appearance darkBlueColor]];
    [[UIButton appearance] setTitleColor: [Appearance whiteColor] forState: UIControlStateNormal];
    
}

+ (UIColor *)darkBlueColor
{
    return [UIColor colorWithRed: 46 / 255.0f
                           green: 101 / 255.0f
                            blue: 142 / 255.0f
                           alpha: 1.0];
}

+ (UIColor *)whiteColor
{
    return [UIColor colorWithRed: 241 / 255.0f
                           green: 242 / 255.0f
                            blue: 226 / 255.0f
                           alpha: 1.0f];
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
