//
//  MenuViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;
@class Cart;

@interface MenuViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSString *stadiumName;
@property (strong, nonatomic) NSArray *menuList;
@property (strong, nonatomic) NSString *userKey;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
