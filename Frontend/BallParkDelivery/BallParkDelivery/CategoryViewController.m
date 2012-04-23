//
//  CategoryViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/17/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "CategoryViewController.h"
#import "MenuViewController.h"

@implementation CategoryViewController

@synthesize categories,menu,restaurantName,stadiumName,cart,userKey,count;
@synthesize menuViewController = _menuViewController;
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void) deleteEmptyCategories
{
    int corr = 0;
    int cnt = 0;
    for (NSNumber *num in self.count) 
    {
        if (num.intValue == 0) 
        {
            [categories removeObjectAtIndex:(cnt-corr)];
            corr++;
        }
        cnt++;
    }
}
-(void) checkCategories
{
    for (NSArray *item in menu)
    {
        NSString *cat = [item valueForKey:@"item_type"];
        NSInteger index = [categories indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) 
        {
            return [cat isEqualToString:(NSString *)obj];
        }];
        [self.count replaceObjectAtIndex:index withObject:
         [NSNumber numberWithInt:([[self.count objectAtIndex:index]intValue]+1)]];
    }
    [self deleteEmptyCategories];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Category";
    
    self.categories = [[NSMutableArray alloc] initWithObjects:@"Appetizers",@"Desserts",@"Drinks",@"Main Dishes",@"Side Dishes", nil];
    
    self.count = [[NSMutableArray alloc]init];
    for (int i = 0; i<[categories count]; i++) 
    {
        [self.count addObject:[NSNumber numberWithInt:0]];
    }
    [self checkCategories];

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // Configure the cell...
    cell.textLabel.text = [categories objectAtIndex:indexPath.row];
    
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
    NSIndexSet *indexSet = [menu indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) 
    {
        return [[(NSDictionary *)obj valueForKey:@"item_type"] isEqualToString:[categories objectAtIndex:indexPath.row]];
    }];
    
    NSArray *menuSubset = [menu objectsAtIndexes:indexSet];
    
    if (!self.menuViewController) {
        self.menuViewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    }
    self.menuViewController.restaurantName = self.restaurantName;
    self.menuViewController.menuList = menuSubset;
    self.menuViewController.stadiumName = self.stadiumName;
    self.menuViewController.cart = self.cart;
    self.menuViewController.navigationItem.rightBarButtonItems = self.navigationItem.rightBarButtonItems;
    self.menuViewController.managedObjectContext = self.managedObjectContext;
    self.menuViewController.userKey = self.userKey;
    
    [self.navigationController pushViewController:self.menuViewController animated:YES];
                        
}

@end
