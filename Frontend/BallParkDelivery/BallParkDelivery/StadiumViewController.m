//
//  StadiumViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "StadiumViewController.h"
#import "Model.h"
#import "AlertViewWithIndicator.h"


@implementation StadiumViewController

@synthesize restaurantViewController = _restaurantViewController;
@synthesize locationViewController = _locationtViewController;
@synthesize stadiums,latitude,longitude,locationAlert,cart,userKey,delegate,tableview,lastIndexPath;
@synthesize finishedButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Stadiums";
    self.locationViewController = [[LocationViewController alloc] init];
    self.locationViewController.delegate = self;
    [self startLocationAlert];
    [self.locationViewController startStandardUpdates];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//Alert
-(void) startLocationAlert
{
    if (locationAlert == nil)
    {
        locationAlert = [[AlertViewWithIndicator alloc] initWithTitle:@"Searching for Nearby Stadiums\nPlease Wait..." 
                                                          message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
        self.locationAlert.indicator = [[UIActivityIndicatorView alloc]
                                        initWithActivityIndicatorStyle:
                                        UIActivityIndicatorViewStyleWhiteLarge];
        [self.locationAlert addSubview:self.locationAlert.indicator];
    }
    locationAlert.shouldAnimate = YES;
    [locationAlert show];
}


- (void)willPresentAlertView:(AlertViewWithIndicator *)alertView
{
    if(alertView.shouldAnimate)
    {
        alertView.indicator.center = CGPointMake(alertView.bounds.size.width / 2, alertView.bounds.size.height - 50);
        [alertView.indicator startAnimating];
    }
}
    
    

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [stadiums count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell...
    cell.textLabel.text = [[stadiums objectAtIndex:indexPath.row]objectForKey:@"stadium_name"];
    return cell;
}

- (void) locationFinishedUpdating:(id)sender
{
    longitude = self.locationViewController.longitude;
    latitude = self.locationViewController.latitude;
    stadiums = [Model getStadiumsWithLongitude:longitude andLatitude:latitude];
    [self.tableview reloadData];
    [self.locationAlert dismissWithClickedButtonIndex:0 animated:YES];
    [self.locationAlert.indicator stopAnimating];
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
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* newCell = [tableView cellForRowAtIndexPath:indexPath]; 
    int newRow = [indexPath row]; 
    int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1; 
    
    if(newRow != oldRow) 
    { 
        newCell.accessoryType = UITableViewCellAccessoryCheckmark; 
        UITableViewCell* oldCell = [tableView cellForRowAtIndexPath:lastIndexPath]; 
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = indexPath; 
    } 
    else
    {
        newCell.accessoryType = UITableViewCellAccessoryNone;
        lastIndexPath = nil;
    }
}

-(IBAction)finished:(id)sender
{
    if(lastIndexPath == nil)
        [delegate selectedStadium:nil fromSender:self];
    else
        [delegate selectedStadium:[[stadiums objectAtIndex:lastIndexPath.row]objectForKey:@"stadium_name"]  fromSender:self];
}


@end
