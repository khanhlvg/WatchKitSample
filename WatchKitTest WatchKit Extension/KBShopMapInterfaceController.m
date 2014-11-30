//
//  KBShopMapInterfaceController.m
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

@import SharedLibrary;

#import "KBShopMapInterfaceController.h"

@interface KBShopMapInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceMap *mapView;
@property (strong) KBHotpepperShop *shop;

@end

@implementation KBShopMapInterfaceController

- (instancetype)initWithContext:(id)context
{
    self = [super initWithContext:context];
    
    if (self) {
        self.shop = context;
        
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.shop.location.coordinate, 500, 500);
        
        [self.mapView setCoordinateRegion:region];
        [self.mapView addAnnotation:self.shop.location.coordinate
                       withPinColor:WKInterfaceMapPinColorGreen];
    }
    
    return self;
}

@end
