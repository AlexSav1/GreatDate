//
//  PickerViewController.m
//  GreatDate
//
//  Created by Maxwell Schneider on 3/30/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "PickerViewController.h"
#import "Mediator.h"

@interface PickerViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *foodPicker;
@property NSArray *foodPickerData;
@property NSString *foodSelection;

@property (weak, nonatomic) IBOutlet UIPickerView *funPicker;
@property NSArray *funPickerData;
@property NSString *funSelection;

@property Mediator *mediator;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.mediator = [Mediator sharedDataManager];
    
    self.foodPicker.delegate = self;
    self.foodPicker.dataSource = self;
    
    self.funPicker.delegate = self;
    self.funPicker.dataSource = self;
    
    self.foodPickerData = @[@"sushi", @"pizza", @"burger"];
    self.foodSelection = @"sushi";
    
    self.funPickerData = @[@"movietheater", @"bar",  @"bowlingalley", @"nightclub"];
    self.funSelection = @"movietheater";

}

#pragma mark picker view delegate methods

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView == self.foodPicker){
        return self.foodPickerData.count;
        
    } else if(pickerView == self.funPicker){
        return self.funPickerData.count;
        
    } else{
        return 1;
    }
    
    
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component{
    
    if(pickerView == self.foodPicker){
        return self.foodPickerData[row];
        
    } else if(pickerView == self.funPicker){
        return self.funPickerData[row];
        
    } else{
        return @"fuck";
    }

}


// Catpure the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    
    if(pickerView == self.foodPicker){
        self.foodSelection = self.foodPickerData[row];
        
    } else if(pickerView == self.funPicker){
        self.funSelection = self.funPickerData[row];
    }
    
}

#pragma mark buttonPressed

- (IBAction)goButtonPressed:(id)sender {
    
    [self.mediator startSearchForFoodType:self.foodSelection andFunType:self.funSelection];
    
    //[self.navigationController pushViewController:self.mediator.tableVC animated:TRUE];
    
}

#pragma mark pushNextView
-(void) pushTableVC{
    
    self.mediator.tableVC.currentPlacesToDisplay = [[NSMutableArray alloc]initWithArray:self.mediator.resturantArray];
    
    [self.navigationController pushViewController:self.mediator.tableVC animated:TRUE];
}




@end
