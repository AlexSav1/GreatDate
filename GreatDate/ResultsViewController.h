//
//  ResultsViewController.h
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateLocation.h"

@interface ResultsViewController : UIViewController

@property DateLocation *selectedResturant;

@property DateLocation *selectedEntertainment;

- (IBAction)goToSiteButtonOne:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *nameLabelOne;
@property (strong, nonatomic) IBOutlet UILabel *locationLabelOne;
@property (strong, nonatomic) IBOutlet UIImageView *cellImageOne;
- (IBAction)goToSiteButtonTwo:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *nameLabelTwo;
@property (strong, nonatomic) IBOutlet UILabel *locationLabelTwo;
@property (strong, nonatomic) IBOutlet UIImageView *cellImageTwo;
- (IBAction)itsGoinDownButton:(UIButton *)sender;

@end
