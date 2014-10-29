//
//  JWSearchResultsController.h
//  TestSearchController
//
//  Created by Jowyer on 14/10/28.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const JWSearchResultsVCIdentifier;

@interface JWSearchResultsController : UITableViewController

@property (nonatomic, copy) NSString *filterString;
@property (copy) NSArray *allResults;
@property NSInteger searchBarScopeIndex;

@end
