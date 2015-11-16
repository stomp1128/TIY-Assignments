//
//  ViewController.m
//  29-MovieMania
//
//  Created by Chris Stomp on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () <NSURLSessionDataDelegate>


{
    
    __weak IBOutlet UITextField *movieTitleTextField;
    
    

NSMutableData *receivedData;
}

@end

@implementation SearchViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
    [movieTitleTextField becomeFirstResponder];
    movieTitleTextField.placeholder = @"Enter Movie Title";
}

- (void) search
    {
        NSString * movieTitle = movieTitleTextField.text;
        
        NSString * urlString = [NSString stringWithFormat:@"https:www.omdbapi.com/?t=%@&y=&plot=full&r=json",movieTitle];
        NSURL * url = [NSURL URLWithString:urlString];
        
        //NSURLRequest * request = [NSURLRequest requestWithURL:url];
        
        //NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        //NSDictionary * userInfo = [NSJSONSerialization JSONObjectWithData:responseData
        //                                                              options:NSJSONReadingMutableContainers
        //                                                                error:nil];
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration
        delegate:self
        delegateQueue:[NSOperationQueue mainQueue]];
        
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
        
        [dataTask resume];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSURLSessionData delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [receivedData appendData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download successful");
        NSDictionary *movieInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:nil];
        [self.movies addObject:movieInfo];
        
    }
}




#pragma mark - Action Handlers

- (IBAction)searchButtonTapped:(UIButton *)sender
{
    [self search];
}

@end
