//
//  Mediator.h
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "BackEnd.h"

//@class BackEnd;

@interface Mediator : NSObject

@property CLLocation *location;

//@property BackEnd *backEnd;

+ (id)sharedDataManager;
-(void) startSearch;

@end
