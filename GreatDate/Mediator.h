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
#import "PickerViewController.h"
#import "TableViewController.h"
#import "DetailsViewController.h"
#import "ResultsViewController.h"
#import "WebViewController.h"

@class DetailsViewController;

@interface Mediator : NSObject

@property CLLocation *location;

@property NSMutableArray *resturantArray;

@property DateLocation *selectedResturant;

@property NSMutableArray *entertainmentLocationsArray;

@property DateLocation *selectedEntertainment;

@property PickerViewController *pickerVC;

@property TableViewController *tableVC;

@property DetailsViewController *detailsVC;

@property ResultsViewController *resultsVC;

@property WebViewController *webVC;


+ (id)sharedDataManager;
-(void) startSearchForFoodType: (NSString*) foodType
                    andFunType: (NSString*) funType;

@end
