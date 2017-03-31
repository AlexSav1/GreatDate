//
//  LocationViewController.h
//  GreatDate
//
//  Created by Avery Barrantes on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Mediator.h"
#import "BackEnd.h"


@interface LocationViewController : UIViewController <CLLocationManagerDelegate>

@property Mediator *mediator;

@property CLLocationManager *locationManager;

- (IBAction)currentLocationButton:(UIButton *)sender;
- (IBAction)zipCodeButton:(UIButton *)sender;

@end
