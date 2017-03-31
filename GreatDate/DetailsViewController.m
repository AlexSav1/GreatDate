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
    self.locationImage.image = [UIImage  imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.image]]];
    self.locationName.text = self.name;
    self.locationAddress.text = self.address;
    self.locationPhoneNumber.text = self.phoneNumber;
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

- (IBAction)moreDetails:(UIButton *)sender {
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.url = self.url;
    webVC.locationName = self.name;
    [self.navigationController pushViewController:webVC animated:true];
}

- (IBAction)letsGo:(UIButton *)sender {
}
@end
