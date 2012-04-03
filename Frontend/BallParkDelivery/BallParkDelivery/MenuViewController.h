//
//  MenuViewController.h
//  BallParkDelivery
//
//  Created by Seth  Thompson on 4/2/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UITableViewController

@property (strong, nonatomic) NSString *restaurantName;
@property (strong, nonatomic) NSArray *menuList;

@end
