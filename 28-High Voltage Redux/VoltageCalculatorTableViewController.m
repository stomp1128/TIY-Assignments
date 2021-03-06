//
//  VoltageCalculatorTableViewController.m
//  28-High Voltage Redux
//
//  Created by Chris Stomp on 11/11/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "VoltageCalculatorTableViewController.h"
#import "ValueTypesTableViewController.h"

@interface VoltageCalculatorTableViewController ()

{
    NSMutableArray *electricityTypes;
    NSMutableArray *remainingElectricityTypes;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *clearBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addValueBarButtonItem;

@property (nonatomic) UITextField *electricityTextField;

@end

@implementation VoltageCalculatorTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"High Voltage";
    
   
    electricityTypes = [[NSMutableArray alloc] init];
    remainingElectricityTypes = [[NSMutableArray alloc] initWithObjects:@"Watts", @"Volts", @"Ohms", @"Amps", nil];
   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return electricityTypes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"ElectricityCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifierisEqualToString:@"ShowValueTypePopoverSegue"])
    {
    
    ValueTypesTableViewController *valuesViewController = (ValueTypesTableViewController *)[segue.destinationViewController];
    UIPopoverPresentationController *controller = valuesViewController.popoverPresentationController.delegate = self;
    valuesViewController.types = remainingElectricityTypes;
}


@end
