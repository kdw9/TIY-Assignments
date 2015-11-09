//
//  OuttaTimeViewController.m
//  OuttaTimeObjectiveC
//
//  Created by Keron Williams on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "OuttaTimeViewController.h"
#import "TimeCircutsViewController.h"


@interface OuttaTimeViewController () <DatePickerDelegate>

@end

@implementation OuttaTimeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lastTimeDeparted = @"--- -- ----";
    [self setDestinationLabel:@"--- -- ----"];
    
    self.currentSpeed = 0;
    //[self.lastTimeDeparted ]
    [self SetPresentTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) dateWasSelected:(NSDate *) seclectedDate
{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterNoStyle];
    [dateFormatter setDateFormat:@"MMM d, ''yy"];
    NSString *formatterDateString = [dateFormatter stringFromDate:seclectedDate];
    [self setDestinationLabel:formatterDateString];
    [self setLastTimeDeparted:self.lastTimeDeparted];
    self.lastTimeDeparted = formatterDateString;
    
    NSLog(@"this is the value: %@", formatterDateString);
}


-(void) setDestinationLabel:(NSString *) destination
{
    DestinationTimeLabel.text = destination;
}

-(void) SetPresentTime
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle: NSDateFormatterNoStyle];
    [dateFormatter setDateFormat:@"MMM d, ''yy"];
    self.currentDate = [NSDate date];
    NSString *formatterDateString = [dateFormatter stringFromDate:self.currentDate];
    [self setPresentTimeLabel:formatterDateString];
    NSLog(@"current time is: %@", formatterDateString);
    
    

}

-(void) setPresentTimeLabel:(NSString *) presentTime
{
    PresentTimeLabel.text = presentTime;
    NSLog(@"current time is: %@", presentTime);
}


-(void) setLastTimeDepartedLabel:(NSString *) lastTimeDeparted
{
    LastTimeDepartedLabel.text = lastTimeDeparted;
}


-(void) setSpeedLabel:(NSString *) speed
{
    //SpeedLabel.text = [NSString stringWithFormat:speed,"%@!",@"MPH"];
}

-(void) startTime
{
    self.timerBack = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(currentSpeed_UI) userInfo:nil repeats:true];
}
-(void) StopTimer
{
    [self.timerBack invalidate];
    self.timerBack = nil;
}

-(void) currentSpeed_UI
{
if (self.currentSpeed <= 87)
    {
        
        self.currentSpeed = self.currentSpeed +1;
        NSString * current = [NSString stringWithFormat:@"%id",self.currentSpeed];
        [self setSpeedLabel:current];
    }
    else
    {
        [self StopTimer];
        [self setLastTimeDeparted:PresentTimeLabel.text];
        [self setPresentTimeLabel:DestinationTimeLabel.text];
        self.currentSpeed = 0;
    }
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowTimeCircutsViewControllerSegue"])
    {
        UIViewController *newController = segue.destinationViewController;
        TimeCircutsViewController *dateVC = (TimeCircutsViewController *) newController;
        dateVC.delegate = self;
    }
}

@end
