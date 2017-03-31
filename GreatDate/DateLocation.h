//
//  DateLocation.h
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateLocation : NSObject

@property BOOL isResturant;
@property NSString *name;
@property NSString *address;
@property NSURL *url;
@property NSString *type;

- (instancetype)initWithName: (NSString*) name
                     address: (NSString*) address
                        type: (NSString*) type
                         url: (NSURL*) url
              andIsResturant: (BOOL) isResturant;

@end
