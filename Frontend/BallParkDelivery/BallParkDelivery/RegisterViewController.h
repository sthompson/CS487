//
//  RegisterViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/16/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterDelegate <NSObject>

-(void) userRegistered:(id)sender;

@end

@interface RegisterViewController : UIViewController<UITextFieldDelegate>

@property(weak, nonatomic) IBOutlet UITextField *username;
@property(weak, nonatomic) IBOutlet UITextField *password;
@property(weak, nonatomic) IBOutlet UITextField *name;
@property(weak, nonatomic) IBOutlet UITextField *year;
@property(weak, nonatomic) IBOutlet UITextField *ccnumber;
@property(weak, nonatomic) IBOutlet UILabel *month;
@property(weak, nonatomic) IBOutlet UIStepper *stepper;
@property(weak, nonatomic) IBOutlet UIButton *registerButton;

@property (nonatomic, assign) id<RegisterDelegate> delegate;

-(IBAction)registerUser:(id)sender;
-(IBAction)clickStepper:(id)sender;


@end
