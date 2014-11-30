//
//  KBHotpepperShop.m
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import "KBHotpepperShop.h"
#import <CoreLocation/CoreLocation.h>

@implementation KBHotpepperShop

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if (self) {
        NSLog(@"%@", dict);
    }
    
    return self;
}

- (CLLocation *)location
{
    return [[CLLocation alloc] initWithLatitude:[self.lat doubleValue] longitude:[self.lng doubleValue]];
}

@end
