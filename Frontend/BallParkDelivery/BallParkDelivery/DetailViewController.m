//
//  DetailViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "DetailViewController.h"
#import "ExtrasViewController.h"
#import "Model.h"
#import "Order.h"
#import "Cart.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize extrasViewController = _extrasViewController;
@synthesize logo,menuItem,itemName,price,restaurantName,stadiumName,cart,quantity,seatNumber;
@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;

#pragma mark - Managing the detail item


- (void)configureView
{
    [itemName setTextAlignment:UITextAlignmentCenter];
    [itemName setText:[menuItem valueForKey:@"item_name"]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    
    [price setText:[NSString stringWithFormat:@"$%@",
                    [menuItem valueForKey:@"item_price"]]];
    NSData *imageData = [Model getImageFromURL:[menuItem valueForKey:@"picture_url"]];
    logo.image = [UIImage imageWithData:imageData];
    logo.contentMode = UIViewContentModeScaleAspectFill;
    
    // Set Image
    /*NSData *imageData = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:[menuItem objectForKey:@"itemURL"]]];
    logo.image = [UIImage imageWithData:imageData];*/


}

- (void) userFinished:(id)sender withInfo:(NSArray*) info
{
    [sender dismissViewControllerAnimated:YES completion:nil];
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
    [self configureView];
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
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}



- (IBAction) extras:(id)sender
{
    
    self.extrasViewController = [[ExtrasViewController alloc] initWithNibName:@"ExtrasViewController" bundle:nil];
    
    self.extrasViewController.extras = [Model getExtrasFromStadiumName:stadiumName andRestaurantName:restaurantName];
    self.extrasViewController.delegate = self;
    [self presentViewController:self.extrasViewController animated:YES completion:nil];
}

- (IBAction)addItemToCart:(id)sender
{
    Order *order = [[Order alloc]init];
    order.stadiumName = self.stadiumName;
    order.restaurantName = self.restaurantName;
    order.itemName = [menuItem objectForKey:@"item_name"];
    order.quantity = quantity.text;
    order.seatNumber = seatNumber.text;
    order.price = [menuItem objectForKey:@"item_price"];
    if (self.extrasViewController == nil)
        order.extras = nil;
    else
        order.extras = self.extrasViewController.extrasChosen;
    if (cart.orders == nil) 
    {
        cart.orders = [[NSMutableArray alloc]init];
    }
    [cart.orders addObject:order];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
							
@end
