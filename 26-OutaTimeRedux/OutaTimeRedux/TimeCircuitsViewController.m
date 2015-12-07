//
//  ViewController.m
//  OutaTimeRedux
//
//  Created by Chris Stomp on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TimeCircuitsViewController.h"
#import "DatePickerViewController.h"

@interface TimeCircuitsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *destinationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *presentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeDepartedLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (nonatomic) int currentSpeed;
@property (nonatomic) NSTimer *timer;


-(IBAction)setDestinationTimeTapped:(UIButton *)sender;
-(IBAction)travelBackTapped:(UIButton *)sender;

NSString *dateWasChosen(NSDate *);

@end

@implementation TimeCircuitsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentSpeed = 0;
    self.presentTimeLabel.text = [self dateFormat:[NSDate date]];
    self.speedLabel.text = @"O MPH";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DatePickerViewController* datePickerVC = (DatePickerViewController *)segue.destinationViewController;
    datePickerVC.delegate = self;
}

- (void) startTimer
    {
        if (self.timer == nil)
        {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateSpeed) userInfo:nil repeats:YES];
        }
    }

- (void) updateSpeed
{
    if (self.currentSpeed < 88)
    {
        self.currentSpeed += 1;
    }
    else
    {
        [self.timer invalidate];
        self.currentSpeed = 0;
        self.lastTimeDepartedLabel.text = self.presentTimeLabel.text;
        //self.presentTimeLabel.text;
        self.presentTimeLabel.text = self.destinationTimeLabel.text;
    }
    
    self.speedLabel.text =[NSString stringWithFormat:@"%d MPH", self.currentSpeed];
}


#pragma mark - Action Handlers


- (IBAction)travelBackTapped:(UIButton *)sender
{
    [self startTimer];
}

#pragma mark - Date Picker Delegate

- (void) dateWasChosen:(NSDate *)date;
{
    NSString *dateString = [self dateFormat:date];
    self.destinationTimeLabel.text = dateString;
}

- (NSString *) dateFormat:(NSDate *)date;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    
    [dateFormatter setDateFormat:@"MMM dd YYYY"];
    NSString *formattedTime = [dateFormatter stringFromDate:date];
    NSString *capitalizedTime = [formattedTime uppercaseString];
    return capitalizedTime;
}

@end
