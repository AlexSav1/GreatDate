//
//  LocationViewController.m
//  GreatDate
//
//  Created by Avery Barrantes on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mediator = [Mediator sharedDataManager];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Loaction Stuff
- (IBAction)currentLocationButton:(UIButton *)sender {
    
    // Create the location manager if this object does not
    // already have one.
    if (nil == self.locationManager)
        self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    
    // Set a movement threshold for new events.
    self.locationManager.distanceFilter = 1000; // meters
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
    
    
    
    
    
    [self.navigationController pushViewController:self.mediator.pickerVC animated:TRUE];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    // If it's a relatively recent event, turn off updates to save power.
    //CLLocation* location = [locations lastObject];
    
    
    
    [self.locationManager stopUpdatingLocation];
    
    self.mediator.location = [[CLLocation alloc]initWithLatitude:self.locationManager.location.coordinate.latitude longitude:self.locationManager.location.coordinate.longitude];
    
    NSLog(@"LOCATION: %@", self.mediator.location);
    //[self.mediator startSearch];
    
    
}


- (IBAction)zipCodeButton:(UIButton *)sender {
}
@end
