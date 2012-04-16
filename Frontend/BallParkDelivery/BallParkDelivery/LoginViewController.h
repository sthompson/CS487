//
//  LoginViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/16/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>

@property(weak, nonatomic) IBOutlet UITextField *username;
@property(weak, nonatomic) IBOutlet UITextField *password;
@property(weak, nonatomic) IBOutlet UITextField *seatNumber;
@property(weak, nonatomic) IBOutlet UIButton *loginButton;
@property(weak, nonatomic) IBOutlet UIButton *registerButton;
@property (nonatomic, retain) IBOutlet UIScrollView *scroller;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)attemptLogin:(id)sender;

@end
