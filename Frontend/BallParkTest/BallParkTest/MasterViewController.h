//
//  MasterViewController.h
//  BallParkTest
//
//  Created by Seth  Thompson on 2/14/12.
//  Copyright (c) 2012 Bradley University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSArray *restaurants;
@property (strong, nonatomic) NSDictionary *menus;
@property (strong, nonatomic) NSDictionary *names;

@end
