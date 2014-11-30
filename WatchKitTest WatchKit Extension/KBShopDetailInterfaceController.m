//
//  KBShopDetailInterfaceController.m
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

@import SharedLibrary;

#import "KBShopDetailInterfaceController.h"

@interface KBShopDetailInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceImage *shopImage;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *shopNameLabel;
@property (strong) KBHotpepperShop *shop;

@end

@implementation KBShopDetailInterfaceController

- (instancetype)initWithContext:(id)context
{
    self = [super initWithContext:context];
    
    KBHotpepperShop *shop = context;
    
    if (self) {
        [self.shopNameLabel setText:shop.name];
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: shop.logo_image]];
        
        [self.shopImage setImage:[UIImage imageWithData:imageData]];
        
        self.shop = shop;
    }
    
    return self;
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier
{
    return self.shop;
}

@end
