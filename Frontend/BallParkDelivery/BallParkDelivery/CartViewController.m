//
//  CartViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/5/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "CartViewController.h"
#import "Cart.h"
#import "Order.h"
#import "CartCell.h"
#import "Model.h"

@implementation CartViewController

@synthesize total,order,tableview,cart,delegate,cancel,emptyAlert,orders,userKey;

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
    [self setTotalPrice];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(float) priceWithExtrasOfOrder: (Order *)ord
{
    float price = [ord.price floatValue];
    for (NSDictionary *extra in ord.extras)
    {
        price += [[extra objectForKey:@"extra_price"] floatValue];
    }
    return price;
}

-(float) getPriceTotal
{
    float price = 0;
    for (order in self.orders)
    {
        price += ([[order valueForKey:@"item_price"]floatValue] * [[order valueForKey:@"item_quantity"]intValue]);
    }
    return price;
}

-(void) setTotalPrice
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    total.text = [formatter stringFromNumber:[NSNumber numberWithFloat:[self getPriceTotal]]];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSString *itemKey = [[orders objectAtIndex:indexPath.row ] valueForKey:@"pk"];
        [orders removeObjectAtIndex:indexPath.row];
        [Model removeItem:itemKey fromUser:self.userKey];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self setTotalPrice];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableview setEditing:editing animated:animated];
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    CartCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CartCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    // Configure the cell...
    NSArray *thisOrder = [orders objectAtIndex:indexPath.row];
    if ([[thisOrder valueForKey:@"has_extra"]intValue] == 0)
        cell.name.text = [thisOrder valueForKey:@"item_name"];
    else
        cell.name.text = [NSString stringWithFormat:@"%@ w/ extra(s)",[thisOrder valueForKey:@"item_name"]];
    cell.quantity.text = [NSString stringWithFormat:@"x%@",
                          [thisOrder valueForKey:@"item_quantity"]];
    

    
    cell.price.text = [formatter stringFromNumber:[NSNumber numberWithFloat:([[thisOrder valueForKey:@"item_price"]floatValue]*[[thisOrder valueForKey:@"item_quantity"]intValue])]];
    return cell;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [orders count];
}

-(IBAction)placeOrder:(id)sender
{
    /*if ([cart.orders count]==0) 
    {
        if (self.emptyAlert == nil)
        {
            self.emptyAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Your Cart is Empty" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        }
        [self.emptyAlert show];
        return;
    }
    [cart placeOrder];
    [cart.orders removeAllObjects];
    [delegate orderPlaced:self];*/
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView == self.emptyAlert) 
    {
        [delegate orderCancelled:self];
    }
}

-(IBAction)cancelOrder:(id)sender
{
    [delegate orderCancelled:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
