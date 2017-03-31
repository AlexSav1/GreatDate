//
//  DetailsViewController.h
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "DateLocation.h"
#import "Mediator.h"

@class Mediator;

@interface DetailsViewController : UIViewController

//@property (weak, nonatomic) NSString *image;
//@property (weak, nonatomic) NSString *name;
//@property (weak, nonatomic) NSString *address;
//@property (weak, nonatomic) NSString *phoneNumber;
//@property (weak, nonatomic) NSURL *url;

@property DateLocation *selectedLocation;

@property Mediator *mediator;

@property (weak, nonatomic) IBOutlet UIImageView *locationImage;
@property (weak, nonatomic) IBOutlet UILabel *locationName;
@property (weak, nonatomic) IBOutlet UILabel *locationAddress;
@property (weak, nonatomic) IBOutlet UILabel *locationPhoneNumber;


- (IBAction)moreDetails:(UIButton *)sender;
- (IBAction)letsGo:(UIButton *)sender;

@end
