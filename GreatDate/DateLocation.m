//
//  DateLocation.m
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "DateLocation.h"

@implementation DateLocation

- (instancetype)initWithName: (NSString*) name
                     address: (NSString*) address
                        type: (NSString*) type
                         url: (NSURL*) url
              andIsResturant: (BOOL) isResturant{
    
    self = [super init];
    if (self) {
        self.name = name;
        self.address = address;
        self.type = type;
        self.url = url;
        self.isResturant = isResturant;
    }
    return self;
}

@end
