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

@synthesize username,password,name,ccnumber,year,month,registerButton,delegate,scroller;
@synthesize cancelButton;
@synthesize years,months;

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
    scroller.contentSize = scroller.frame.size;
    [scroller setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.years = [[NSArray alloc] initWithObjects:@"2012",@"2013",@"2014",@"2015",@"2016",@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023",@"2024",@"2025", nil];
    self.months = [[NSArray alloc] initWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December",nil];
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

-(IBAction)cancel:(id)sender
{
    [delegate finishedRegistering:self];
}

-(IBAction)registerUser:(id)sender
{
    NSString *selectedMonth = [NSString stringWithFormat:@"%d",
                               [month selectedRowInComponent:0]+1];
    NSString *selectedYear = [years objectAtIndex:[year selectedRowInComponent:0]];
    NSString *response = [Model registerUser:name.text withUsername:username.text andPassword:password.text andCCNum:ccnumber.text andCCYear:selectedYear andCCMonth:selectedMonth];
    if ([response isEqualToString:@"True"]) 
        [delegate finishedRegistering:self];
    else
    {
        UIAlertView *userTaken = [[UIAlertView alloc] initWithTitle:nil message:response delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [userTaken show];
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

/*
 *  Picker view datasource
 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == year) 
        return [years count];
    else
        return [months count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    if (pickerView == year) 
        return [years objectAtIndex:row];
    else
        return [months objectAtIndex:row];
    
}

@end
