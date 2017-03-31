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
    });
    return sharedMyManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backEnd = [[BackEnd alloc] init];
        self.pickerVC = [[PickerViewController alloc]initWithNibName:@"PickerViewController" bundle:nil];
        self.tableVC = [[TableViewController alloc]initWithNibName:@"TableViewController" bundle:nil];
        self.detailsVC = [[DetailsViewController alloc]initWithNibName:@"DetailsViewController" bundle:nil];
        self.resultsVC = [[ResultsViewController alloc]initWithNibName:@"ResultsViewController" bundle:nil];
        self.webVC = [[WebViewController alloc]init];
        self.resturantArray = [[NSMutableArray alloc]init];
        self.entertainmentLocationsArray = [[NSMutableArray alloc]init];
    }
    return self;
}

-(void) startSearchForFoodType: (NSString*) foodType
                    andFunType: (NSString*) funType{
    
//    if (nil == self.backEnd.delegate)
//            self.backEnd.delegate = self;
    //NSLog(@"LOCATION: %@", self.location);
    [_backEnd searchForFunWithinLocation:self.location ForFoodType:foodType andFunType:funType];
    
}

-(void) didFindResturants{
    
}


@end
