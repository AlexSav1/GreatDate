//
//  BackEnd.m
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "BackEnd.h"

@implementation BackEnd

-(void) searchForResturantWithinLocation:(CLLocation*) location{
    
    NSString *key = @"AIzaSyAqaHBbns3p-R1RNQr_w_HMhVqOAM408e4";
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    NSLog(@"LAT: %f", location.coordinate.latitude);
    NSLog(@"LONG: %f", location.coordinate.longitude);
    
    NSString *urlString = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%f,%f&radius=75&type=restaurant&key=%@", location.coordinate.latitude, location.coordinate.longitude, key];
    
    [request setURL:[NSURL URLWithString:urlString]];
    
    request.HTTPMethod = @"GET";
    //request.HTTPBody = jsonData;
    //[request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        if(httpResponse.statusCode == 200){
            
            NSLog(@"success");
            
            NSDictionary *newDiction = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if(!newDiction){
                NSLog(@"didnt get anything back");
                return;
            }
            
            for (NSDictionary *place in newDiction[@"results"]) {
                NSLog(@"INDIV:   %@", place);
                
            }
            
        } else{
            
        }
        
    }];
    [postDataTask resume];
  
    
}

@end
