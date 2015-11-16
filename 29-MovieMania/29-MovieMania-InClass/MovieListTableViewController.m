//
//  MovieListTableViewController.m
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MovieListTableViewController.h"
#import "MovieCell.h"
#import "ChooseMovieViewController.h"
#import "MovieDetailTableViewController.h"
//#import "Movie.h"

@interface MovieListTableViewController () <UITableViewDelegate>
{
    NSMutableArray *movies;
}

@end

@implementation MovieListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    movies = [[NSMutableArray alloc] init];
    
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    Movie *aMovie = movies[indexPath.row];
    cell.movieTitleLabel.text = aMovie.title;
    NSURL *poster = [NSURL URLWithString:aMovie.posterString];
    
    aMovie.posterImageData = [NSData dataWithContentsOfURL:poster];
    UIImage *image = [UIImage imageWithData:aMovie.posterImageData];
    cell.movieImage.image = image;
    
    NSString *year = aMovie.year;
    NSString *rated = aMovie.rated;
    NSString *rating = aMovie.imdbRating;
    
    cell.year.text = [NSString stringWithFormat:@"Released: %@", year];
    cell.rated.text = [NSString stringWithFormat:@"Rated: %@", rated];
    cell.ratingLabel.text = [NSString stringWithFormat:@"IMDB Rating: %@", rating];
    
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [movies removeObjectAtIndex:indexPath.row];
        [tableView reloadData]; // tell table to refresh now
    }
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([segue.identifier isEqualToString:@"ShowSearchSegue"])

    {
        UINavigationController *navC = segue.destinationViewController;
        ChooseMovieViewController *chooseMovieVC = navC.viewControllers[0];
        chooseMovieVC.movies = movies;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Movie *aMovie = movies[indexPath.row];
    MovieDetailTableViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier: @"MovieDetail"];
    detailVC.movie = aMovie;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
}









@end

