//
//  DatePickerViewController.h
//  OutaTimeRedux
//
//  Created by Chris Stomp on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCircuitsViewController.h"

@interface DatePickerViewController : UIViewController

@property (nonatomic) id<DatePickerProtocol> delegate;

@end
