//
//  BIMViewController.m
//  masterAR
//
//  Created by Martin Nagy on 4/27/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "BIMViewController.h"

@interface BIMViewController ()

@end

@implementation BIMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    pickerItems = [[NSMutableArray alloc] init];
    [pickerItems addObject:@"UIT BIM"];
    [pickerItems addObject:@"NTNU GLØSHAUGEN BIM"];
    [pickerItems addObject:@"NTNU DRAGVOLL BIM"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [pickerItems objectAtIndex:component];
    
}

@end
