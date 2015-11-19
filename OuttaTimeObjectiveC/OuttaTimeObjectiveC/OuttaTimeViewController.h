//
//  OuttaTimeViewController.h
//  OuttaTimeObjectiveC
//
//  Created by Keron Williams on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OuttaTimeViewController : UIViewController
{
    __weak IBOutlet UILabel *DestinationTimeLabel;

    __weak IBOutlet UILabel *PresentTimeLabel;

    __weak IBOutlet UILabel *LastTimeDepartedLabel;
    
    __weak IBOutlet UILabel *SpeedLabel;
}

@property(nonatomic) NSString * lastTimeDeparted;
@property(nonatomic) NSTimer * timerBack;
@property(nonatomic) int currentSpeed;
@property(nonatomic) NSDate * currentDate;








@end
