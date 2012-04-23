//
//  CategoryViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/17/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Cart;
@class MenuViewController;

@interface CategoryViewController : UITableViewController

@property(strong,nonatomic) NSMutableArray *categories;
@property(strong,nonatomic) NSMutableArray *count;
@property(strong,nonatomic) NSArray *menu;
@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSString *stadiumName;
@property (strong, nonatomic) Cart *cart;

@property (strong, nonatomic) NSString *userKey;

@property (strong, nonatomic) MenuViewController *menuViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
