//
//  LoginViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/16/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "LoginViewController.h"
#import "Model.h"
#import "StadiumViewController.h"
#import "Cart.h"

@implementation LoginViewController

@synthesize username,password,loginButton,registerButton,seatNumber;
@synthesize managedObjectContext;

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

-(IBAction)attemptLogin:(id)sender
{
    NSString *seatResponse = [Model updateSeatNumber:seatNumber.text WithUser:username.text];
    if ([seatResponse isEqual:@"False"])
    {
        UIAlertView *badUsername = [[UIAlertView alloc] initWithTitle:nil message:@"Invalid Username" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [badUsername show];
    }
    else
    {
        NSString *response = [Model loginWithUsername:username.text andPassword:password.text];
        if ([response isEqual:@"False"]) 
        {
            UIAlertView *badLogin = [[UIAlertView alloc] initWithTitle:nil message:@"Invalid Username or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [badLogin show];
        }
        else
        {
            StadiumViewController *stadiumViewController = [[StadiumViewController alloc] initWithNibName:@"StadiumViewController" bundle:nil];
            stadiumViewController.managedObjectContext = self.managedObjectContext;
            stadiumViewController.cart = [[Cart alloc]init];
            stadiumViewController.userKey = response;
            [self.navigationController pushViewController:stadiumViewController animated:YES];
        }
    }

}

@end
