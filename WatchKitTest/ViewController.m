//
//  ViewController.m
//  WatchKitTest
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import "ViewController.h"
@import SharedLibrary;
#import <CoreLocation/CoreLocation.h>
#import "KBHotpepperShop.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
//    CLLocation *tokyoStation = [[CLLocation alloc] initWithLatitude:35.681443 longitude:139.766293];
//    
//    [KBHotpepperGourmetFetcher startFetcherWithLocation:tokyoStation
//                                         successHandler:^(NSArray *result) {
//                                             KBHotpepperShop *shop = result[0];
//                                             NSLog(@"result[0] = %@",shop.name);
//                                         } failureHandler:^(NSError *error) {
//    
//                                         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
