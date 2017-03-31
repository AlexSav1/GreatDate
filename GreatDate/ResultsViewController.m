//
//  ResultsViewController.m
//  GreatDate
//
//  Created by Alex Laptop on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cellImageOne.image = [UIImage  imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.selectedResturant.imageString]]];
    self.nameLabelOne.text = self.selectedResturant.name;
    self.locationLabelOne.text = self.selectedResturant.address;
    
    self.cellImageTwo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.selectedEntertainment.imageString]]];
    self.nameLabelTwo.text = self.selectedEntertainment.name;
    self.locationLabelTwo.text = self.selectedEntertainment.address;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)itsGoinDownButton:(UIButton *)sender {
//    [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:@"Cheeks"];
    
}
@end
