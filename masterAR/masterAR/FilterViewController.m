//
//  FilterViewController.m
//  masterAR
//
//  Created by Martin Nagy on 4/25/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController
{
    NSArray *tableData;
}

@synthesize currentItem;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Initialize table data
    tableData = [NSArray arrayWithObjects:
                 @"Beams",
                 @"Fire alarms",
                 @"Electrical wires",
                 @"Electrical tables",
                 @"Ventilation pipes",
                 @"Ventilation valves",
                 @"Water pipes",
                 @"Water valves",
                 nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    currentItem = indexPath.row;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshView" object:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
