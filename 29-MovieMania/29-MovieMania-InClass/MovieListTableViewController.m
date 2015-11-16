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
#import "MovieDetailViewController.h"

@interface MovieListTableViewController () <UITableViewDelegate>
{
    NSMutableArray *movies;
}

@end

@implementation MovieListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    movies = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    
    NSDictionary *aMovie = movies[indexPath.row];
    cell.movieTitleLabel.text = [aMovie valueForKey:@"Title"];//step 17 set cell based on dictionary in json
//    NSURL *poster = [NSURL URLWithString:aMovie[@"Poster"]];
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithURL
//    cell.imageView.image = image;
    NSURL *poster = [NSURL URLWithString:aMovie[@"Poster"]];
    NSData *imageData = [NSData dataWithContentsOfURL:poster];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.movieImage.image = image;
    
    NSString *year = [aMovie valueForKey:@"Year"];
    NSString *rated = [aMovie valueForKey:@"Rated"];
    
    cell.year.text = [NSString stringWithFormat:@"Year: %@", year];
    cell.rated.text = [NSString stringWithFormat:@"Rated: %@", rated];
    
    
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


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


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

//- (void)tableView:(UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//
//{
//    
//    let aHero = heroes[indexPath.row]
//    let vc = storyboard?.instantiateViewControllerWithIdentifier("HeroDetailViewController") as! HeroDetailViewController
//    vc.hero = aHero
//    navigationController?.pushViewController(vc, animated: true)
//    
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *aMovie = movies[indexPath.row];
    MovieDetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier: @"MovieDetail"];
    detailVC.movie = aMovie;
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
}









@end

