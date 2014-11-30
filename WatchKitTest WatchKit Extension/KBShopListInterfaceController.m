//
//  InterfaceController.m
//  WatchKitTest WatchKit Extension
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import "KBShopListInterfaceController.h"
#import "KBShopTableRowDto.h"
@import SharedLibrary;


@interface KBShopListInterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *tableView;
@property (nonatomic,copy) NSArray *shopList;

@end


@implementation KBShopListInterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
        [self loadShopList];
    }
    return self;
}

- (void)loadShopList
{
    CLLocation *tokyoStation = [[CLLocation alloc] initWithLatitude:35.681443 longitude:139.766293];
    CLLocation *odaibaStation = [[CLLocation alloc] initWithLatitude:35.624877 longitude:139.776185];
    CLLocation *shinjukuSanchomeStation = [[CLLocation alloc] initWithLatitude:35.690111 longitude:139.705171];
    
    __weak typeof(self) weakSelf = self;
    
    [KBHotpepperGourmetFetcher startFetcherWithLocation:shinjukuSanchomeStation
                                         successHandler:^(NSArray *result) {
                                             [weakSelf setupWithShopList:result];
                                         } failureHandler:^(NSError *error) {
                                             
                                         }];
    
}

- (void)setupWithShopList:(NSArray *)shopList
{
    self.shopList = shopList;
    
    [self.tableView setNumberOfRows:self.shopList.count
                            withRowType:@"shopRow"];
    
    int pos = 0;
    
    for (KBHotpepperShop *shop in self.shopList) {
        KBShopTableRowDto *row = [self.tableView rowControllerAtIndex:pos];
        row.shopNameLabel.text = shop.name;
        pos++;
    }

}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier inTable:(WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex
{
    KBShopTableRowDto *shop = self.shopList[rowIndex];
    return shop;
}

@end



