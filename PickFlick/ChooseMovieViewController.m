//
//  MainViewController.m
//  NavBar
//
//  Created by Brent Westmoreland on 11/17/13.
//  Copyright (c) 2013 Brent Westmoreland. All rights reserved.
//

#import "ChooseMovieViewController.h"
#import "MovieDetailsViewController.h"
#import "UIColor+CustomColors.h"
#import "Movie.h"
#import "UIAlertView+SimpleAlert.h"

@interface ChooseMovieViewController()
{
    MovieDetailsViewController *_movieDetailsController;
    UIBarButtonItem *_segmentedControlButtonItem;
    UIBarButtonItem *_flexibleSpace;
}

@property (nonatomic, strong) NSMutableArray *movieReferences;

@end

@implementation ChooseMovieViewController

- (id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithCollectionViewLayout: layout]) {
        self.title = @"PickFlick";
        self.navigationItem.leftBarButtonItem = [self searchBarButton];
        self.navigationItem.rightBarButtonItem = [self genresBarButton];

    }
    return self;
}

//Currently this is just a placeholder array until the movie object exists

- (NSArray *)movieReferences
{
    if (!_movieReferences) {
        _movieReferences = [[NSMutableArray alloc] initWithCapacity: 12];
        //TODO: Remove when movie posters are showing
        for (int i = 0; i < 12; i ++) {
            [_movieReferences addObject: [self randomColor]];
        }
        _movieReferences = [_movieReferences copy];
    }
    return _movieReferences ;
}


- (UIColor *)randomColor
{
    //TODO: Remove random colors when we've got movie posters showing properly.
    return  [UIColor colorWithRed: [self randomFloatBetweenZeroAndOne]
                            green: [self randomFloatBetweenZeroAndOne]
                             blue: [self randomFloatBetweenZeroAndOne]
                            alpha: 1.0f];
}

- (float)randomFloatBetweenZeroAndOne
{
    //used to generate random colors
    return arc4random() % 255 / 255.0f;
}

#pragma mark - View LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor creamColor];
    [self.collectionView registerClass: [UICollectionViewCell class]
            forCellWithReuseIdentifier: @"UICollectionViewCell"];
    
    [self.view addSubview: self.segmentedToolBar];
    
    _segmentedControlButtonItem = [[UIBarButtonItem alloc] initWithCustomView: (UIView *)self.segmentedControl];
    _flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                   target: nil
                                                                   action: nil];
    
    NSArray *barArray = @[_flexibleSpace, _segmentedControlButtonItem, _flexibleSpace];
    
    [self.segmentedToolBar setItems: barArray];
    

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.movieReferences.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"UICollectionViewCell"
                                                                           forIndexPath: indexPath];
    
    cell.contentView.backgroundColor = (UIColor *)self.movieReferences[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Movie *movie = [[Movie alloc] init];
    movie.title = @"The Circus";
//    Movie *movie = self.movieReferences[indexPath.item];
    _movieDetailsController = [[MovieDetailsViewController alloc] initWithMovie: movie];
    [self.navigationController pushViewController: _movieDetailsController animated: YES];
}

#pragma mark - BarButtonItems

- (UIBarButtonItem *)genresBarButton
{
    if (!_genresBarButton) {
        _genresBarButton = [[UIBarButtonItem alloc] initWithTitle: @"Genres"
                                                            style: UIBarButtonItemStylePlain
                                                           target: self
                                                           action: @selector(genresButtonPressed:)];
    }
    return _genresBarButton;
}

- (UIBarButtonItem *)searchBarButton
{
    if (!_searchBarButton) {
        _searchBarButton = [[UIBarButtonItem alloc] initWithTitle: @"Search"
                                                            style: UIBarButtonItemStylePlain
                                                           target: self
                                                           action: @selector(searchButtonPressed:)];
    }
    return _searchBarButton;
}

- (void)genresButtonPressed: (UIBarButtonItem *)genresButton
{
    [UIAlertView showSimpleAlertViewWithMessage: @"Genres button pressed"];
}

- (void)searchButtonPressed: (UIBarButtonItem *)searchButton
{
    [UIAlertView showSimpleAlertViewWithMessage: @"Search button pressed"];
}

#pragma mark - SegmentedControl

- (UIToolbar *)segmentedToolBar
{
    if (!_segmentedToolBar){
        CGRect navBarFrame = self.navigationController.navigationBar.frame;
        CGRect toolBarFrame = navBarFrame;
        //TODO: remove magic number for status bar
        toolBarFrame.origin.y = navBarFrame.size.height - 44;
        _segmentedToolBar = [[UIToolbar alloc] initWithFrame: toolBarFrame];
        [_segmentedToolBar setTranslucent: NO];
    }
    return _segmentedToolBar;
}

- (UISegmentedControl *)segmentedControl
{
    if (!_segmentedControl){
        _segmentedControl = [[UISegmentedControl alloc] initWithItems: @[@"Most Popular", @"Featured", @"Just Added"]];
        _segmentedControl.selectedSegmentIndex = 1;
    }
    return _segmentedControl;
}





@end
