//
//  MasterViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) MenuViewController *menuViewController;
@property (strong, nonatomic) NSArray *restaurants;


@end
