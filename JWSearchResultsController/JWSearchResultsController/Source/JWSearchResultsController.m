//
//  JWSearchResultsController.m
//  TestSearchController
//
//  Created by Jowyer on 14/10/28.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "JWSearchResultsController.h"
#import "Product.h"

#error Assign the JWSearchResultsVCIdentifier & JWSearchResultsCellIdentifier into the storyboard, and remove this..
NSString *const JWSearchResultsVCIdentifier = @"JWSearchResultsVCIdentifier";
NSString *const JWSearchResultsCellIdentifier = @"JWSearchResultsCell";

@interface JWSearchResultsController ()

@property (nonatomic, strong) NSMutableArray *visibleResults;

@end

@implementation JWSearchResultsController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.visibleResults = [NSMutableArray arrayWithCapacity:[self.allResults count]];
}

#pragma mark - Property Overrides & Filter Strategy
- (void)setFilterString:(NSString *)filterString {
    _filterString = filterString;
    
#warning Make your filtering strategy
    self.visibleResults = [self.allResults mutableCopy];
    if (!filterString || filterString.length <= 0) {
        return;
    }
    else {
        NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name CONTAINS [c] $nameString"];
        [self.visibleResults filterUsingPredicate:[namePredicate predicateWithSubstitutionVariables:@{@"nameString":filterString}]];
    }
    
    NSPredicate *typePredicate = [NSPredicate predicateWithFormat:@"type CONTAINS [c] $typeString"];
    
    switch (self.searchBarScopeIndex) {
        case 0:
            break;
        case 1:
            [self.visibleResults filterUsingPredicate:[typePredicate predicateWithSubstitutionVariables:@{@"typeString":ProductTypeMobile}]];
            break;
        case 2:
            [self.visibleResults filterUsingPredicate:[typePredicate predicateWithSubstitutionVariables:@{@"typeString":ProductTypeDesktop}]];
            break;
        case 3:
            [self.visibleResults filterUsingPredicate:[typePredicate predicateWithSubstitutionVariables:@{@"typeString":ProductTypePortable}]];
            break;
            
        default:
            break;
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.visibleResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:JWSearchResultsCellIdentifier forIndexPath:indexPath];

#warning Refresh cells by your way
    Product *product;
    product = [self.visibleResults objectAtIndex:indexPath.row];
    
    cell.textLabel.text = product.name;
    return cell;
}

@end
