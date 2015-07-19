//
//  JWSearchKeyword.m
//  JWSearchResultsController
//
//  Created by Jowyer on 15/7/19.
//  Copyright (c) 2015年 jo2studio. All rights reserved.
//

#import "JWSearchKeyword.h"

NSString *const KeywordCategoryShopping = @"Shopping";
NSString *const KeywordCategoryRestaurant = @"Restaurant";
NSString *const KeywordCategoryMovie = @"Movie";

@implementation JWSearchKeyword
+ (NSArray *)allKeywords {
    return @[[JWSearchKeyword keywordWithCategory:KeywordCategoryShopping name:@"iPhone"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryShopping name:@"iPad"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryShopping name:@"MacBook Air"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryRestaurant name:@"MacDonald"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryRestaurant name:@"KFC"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryRestaurant name:@"Starbucks"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryMovie name:@"Star Wars"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryMovie name:@"I Am Legend"],
             [JWSearchKeyword keywordWithCategory:KeywordCategoryMovie name:@"Mad Max"],
             ];
}

+ (instancetype)keywordWithCategory:(NSString *)category name:(NSString *)name {
    JWSearchKeyword *keyword = [JWSearchKeyword new];
    keyword.category = category;
    keyword.name = name;
    return keyword;
}

@end
