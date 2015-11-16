//
//  MovieDetailTableViewController.h
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UITextView *plotTextField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic) Movie *movie;

@end
