//
//  KBHotpepperGourmetFetcher.m
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import "KBHotpepperGourmetFetcher.h"
#import <AFNetworking.h>
#import "KBURLConstants.h"
#import <CoreLocation/CoreLocation.h>
#import "KBHotpepperShop.h"
#import "KBHotpepperShopXMLParser.h"

@interface KBHotpepperGourmetFetcher ()

@property (nonatomic, copy) void (^successHandler)(NSArray *result);
@property (nonatomic, copy) void (^failureHandler)(NSError *error);

@property (nonatomic) KBHotpepperShopXMLParser *xmlParserDelegate;

@property (nonatomic, copy) CLLocation *currentLocation;

@end

@implementation KBHotpepperGourmetFetcher

+ (instancetype)startFetcherWithLocation:(CLLocation *)currentLocation successHandler:(void (^)(NSArray *))successHandler failureHandler:(void (^)(NSError *))failureHandler
{
    KBHotpepperGourmetFetcher *instance = [[self alloc] init];
    
    instance.successHandler = successHandler;
    instance.failureHandler = failureHandler;
    
    instance.currentLocation = currentLocation;
    
    [instance startFetcher];
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.xmlParserDelegate = [KBHotpepperShopXMLParser new];
    }
    
    return self;
}

- (void)startFetcher
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"key": KB_HOTPEPPER_API_KEY,
                                 @"lat": [NSNumber numberWithDouble:self.currentLocation.coordinate.latitude],
                                 @"lng": [NSNumber numberWithDouble:self.currentLocation.coordinate.longitude],
                                 @"range": [NSNumber numberWithInteger:2]};
    
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    [manager GET:@"http://webservice.recruit.co.jp/hotpepper/gourmet/v1/"
      parameters:parameters
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
//             NSMutableArray *ret = [NSMutableArray array];
//             
//             for (NSDictionary *item in responseObject[@"shop"]) {
//                 KBHotpepperShop *shopEntity = [[KBHotpepperShop alloc] initWithDictionary:item];
//                 [ret addObject:shopEntity];
//             }
             
             NSXMLParser *parser = (NSXMLParser *) responseObject;
             parser.delegate = self.xmlParserDelegate;
             [parser parse];
             
             self.successHandler(self.xmlParserDelegate.shopList);
             NSLog(@"parsed shopList: %@", self.xmlParserDelegate.shopList);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             self.failureHandler(error);
    }];
}

@end
