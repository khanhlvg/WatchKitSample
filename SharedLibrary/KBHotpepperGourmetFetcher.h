//
//  KBHotpepperGourmetFetcher.h
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLLocation;
@class KBHotpepperShop;

@interface KBHotpepperGourmetFetcher : NSObject

+ (instancetype)startFetcherWithLocation:(CLLocation *)currentLocation
                          successHandler:(void (^)(NSArray *result))successHandler
                          failureHandler:(void (^)(NSError *error))failureHandler;

@end
