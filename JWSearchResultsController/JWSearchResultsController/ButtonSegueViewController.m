//
//  ButtonSegueViewController.m
//  JWSearchResultsController
//
//  Created by Jowyer on 14/10/29.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "ButtonSegueViewController.h"
#import "JWSearchKeyword.h"
#import "JWSearchResultsController.h"

@interface ButtonSegueViewController () <UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation ButtonSegueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Button";
}

- (IBAction)searchButtonTapped:(id)sender {
    JWSearchResultsController *searchResultsController = [self.storyboard instantiateViewControllerWithIdentifier:JWSearchResultsVCIdentifier];
    searchResultsController.allResults = [JWSearchKeyword allKeywords];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    
    self.searchController.searchBar.delegate = self;
    self.searchController.searchBar.scopeButtonTitles = @[@"All", KeywordCategoryShopping, KeywordCategoryRestaurant, KeywordCategoryMovie];
    
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    [self presentViewController:self.searchController animated:YES completion:nil];
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
