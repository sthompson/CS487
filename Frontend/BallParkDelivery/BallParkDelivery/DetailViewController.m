//
//  DetailViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize logo,menuItem,itemName,price;

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
    
    // Set Image
    /*NSData *imageData = [[NSData alloc] initWithContentsOfURL:
                         [NSURL URLWithString:[menuItem objectForKey:@"itemURL"]]];
    logo.image = [UIImage imageWithData:imageData];*/


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
							
@end
