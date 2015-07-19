//
//  CollectionSegueViewController.m
//  JWSearchResultsController
//
//  Created by Jowyer on 15/7/19.
//  Copyright (c) 2015年 jo2studio. All rights reserved.
//

#import "CollectionSegueViewController.h"
#import "JWSearchKeyword.h"
#import "JWSearchResultsController.h"

@interface CollectionSegueViewController () <UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation CollectionSegueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Collection";
    
    JWSearchResultsController *searchResultsController = [self.storyboard instantiateViewControllerWithIdentifier:JWSearchResultsVCIdentifier];
    searchResultsController.allResults = [JWSearchKeyword allKeywords];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.scopeButtonTitles = @[@"All", KeywordCategoryShopping, KeywordCategoryRestaurant, KeywordCategoryMovie];
    
    self.definesPresentationContext = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.collectionView.contentOffset = CGPointMake(0, self.searchController.searchBar.frame.size.height);
}

#pragma mark - UICollectionView Delegate, DataSource & UICollectionViewDelegateFlowLayout
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeaderView" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            [self.searchController.searchBar sizeToFit];
            [headerView addSubview:self.searchController.searchBar];
        }
        reusableview = headerView;
    }
    return reusableview;
}

#pragma mark - UISearchResultsUpdating
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (!searchController.active) {
        return;
    }
    
    JWSearchResultsController *resultsController = (JWSearchResultsController *)searchController.searchResultsController;
    resultsController.filterString = searchController.searchBar.text;
}

#pragma mark - UISearchControllerDelegate
- (void)willPresentSearchController:(UISearchController *)searchController
{
    self.searchController.searchBar.selectedScopeButtonIndex = 0;
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    if (!self.searchController.active) {
        return;
    }
    
    JWSearchResultsController *resultsController = (JWSearchResultsController *)self.searchController.searchResultsController;
    resultsController.searchBarScopeIndex = selectedScope;
    resultsController.filterString = self.searchController.searchBar.text;
}


@end
