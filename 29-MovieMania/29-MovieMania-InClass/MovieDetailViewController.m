//
//  MovieDetailViewController.m
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "ChooseMovieViewController.h"


@interface MovieDetailViewController () 
{
    NSDictionary *searchResults;
    NSMutableData *receivedData;
    NSURLSessionDataTask *task;
    
  
}


@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.movie = [[NSDictionary alloc] init];
    _plot.text = _movie.plot;
    
    
    NSURL *poster = [NSURL URLWithString:self.movie.posterString];
    NSData *imageData = [NSData dataWithContentsOfURL:poster];
    UIImage *image = [UIImage imageWithData:imageData];
    self.movieImage.image = image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
