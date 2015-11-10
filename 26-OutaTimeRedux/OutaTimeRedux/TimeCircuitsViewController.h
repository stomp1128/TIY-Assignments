//
//  ViewController.h
//  OutaTimeRedux
//
//  Created by Chris Stomp on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DatePickerProtocol

- (void)dateWasChosen:(NSDate *)date;

@end

@interface TimeCircuitsViewController : UIViewController <DatePickerProtocol>



@end






