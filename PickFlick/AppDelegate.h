//
//  AppDelegate.h
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseMovieViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ChooseMovieViewController *chooseMovieViewController;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) UINavigationController *navController;

@end
