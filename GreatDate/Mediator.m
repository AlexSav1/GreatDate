//
//  Mediator.m
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "Mediator.h"

static BackEnd *_backEnd;

@implementation Mediator

+ (id)sharedDataManager {
    static Mediator *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
        _backEnd = [[BackEnd alloc] init];
    });
    return sharedMyManager;
}

-(void) startSearch{
    
//    if (nil == self.backEnd.delegate)
//            self.backEnd.delegate = self;

    [_backEnd searchForResturantWithinLocation:self.location];
    
}

-(void) didFindResturants{
    
}


@end
