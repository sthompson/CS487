//
//  ExtrasViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "ExtrasViewController.h"

@implementation ExtrasViewController

@synthesize tableview,finished,extras,delegate,selectedRows,extraNames;

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
    // Do any additional setup after loading the view from its nib.
    selectedRows = [[NSMutableArray alloc] init];
    extraNames = [[NSMutableArray alloc] init];
    for (int i = 0; i<[extras count]; i++) 
    {
        [selectedRows addObject:[NSNumber numberWithBool:NO]];
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)finished:(id)sender
{
    for (int i = 0; i<[extras count]; i++) 
    {
        if ([[selectedRows objectAtIndex:i] boolValue]) 
        {
            [extraNames addObject:[[NSString alloc]initWithString: [[extras objectAtIndex:i] objectForKey:@"extra_name"]]];
        }
    }
    [delegate userFinished:self withInfo:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [extras count];
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
    cell.textLabel.text = [[extras objectAtIndex:indexPath.row] objectForKey:@"extra_name"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[selectedRows objectAtIndex:indexPath.row]boolValue])
    {
        [selectedRows replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:NO]];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    }
    else
    {
        [selectedRows replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:YES]];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
}




@end
