//
//  MovieDetailViewController.m
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController () 

    

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movie = [[NSDictionary alloc] init];
    
    NSDictionary *aMovie = _movie;
    _plot.text = [aMovie valueForKey:@"Plot"];
    NSURL *poster = [NSURL URLWithString:aMovie[@"Poster"]];
    NSData *imageData = [NSData dataWithContentsOfURL:poster];
    UIImage *image = [UIImage imageWithData:imageData];
    _movieImage.image = image;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
