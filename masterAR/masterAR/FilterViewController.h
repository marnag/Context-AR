//
//  FilterViewController.h
//  masterAR
//
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    __weak NSString *filterName;
    __weak IBOutlet UITableView *TableTest;
}

@property int *currentItem;

@end