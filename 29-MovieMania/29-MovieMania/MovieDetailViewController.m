//
//  MovieDetailViewController.m
//  29-MovieMania
//
//  Created by Chris Stomp on 11/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark - Action Handlers

- (IBAction)backButtonTapped:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
