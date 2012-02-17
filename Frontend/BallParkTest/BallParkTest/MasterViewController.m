//
//  MasterViewController.m
//  BallParkTest
//
//  Created by Seth  Thompson on 2/14/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;
@synthesize restaurants, menus,names;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Restaurants";
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    restaurants = [[NSMutableArray alloc] initWithCapacity:10];
    [restaurants addObject: @"Hot Doug's"];
    [restaurants addObject: @"Gino's East"];
    [restaurants addObject: @"Al's"];
    [restaurants addObject: @"Khan's BBQ"];
    
    NSArray *hotdogs = [[NSArray alloc] initWithObjects:@"The Dog",@"The Elvis",@"The Paul Kelly",@"French Fries", @"Duck Fat Fries", nil];
    NSArray *ginos = [[NSArray alloc] initWithObjects:@"Sausage Slice",@"Pepperoni Slice",@"Chicago Fire Slice", @"Vegetarian Slice",@"Calzone", nil];
    NSArray *als = [[NSArray alloc] initWithObjects:@"Polish With Fries",@"Italian Sausage", @"Italian Beef", @"Burger", nil];
    NSArray *khans = [[NSArray alloc] initWithObjects:@"Tandoori Chicken", @"Frontier Beef",@"Bihari Kabab", @"Goat Qorma",nil];
    
    NSArray *list = [[NSArray alloc] initWithObjects:@"dougs.jpg",@"ginos.png",@"als.jpg",@"khans.png", nil];
    
    menus = [[NSDictionary alloc] initWithObjects:[[NSArray alloc] initWithObjects:hotdogs,ginos,als,khans, nil ] forKeys: restaurants];
    
    names = [[NSDictionary alloc] initWithObjects:list forKeys:restaurants];
    
    
    
    
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [restaurants count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    // Configure the cell.
    
    cell.textLabel.text = [restaurants objectAtIndex:[indexPath row]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    self.detailViewController.menu = [menus objectForKey:[restaurants objectAtIndex:[indexPath row]]];
    self.detailViewController.logoname = [names objectForKey:[restaurants objectAtIndex:[indexPath row]]];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
