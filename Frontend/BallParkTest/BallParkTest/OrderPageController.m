//
//  OrderPageController.m
//  BallParkTest
//
//  Created by Seth  Thompson on 2/14/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "OrderPageController.h"

@implementation OrderPageController
@synthesize logo,menuItem,itemName,delivery,price,priceDelivery;

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

    [itemName setTextAlignment:UITextAlignmentCenter];
    [itemName setText:[menuItem valueForKey:@"name"]];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:2];
    [formatter setMinimumFractionDigits:2];
    
    [price setText:[formatter stringFromNumber:[menuItem valueForKey:@"price"]]];
    [priceDelivery setText:[formatter stringFromNumber:delivery]];
    
    // Set Image
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:[menuItem objectForKey:@"itemURL"]]];
    logo.image = [UIImage imageWithData:imageData];
    
    
    
    
    
    
}

- (void)viewDidUnload
{
    [self setLogo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
