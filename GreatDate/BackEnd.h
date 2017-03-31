//
//  BackEnd.h
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

//@protocol BackEndDelegate <NSObject>
//
//- (void) didFindResturants;
//
//@end

@class Mediator;


@interface BackEnd : NSObject

//@property (nonatomic) id <BackEndDelegate> delegate;
@property Mediator *mediator;

-(void) searchForResturantWithinLocation:(CLLocation*) location;

@end

