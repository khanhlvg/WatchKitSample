//
//  KBHotpepperShopXMLParser.m
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import "KBHotpepperShopXMLParser.h"
#import "KBHotpepperShop.h"

@interface KBHotpepperShopXMLParser() {
    NSMutableArray* _shopList;
    KBHotpepperShop* _currentShop;
    BOOL _isInsideShopTag;
    NSString* _currentKeyPath;
}

@end

@implementation KBHotpepperShopXMLParser

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    _shopList = [NSMutableArray array];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"shop"]) {
        _currentShop = [[KBHotpepperShop alloc] init];
        _isInsideShopTag = YES;
        _currentKeyPath = [NSString string];
        return;
    }
    
    if ([elementName isEqualToString:@"id"]) {
        elementName = @"uid";
    }
    
    if (_isInsideShopTag) {
        if ([_currentKeyPath isEqualToString:@""]) {
            _currentKeyPath = [_currentKeyPath stringByAppendingFormat:@"%@",elementName];
        } else {
            _currentKeyPath = [_currentKeyPath stringByAppendingFormat:@".%@",elementName];
        }
        
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"shop"]) {
        [_shopList addObject:_currentShop];
        _isInsideShopTag = NO;
        return;
    }
    
    if (_isInsideShopTag) {
        _currentKeyPath = [self.class stringByTrimLastComponentFromKeyPath:_currentKeyPath];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{

    @try {
        [_currentShop setValue:string forKeyPath:_currentKeyPath];
    }
    @catch (NSException *exception) {
        //NSLog(@" ShopParser skipped [%@]", _currentKeyPath);
    }
    
}

+ (NSString *)stringByTrimLastComponentFromKeyPath:(NSString *)keyPath
{
    NSRange indexOfLastDot = [keyPath rangeOfString:@"." options:NSBackwardsSearch];
    if (indexOfLastDot.location == NSNotFound) {
        return @"";
    }
    
    return [keyPath substringToIndex:indexOfLastDot.location - 1];
}

@end
