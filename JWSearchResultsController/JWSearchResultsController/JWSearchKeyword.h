//
//  JWSearchKeyword.h
//  JWSearchResultsController
//
//  Created by Jowyer on 15/7/19.
//  Copyright (c) 2015年 jo2studio. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const KeywordCategoryShopping;
extern NSString *const KeywordCategoryRestaurant;
extern NSString *const KeywordCategoryMovie;

@interface JWSearchKeyword : NSObject

@property NSString *name;
@property NSString *category;

+ (NSArray *)allKeywords;

+ (instancetype)keywordWithCategory:(NSString *)category name:(NSString *)name;

@end
