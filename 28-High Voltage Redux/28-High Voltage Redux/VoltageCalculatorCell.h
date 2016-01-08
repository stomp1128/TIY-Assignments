//
//  VoltageCalculatorCell.h
//  28-High Voltage Redux
//
//  Created by Chris Stomp on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoltageCalculatorCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *electricityType;
@property (weak, nonatomic) IBOutlet UITextField *value;

@end
