//
//  StadiumViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"

@class AlertViewWithIndicator;
@class RestaurantViewController;
@class Cart;


@interface StadiumViewController : UITableViewController<LocationDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) RestaurantViewController *restaurantViewController;
@property (strong, nonatomic) LocationViewController *locationViewController;
@property (strong, nonatomic) AlertViewWithIndicator *locationAlert;
@property (strong, nonatomic) Cart *cart;
@property (strong, nonatomic) NSArray *stadiums;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *userKey;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void) startLocationAlert;


@end
