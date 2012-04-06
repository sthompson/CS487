//
//  DetailViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtrasViewController.h"

@class Cart;

@interface DetailViewController : UIViewController<UITextFieldDelegate, ModalViewDelegate>


@property (strong, nonatomic) ExtrasViewController *extrasViewController;
@property (strong, nonatomic) Cart *cart;

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *itemName;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UITextField *quantity;
@property (weak, nonatomic) IBOutlet UITextField *seatNumber;

@property (strong, nonatomic) NSDictionary *menuItem;
@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSString *stadiumName;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(IBAction)extras:(id)sender;
-(IBAction)addItemToCart:(id)sender;

@end
