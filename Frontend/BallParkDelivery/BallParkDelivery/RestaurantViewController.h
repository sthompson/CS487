//
//  MasterViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartViewController.h"
#import "StatusViewController.h"


@class MenuViewController;
@class Cart;
@class CategoryViewController;

@interface RestaurantViewController : UITableViewController<CartDelegate,NSFetchedResultsControllerDelegate,StatusDelegate>

@property (strong, nonatomic) MenuViewController *menuViewController;
@property (strong, nonatomic) CategoryViewController *categoryVC;
@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) NSArray *restaurants;
@property (strong, nonatomic) NSString *stadiumName;
@property (strong, nonatomic) NSString *userKey;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong) IBOutlet UITableViewCell *tableViewCell;



@end
