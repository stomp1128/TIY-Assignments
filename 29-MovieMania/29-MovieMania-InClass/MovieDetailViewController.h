//
//  MovieDetailViewController.h
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *plot;


@property (nonatomic) Movie *movie;
//@property (nonatomic) NSDictionary *movie;


@end
