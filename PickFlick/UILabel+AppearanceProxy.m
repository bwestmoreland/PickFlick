//
//  NSObject+AppearanceProxy.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "UILabel+AppearanceProxy.h"

@implementation UILabel (AppearanceProxy)

- (void)setTextAttributes:(NSDictionary *)numberTextAttributes;
{
    UIFont *font = [numberTextAttributes objectForKey: NSFontAttributeName];
    if (font) {
        self.font = font;
    }
    UIColor *textColor = [numberTextAttributes objectForKey: NSForegroundColorAttributeName];
    if (textColor) {
        self.textColor = textColor;
    }
    UIColor *textShadowColor = [numberTextAttributes objectForKey: NSShadowAttributeName];
    if (textShadowColor) {
        self.shadowColor = textShadowColor;
    }
//    NSValue *shadowOffsetValue = [numberTextAttributes objectForKey: ];
//    if (shadowOffsetValue) {
//        UIOffset shadowOffset = [shadowOffsetValue UIOffsetValue];
//        self.shadowOffset = CGSizeMake(shadowOffset.horizontal, shadowOffset.vertical);
//    }
}

@end
