//
//  FilterViewController.h
//  masterAR
//
//  Created by Martin Nagy on 4/25/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{

    __weak NSString *filterName;
    
    __weak IBOutlet UITableView *TableTest;
}

@end
