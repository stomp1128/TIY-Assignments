//
//  ViewController.m
//  29-MovieMania-InClass
//
//  Created by Chris Stomp on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "ChooseMovieViewController.h"

@interface ChooseMovieViewController () <NSURLSessionDataDelegate, UISearchBarDelegate>
{
//UITextField *movieTitleTextField;
NSMutableData *receivedData;
}

@property (weak, nonatomic)IBOutlet UISearchBar *movieSearchBar;

@end

@implementation ChooseMovieViewController

- (void)viewDidLoad
{
    self.movieSearchBar.delegate = self;
    [_movieSearchBar becomeFirstResponder];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}


- (void)search
{
    NSString *movie = self.movieSearchBar.text;
    NSString *urlString = [NSString stringWithFormat:@"https://www.omdbapi.com/?t=%@&y=&plot=full&r=json", movie];
    
    NSString *formattedString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSURL *url = [NSURL URLWithString:formattedString];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    [task resume];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)movieSearchBar
{
    [self search];
    [movieSearchBar resignFirstResponder];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - NSURLSessionData Delegate

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] init];
    }
    [receivedData appendData:data];
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download successful");
        NSDictionary *movieInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
//        self.movies = [[NSMutableArray alloc] initWithObjects:movieInfo, nil];
        [self.movies addObject:movieInfo];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        
    }
}


- (IBAction)searchButtonTapped:(UIButton *)sender
{
    [self search];
    
}

- (IBAction)cancelButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
   // [self cancel];
}


@end
