//
//  Product.h
//  JWSearchResultsController
//
//  Created by Jowyer on 14/10/28.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const ProductTypeMobile;
extern NSString *const ProductTypeDesktop;
extern NSString *const ProductTypePortable;

@interface Product : NSObject

@property NSString *name;
@property NSString *type;

+ (NSArray *)allProducts;

+ (instancetype)productWithType:(NSString *)type name:(NSString *)name;

@end
