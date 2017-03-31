//
//  DetailsViewController.m
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mediator = [Mediator sharedDataManager];
    
    
}

-(void) viewWillAppear:(BOOL)animated{
    //self.locationImage.image = [UIImage  imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.image]]];
    self.locationName.text = self.selectedLocation.name;
    self.locationAddress.text = self.selectedLocation.address;
    NSLog(@"%@", self.selectedLocation);
    //self.locationPhoneNumber.text = self.phoneNumber;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)moreDetails:(UIButton *)sender {
    self.mediator.webVC.url = self.selectedLocation.url;
    self.mediator.webVC.locationName = self.selectedLocation.name;
    [self.navigationController pushViewController:self.mediator.webVC animated:TRUE];
}

- (IBAction)letsGo:(UIButton *)sender {
    
    if(self.selectedLocation.isResturant == TRUE){
        
        [self.mediator.tableVC.currentPlacesToDisplay removeAllObjects];
        [self.mediator.tableVC.currentPlacesToDisplay addObjectsFromArray:self.mediator.entertainmentLocationsArray];
        self.mediator.selectedResturant = self.selectedLocation;
        [self.navigationController popToViewController:self.mediator.tableVC animated:TRUE];
    } else{
        self.mediator.selectedEntertainment = self.selectedLocation;
        self.mediator.resultsVC.selectedResturant = self.mediator.selectedResturant;
        self.mediator.resultsVC.selectedEntertainment = self.mediator.selectedEntertainment;
        [self.navigationController pushViewController:self.mediator.resultsVC animated:TRUE];
    }
    
}
@end
