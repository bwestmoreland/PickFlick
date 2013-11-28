//
//  MainViewController.h
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChooseMovieViewController : UICollectionViewController

@property (strong, nonatomic) UIBarButtonItem *genresBarButton;
@property (strong, nonatomic) UIBarButtonItem *searchBarButton;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;
@property (strong, nonatomic) UIToolbar *segmentedToolBar;

@end
