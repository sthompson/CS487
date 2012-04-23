//
//  RegisterViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/16/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RegisterDelegate <NSObject>

-(void) finishedRegistering:(id) sender;

@end

@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property(weak, nonatomic) IBOutlet UITextField *username;
@property(weak, nonatomic) IBOutlet UITextField *password;
@property(weak, nonatomic) IBOutlet UITextField *name;
@property(weak, nonatomic) IBOutlet UIPickerView *year;
@property(weak, nonatomic) IBOutlet UITextField *ccnumber;
@property(weak, nonatomic) IBOutlet UIPickerView *month;
@property(weak, nonatomic) IBOutlet UIButton *registerButton;
@property(weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (nonatomic, retain) IBOutlet UIScrollView *scroller;
@property(strong, nonatomic) NSArray *years;
@property(strong, nonatomic) NSArray *months;

@property (nonatomic, assign) id<RegisterDelegate> delegate;

-(IBAction)registerUser:(id)sender;
-(IBAction)cancel:(id)sender;


@end
