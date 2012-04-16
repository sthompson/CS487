//
//  RegisterViewController.m
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/16/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import "RegisterViewController.h"
#import "Model.h"

@implementation RegisterViewController

@synthesize username,password,name,ccnumber,year,month,stepper,registerButton,delegate;

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

-(IBAction)clickStepper:(id)sender
{
    month.text = [[NSNumber numberWithDouble:stepper.value] stringValue];
}

-(IBAction)registerUser:(id)sender
{
    NSString *response = [Model registerUser:name.text withUsername:username.text andPassword:password.text andCCNum:ccnumber.text andCCYear:year.text andCCMonth:month.text];
    if ([response isEqualToString:@"True"]) 
        [delegate userRegistered:self];
    else
    {
        UIAlertView *userTaken = [[UIAlertView alloc] initWithTitle:nil message:@"Username Taken" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [userTaken show];
    }

}

@end
