//
//  BIMViewController.h
//  masterAR
//
//  Created by Martin Nagy on 4/27/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIMViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{

    NSMutableArray *pickerItems;
    __weak IBOutlet UIPickerView *pickerTest;

}

@end
