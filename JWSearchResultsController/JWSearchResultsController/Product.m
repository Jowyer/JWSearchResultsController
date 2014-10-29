//
//  Product.m
//  JWSearchResultsController
//
//  Created by Jowyer on 14/10/28.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "Product.h"

NSString *const ProductTypeMobile = @"Mobile";
NSString *const ProductTypeDesktop = @"Desktop";
NSString *const ProductTypePortable = @"Portable";

@implementation Product

+ (NSArray *)allProducts {
    return @[[Product productWithType:ProductTypeMobile name:@"iPhone 4s"],
             [Product productWithType:ProductTypeMobile name:@"iPhone 5"],
             [Product productWithType:ProductTypeMobile name:@"iPhone 5s"],
             [Product productWithType:ProductTypeMobile name:@"iPhone 6"],
             [Product productWithType:ProductTypeMobile name:@"iPhone 6 Plus"],
             [Product productWithType:ProductTypeMobile name:@"iPod touch"],
             [Product productWithType:ProductTypeMobile name:@"iPod nano"],
             [Product productWithType:ProductTypeMobile name:@"iPod shuffle"],
             [Product productWithType:ProductTypeMobile name:@"iPod classic"],
             [Product productWithType:ProductTypeMobile name:@"iPad 2"],
             [Product productWithType:ProductTypeMobile name:@"iPad mini"],
             [Product productWithType:ProductTypeMobile name:@"iPad Air"],
             [Product productWithType:ProductTypeDesktop name:@"iMac"],
             [Product productWithType:ProductTypeDesktop name:@"iMac Retina"],
             [Product productWithType:ProductTypeDesktop name:@"Mac Pro"],
             [Product productWithType:ProductTypeDesktop name:@"Mac mini"],
             [Product productWithType:ProductTypePortable name:@"MacBook"],
             [Product productWithType:ProductTypePortable name:@"MacBook Air"],
             [Product productWithType:ProductTypePortable name:@"MacBook Pro"]];
}

+ (instancetype)productWithType:(NSString *)type name:(NSString *)name {
    Product *newProduct = [[self alloc] init];
    newProduct.type = type;
    newProduct.name = name;
    return newProduct;
}

@end
