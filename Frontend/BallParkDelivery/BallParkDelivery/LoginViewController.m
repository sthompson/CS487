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
#import "RestaurantViewController.h"

@implementation LoginViewController

@synthesize username,password,loginButton,registerButton,seatNumber,scroller,userKey;
@synthesize restaurantViewController;
//@synthesize fetchedResultsController = __fetchedResultsController;
@synthesize managedObjectContext = __managedObjectContext;

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

- (void) viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWasShown:)
     name:UIKeyboardDidShowNotification
     object:nil];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification
     object:nil];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIKeyboardDidShowNotification
     object:nil];
    
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UIKeyboardWillHideNotification
     object:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField { 
    [textField resignFirstResponder];
    return YES;
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
            UIAlertView *badLogin = [[UIAlertView alloc] initWithTitle:nil message:@"Invalid Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [badLogin show];
        }
        else
        {
            StadiumViewController *stadiumViewController = [[StadiumViewController alloc] initWithNibName:@"StadiumViewController" bundle:nil];
            stadiumViewController.cart = [[Cart alloc]init];
            stadiumViewController.userKey = response;
            stadiumViewController.delegate = self;
            
            [self presentViewController:stadiumViewController animated:YES completion:nil];
        }
    }

}

-(void) keyboardWasShown:(NSNotification *)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    scroller.contentSize = scroller.frame.size;
    [scroller setFrame:CGRectMake(0, 0, scroller.frame.size.width, scroller.frame.size.height - kbSize.height)];
}


- (void) keyboardWillHide: (NSNotification *) aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    [scroller setFrame:CGRectMake(0, 0, scroller.frame.size.width, scroller.frame.size.height + kbSize.height)];
}

-(void)selectedStadium:(NSString *)stadiumName fromSender:(id)sender
{
    [sender dismissViewControllerAnimated:YES completion:nil];
    if (stadiumName != nil) 
    {
        if (!self.restaurantViewController) {
            self.restaurantViewController = [[RestaurantViewController alloc] initWithNibName:@"RestaurantViewController" bundle:nil];
        }
        self.restaurantViewController.stadiumName = stadiumName;
        self.restaurantViewController.restaurants = [Model getRestaurantsFromStadiumName:
                                                     stadiumName];
        self.restaurantViewController.cart = [[Cart alloc]init];
        self.restaurantViewController.managedObjectContext =self.managedObjectContext;
        self.restaurantViewController.userKey = self.userKey; 
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        [self.navigationController pushViewController:self.restaurantViewController animated:YES];

    }
    else
    {
        UIAlertView *noStadiums = [[UIAlertView alloc] initWithTitle:nil message:@"No Stadiums Selected!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [noStadiums show];
    }
}

@end
