//
//  DetailViewController.m
//  BallParkTest
//
//  Created by Seth  Thompson on 2/14/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//
#import "DetailViewController.h"
#import "OrderPageController.h"
#import "MasterViewController.h"


@implementation DetailViewController

@synthesize logoname, page, restaurantName, menuList;


#pragma mark - Managing the detail item



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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Menu";
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [[menu valueForKey:@"menu"]count];
    return [menuList count];
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
    //cell.textLabel.text = [[[menu valueForKey:@"menu"]objectAtIndex:indexPath.row]valueForKey:@"name"];
    cell.textLabel.text = [menuList objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.page = [[OrderPageController alloc] initWithNibName:@"OrderPageController" bundle:nil];    
    NSString *urlString = [NSString stringWithFormat:
                           @"http://sharp-sunrise-9199.herokuapp.com/fooditem/%@/",
                           [menuList objectAtIndex:indexPath.row]];
    NSString *urlFormattedString = [urlString stringByAddingPercentEscapesUsingEncoding:
                                    NSASCIIStringEncoding];
    self.page.menuItem = (NSDictionary *)[MasterViewController getDataFromURLString:urlFormattedString];

    

    [self.navigationController pushViewController:self.page animated:YES];
}
							
@end
