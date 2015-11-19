//
//  TimeCircutsViewController.h
//  OuttaTimeObjectiveC
//
//  Created by Keron Williams on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OuttaTimeViewController.h"

@protocol DatePickerDelegate <NSObject>
-(void)dateWasSelected:(NSDate *)seclectedDate;

@end

@interface TimeCircutsViewController : UIViewController
{
    __weak IBOutlet UIDatePicker *DatePickerOutlet;
}

@property (nonatomic, weak) id <DatePickerDelegate> delegate;

- (IBAction)DatePickerChanged:(UIDatePicker *)sender;
@end
