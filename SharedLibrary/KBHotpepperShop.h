//
//  KBHotpepperShop.h
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CLLocation;

@interface KBHotpepperShop : NSObject

@property (nonatomic,copy) NSString *uid;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *logo_image;
@property (nonatomic,copy) NSString *lat;
@property (nonatomic,copy) NSString *lng;
@property (nonatomic,readonly) CLLocation *location;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
