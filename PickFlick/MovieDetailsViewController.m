//
//  MovieDetailsViewController.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "Appearance.h"
#import <QuartzCore/QuartzCore.h>
#import "UIAlertView+SimpleAlert.h"
#import "Movie.h"

@interface MovieDetailsViewController()

@property (strong, nonatomic) Movie *movie;

@end

@implementation MovieDetailsViewController

- (id)initWithMovie: (Movie *)movie
{
    if (self = [super initWithNibName: nil bundle: nil]){
        [self.navigationItem setTitle: movie.title];
        [self setMovie: movie];
        [self.view addSubview: [self scrollView]];
        [self.view setTranslatesAutoresizingMaskIntoConstraints: NO];
    }
    return self;
}

- (void)viewDidLoad
{
    self.view.backgroundColor = [Appearance whiteColor];
    self.scrollView.backgroundColor = [Appearance whiteColor];
    [self.scrollView addSubview: self.posterView];
    [self.scrollView addSubview: self.releaseDateHeaderLabel];
    [self.scrollView addSubview: self.releaseDateLabel];
    [self.scrollView addSubview: self.starringHeaderLabel];
    [self.scrollView addSubview: self.starringLabel];
    [self.scrollView addSubview: self.watchTrailerButton];
    [self.scrollView addSubview: self.starView];
    [self.scrollView addSubview: self.plotSynopsisHeaderLabel];
    [self.scrollView addSubview: self.plotSynopsisLabel];
}

- (void)watchTrailer:(UIButton *)button
{
    [UIAlertView showSimpleAlertViewWithMessage: @"Watching Trailer!"];
}

- (void)drawDebugOutlineAroundView: (UIView *)view
{
    view.layer.borderColor = [Appearance darkBlueColor].CGColor;
    view.layer.borderWidth = 1.0;
}

- (UIImageView *)posterView
{
    if (!_posterView) {
        _posterView = [[UIImageView alloc] initWithImage: self.movie.posterImage];
        [_posterView setFrame:CGRectMake(10, 20, 128, 192)];
    }
    return _posterView;
}

- (UILabel *)releaseDateHeaderLabel
{
    if (!_releaseDateHeaderLabel) {
        _releaseDateHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(156, 20, 150, 14)];
        _releaseDateHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _releaseDateHeaderLabel.text = @"Release Date";
        _releaseDateHeaderLabel.font = [UIFont systemFontOfSize: 14.0f];
    }
    return _releaseDateHeaderLabel;
}

- (UILabel *)releaseDateLabel
{
    if (!_releaseDateLabel) {
        _releaseDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(156, 38, 150, 24)];
        _releaseDateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _releaseDateLabel.font = [UIFont fontWithName: @"HelveticaNeue-Medium" size: 20.0f];
        _releaseDateLabel.text = @"11/28/2013";
    }
    return _releaseDateLabel;
}

- (UILabel *)starringHeaderLabel
{
    if (!_starringHeaderLabel) {
        _starringHeaderLabel = [[UILabel alloc] initWithFrame: CGRectMake(156, 68, 150, 20)];
        _starringHeaderLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _starringHeaderLabel.text = @"Starring";
        _starringHeaderLabel.font = [UIFont systemFontOfSize: 14.0f];
    }
    return _starringHeaderLabel;
}

- (UILabel *)starringLabel
{
    if (!_starringLabel) {
        _starringLabel = [[UILabel alloc] initWithFrame: CGRectMake(156, 92, 150, 20)];
        _starringLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _starringLabel.font = [UIFont fontWithName: @"HelveticaNeue-Medium" size: 20.0f];
        _starringLabel.text = @"Charlie Chaplin";
    }
    return _starringLabel;
}

- (UIButton *)watchTrailerButton
{
    if (!_watchTrailerButton) {
        _watchTrailerButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        _watchTrailerButton.layer.cornerRadius = 10.0f;
        _watchTrailerButton.clipsToBounds = YES;
        [_watchTrailerButton setFrame: CGRectMake(10, 235, 300, 44)];
        _watchTrailerButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_watchTrailerButton addTarget: self
                                action: @selector(watchTrailer:)
                      forControlEvents: UIControlEventTouchUpInside];
        [_watchTrailerButton setTitle: @"Watch Trailer" forState: UIControlStateNormal];
        [_watchTrailerButton.titleLabel setFont: [UIFont systemFontOfSize: 24.0f]];
    }
    return _watchTrailerButton;
}

- (UIView *)starView
{
    if (!_starView) {
        _starView = [[UIView alloc] initWithFrame: CGRectMake(-2, 300, 324, 44)];
        [_starView setTranslatesAutoresizingMaskIntoConstraints: NO];
        [self drawDebugOutlineAroundView: _starView];
        //TODO: REMOVE THIS IT IS AWEFUL
        int i = 0;
        for (; i < 3; i++) {
            UIImageView *filledStar = [self filledStarForStarView];
            [filledStar setFrame: CGRectMake(10 + i * 40, 6, 30, 30)];
            
            [_starView addSubview: filledStar];
        }
        UIImageView *emptyStar = [self emptyStarForStarView];
        [emptyStar setFrame: CGRectMake(10 + i * 40, 6, 30, 30)];
        [_starView addSubview: emptyStar];
    }
    return _starView;
}

- (UIImageView *)filledStarForStarView
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FilledStar"]];
}

- (UIImageView *)emptyStarForStarView
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"EmptyStar"]];
}

- (UILabel *)plotSynopsisHeaderLabel
{
    if (!_plotSynopsisHeaderLabel) {
        _plotSynopsisHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 300, 24)];
        [_plotSynopsisHeaderLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        _plotSynopsisHeaderLabel.text = @"Plot Synopsis";
        [_plotSynopsisHeaderLabel setFont: [UIFont fontWithName: @"HelveticaNeue-medium" size: 20.0f]];
    }
    return _plotSynopsisHeaderLabel;
}

- (UILabel *)plotSynopsisLabel
{
    if (!_plotSynopsisLabel) {
        _plotSynopsisLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 380, 300, 100)];
        [_plotSynopsisLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
        [_plotSynopsisLabel setText: @"The Tramp finds work and the girl of his dreams at a circus."];
        [_plotSynopsisLabel setNumberOfLines: 2];
    }
    return _plotSynopsisLabel;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame: [[self view ]frame]];
        [_scrollView setTranslatesAutoresizingMaskIntoConstraints: NO];
        CGSize scrollSize = _scrollView.frame.size;
        scrollSize.height = scrollSize.height + 10.0f;
        [_scrollView setContentSize: scrollSize];
    }
    return _scrollView;
}


@end
