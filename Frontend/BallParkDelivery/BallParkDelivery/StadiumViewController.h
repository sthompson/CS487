//
//  StadiumViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/3/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"
@class RestaurantViewController;


@interface StadiumViewController : UITableViewController<LocationDelegate>

@property (strong, nonatomic) RestaurantViewController *restaurantViewController;
@property (strong, nonatomic) LocationViewController *locationViewController;
@property (strong, nonatomic) NSArray *stadiums;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;


@end
