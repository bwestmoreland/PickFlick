//
//  AppDelegate.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "AppDelegate.h"
#import "Appearance.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    [Appearance setAppearance];
    return YES;
}


- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    return _window;
}

- (ChooseMovieViewController *)chooseMovieViewController
{
    if (!_chooseMovieViewController) {
        _chooseMovieViewController = [[ChooseMovieViewController alloc] initWithCollectionViewLayout: self.layout];
    }
    return _chooseMovieViewController;
}

- (UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(92, 140);
        _layout.sectionInset = UIEdgeInsetsMake(60, 8, 20, 8);
    }
    return _layout;
}

- (UINavigationController *)navController
{
    if (!_navController) {
        _navController = [[UINavigationController alloc] initWithRootViewController:self.chooseMovieViewController];
        [_navController.navigationBar setTranslucent: NO];
    }
    return _navController;
}


@end
