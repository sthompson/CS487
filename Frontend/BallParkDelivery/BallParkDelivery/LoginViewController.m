//
//  LoginViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/16/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "LoginViewController.h"
#import "Model.h"

@implementation LoginViewController

@synthesize username,password,loginButton,registerButton,seatNumber;

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
    NSString *response = [Model loginWithUsername:username.text andPassword:password.text];
    if ([response isEqual:@"False"]) 
    {
        UIAlertView *badLogin = [[UIAlertView alloc] initWithTitle:nil message:@"Invalid Username or Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [badLogin show];
    }
    else
    {
        
    }
}

@end
