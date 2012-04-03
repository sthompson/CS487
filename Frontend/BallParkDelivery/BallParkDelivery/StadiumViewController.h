//
//  StadiumViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RestaurantViewController;

@interface StadiumViewController : UITableViewController

@property (strong, nonatomic) RestaurantViewController *restaurantViewController;
@property (strong, nonatomic) NSArray *stadiums;

@end
