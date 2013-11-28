//
//  Movie.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (UIImage *)posterImage
{
    if (!_posterImage) {
        _posterImage = [UIImage imageNamed:@"circus.jpg"];
    }
    return _posterImage;
}

@end
