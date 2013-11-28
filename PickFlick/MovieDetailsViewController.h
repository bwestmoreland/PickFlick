//
//  MovieDetailsViewController.h
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

@class Movie;

@interface MovieDetailsViewController : UIViewController

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *posterView;
@property (strong, nonatomic) UILabel *releaseDateHeaderLabel;
@property (strong, nonatomic) UILabel *releaseDateLabel;
@property (strong, nonatomic) UILabel *starringHeaderLabel;
@property (strong, nonatomic) UILabel *starringLabel;
@property (strong, nonatomic) UIButton *watchTrailerButton;
@property (strong, nonatomic) UIView *starView;
@property (strong, nonatomic) UILabel *plotSynopsisHeaderLabel;
@property (strong, nonatomic) UILabel *plotSynopsisLabel;


//designated initializer
- (id)initWithMovie: (Movie *)movie;

- (void)watchTrailer: (UIButton *)button;


@end
