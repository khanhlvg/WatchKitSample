//
//  GlanceController.m
//  WatchKitTest WatchKit Extension
//
//  Created by Le Viet Gia Khanh on 11/30/14.
//  Copyright (c) 2014 Ko Bluewater. All rights reserved.
//

#import "GlanceController.h"


@interface GlanceController()

@end


@implementation GlanceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



