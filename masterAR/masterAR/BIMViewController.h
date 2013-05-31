//
//  BIMViewController.h
//  masterAR
//
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIMViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{

    NSMutableArray *pickerItems;
    __weak IBOutlet UIPickerView *pickerTest;

}

@end
