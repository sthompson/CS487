//
//  DetailViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtrasViewController.h"

@interface DetailViewController : UIViewController<UITextFieldDelegate, ModalViewDelegate>


@property (strong, nonatomic) ExtrasViewController *extrasViewController;

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *price;

@property (strong, nonatomic) NSDictionary *menuItem;
@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSString *stadiumName;

-(IBAction)extras:(id)sender;

@end
