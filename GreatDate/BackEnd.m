//
//  BackEnd.m
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "BackEnd.h"

@implementation BackEnd


//uses MKLocalSearch
-(void) searchForResturantWithinLocation:(CLLocation*) location
                             ForFoodType: (NSString*) foodType{
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc]init];
    request.naturalLanguageQuery = foodType;
    request.region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), 500, 500);
    
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse * _Nullable response, NSError * _Nullable error) {
        //NSLog(@"%@", response.mapItems);
        
        for (MKMapItem *item in response.mapItems) {
            NSLog(@"ITEM: %@",item);
            //NSLog(@"NAME: %@", item.name);
            //NSLog(@"PLACEMARK: %@", item.placemark.addressDictionary[@"FormattedAddressLines"]);
            //NSLog(@"URL: %@", item.url);
            
            NSArray *theArray = item.placemark.addressDictionary[@"FormattedAddressLines"];
            NSString *theString = [NSString stringWithFormat:@"%@, %@", theArray[0], theArray[1]];
            NSURL *url = item.url;
            //NSLog(@"PLACEMARK: %@",theString);
            
            
            DateLocation *newLocation = [[DateLocation alloc]initWithName: item.name address: theString type: foodType url: url andIsResturant: TRUE];
            
            [self.mediator.resturantArray addObject:newLocation];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mediator.pickerVC pushTableVC];
        });
    }];
}

//uses google places api
-(void) searchForFunWithinLocation:(CLLocation*) location
                             ForFoodType: (NSString*) foodType
                              andFunType: (NSString*) funType{
    
    self.mediator = [Mediator sharedDataManager];
    
    NSString *key = @"AIzaSyAqaHBbns3p-R1RNQr_w_HMhVqOAM408e4";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=75&type=%@&key=%@", location.coordinate.latitude, location.coordinate.longitude, funType, key];
    NSLog(@"%@", urlString);
    [request setURL:[NSURL URLWithString:urlString]];
    
    request.HTTPMethod = @"GET";
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if(httpResponse.statusCode == 200){
            
            //NSLog(@"success");
            
            NSDictionary *newDiction = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if(!newDiction){
                NSLog(@"didnt get anything back");
                return;
            }
            
            NSLog(@"%@", newDiction);
            
            for (NSDictionary *place in newDiction[@"results"]) {
                NSLog(@"INDIV:   %@", place);
//                
//                NSLog(@"NAME:   %@", place[@"name"]);
//                NSLog(@"ADDRESS:   %@", place[@"vicinity"]);
                
                NSString *name = place[@"name"];
                NSString *address = place[@"vicinity"];
                NSURL *url = [NSURL URLWithString:place[@"url"]];

                
                DateLocation *newLocation = [[DateLocation alloc]initWithName: name address: address type: funType url: url andIsResturant: FALSE];
                
                [self.mediator.entertainmentLocationsArray addObject:newLocation];
            }
            
        } else{
            
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self searchForResturantWithinLocation:location ForFoodType:foodType];
        });
    }];
    [postDataTask resume];
    
    
}

@end
